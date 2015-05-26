package com.tianex.pinenjoy.web;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Image;
import com.tianex.pinenjoy.service.AccountService;
import com.tianex.pinenjoy.service.ImageService;
import com.tianex.pinenjoy.util.HttpUtils;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Controller
@RequestMapping("/image")
public class ImageController {

    private ImageService imageService;
    private JmsTemplate jmsTemplate;
    private AccountService accountService;

    @RequestMapping(value = "/{imageId}/collect", method = RequestMethod.GET)
    @ResponseBody
    public String collect(@PathVariable String imageId, HttpServletRequest request) {
        Account account = (Account) request.getAttribute(Constant.CURRENT_ACCOUNT);

        accountService.collectSuccess(account, imageId);

        return "订阅成功！";
    }

    @RequestMapping(value = "/{imageId}/uncollect", method = RequestMethod.GET)
    @ResponseBody
    public String unCollect(@PathVariable String imageId, HttpServletRequest request) {
        Account account = (Account) request.getAttribute(Constant.CURRENT_ACCOUNT);

        accountService.unCollectSuccess(account, imageId);

        return "已取消订阅！";
    }

    @RequestMapping("/{imageId}/detail")
    public String detail(@PathVariable String imageId, Model model, HttpServletRequest request) {
        Account currentAccount = (Account) request.getSession().getAttribute(Constant.CURRENT_ACCOUNT);
        model.addAttribute("currentAccount", currentAccount);

        Image currentImage = imageService.findImageByImageId(imageId);
        model.addAttribute("currentImage", currentImage);

        Account uploadAccount = accountService.findAccountByUsername(currentImage.getImageAccountNickname());
        model.addAttribute("uploadAccount", uploadAccount);

        return "detail";
    }

    @RequestMapping(value = "/{imageId}/download", method = RequestMethod.GET)
    @ResponseBody
    public String download(@PathVariable String imageId, HttpServletResponse response, Model model, HttpServletRequest req) {
        try {
            Image image = imageService.findImageByImageId(imageId);

            String basePath = HttpUtils.getWebProjectPath();
            String imagePath = basePath + image.getImageLocation();

            File file = new File(imagePath);
            if (!file.exists()) {
                return "this image is remove！";
            }

            response.setContentType("application/x-msdownload");
            response.setHeader("Content-disposition", "attachment; filename=" + new String(imagePath.getBytes("utf-8"), "ISO8859-1"));

            FileInputStream in = new FileInputStream(file);
            OutputStream out = response.getOutputStream();
            byte[] buf = new byte[1024];
            int len = 0;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            out.flush();
            out.close();
            in.close();

            imageService.downloadImageSuccess(image);
        } catch (IOException e) {
            return "出错了";
        }
        return "下载成功！";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public String upload(@RequestParam("imageFile") final MultipartFile imageFile, Image image, HttpServletRequest request) {
        if (imageFile.isEmpty()) {
            return "请选择上传的图片！";
        }

        Account account = (Account) request.getSession().getAttribute(Constant.CURRENT_ACCOUNT);

        String location = Constant.USER_IMAGE_LOCATION + "/" + imageFile.getOriginalFilename();

        jmsTemplate.send("pp.uploadImage.queue", new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                return session.createObjectMessage((Serializable) imageFile);
            }
        });
        imageService.uploadImageSuccess(location, account, image);

        return "上传成功！";
    }

    @RequestMapping("/{username}/all/{pageNo}")
    @ResponseBody
    public Page<Image> getImagesByJSON(@PathVariable String username, @PathVariable int pageNo) {
        System.out.println(pageNo + username);
        return imageService.pageQueryByUsername(username, pageNo, Page.DEFAULT_PAGE_SIZE);
    }

    /**
     * 点赞处理方法
     * @param imageId 被点赞的图片Id
     */
    @RequestMapping("/{imageId}/like")
    public void doSupport(String imageId) {
        Image image = imageService.findImageByImageId(imageId);
        image.setImageLikeCount(image.getImageLikeCount() + 1);
        imageService.update(image);
    }

    @RequestMapping("/{imageId}/dislike")
    public void doNotSupport(String imageId) {
        Image image = imageService.findImageByImageId(imageId);
        image.setImageDislikeCount(image.getImageDislikeCount() + 1);
        imageService.update(image);
    }

    @Resource
    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

    @Resource
    public void setJmsTemplate(JmsTemplate jmsTemplate) {
        this.jmsTemplate = jmsTemplate;
    }

    @Resource
    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }

}
