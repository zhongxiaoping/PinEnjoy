package com.tianex.pinenjoy.web;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Cataloge;
import com.tianex.pinenjoy.domain.Image;
import com.tianex.pinenjoy.service.AccountService;
import com.tianex.pinenjoy.service.CatalogeService;
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
import java.util.List;

@Controller
@RequestMapping("/image")
public class ImageController {

    private ImageService imageService;
    private JmsTemplate jmsTemplate;
    private AccountService accountService;
    private CatalogeService catalogeService;

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

        Cataloge cataloge = catalogeService.findCatalogeByCatalogeName(currentImage.getImageCatalogeName());
        model.addAttribute("currentCataloge", cataloge);

        Account imageAccount = accountService.findAccountByUsername(currentImage.getImageAccountNickname());
        model.addAttribute("imageAccount", imageAccount);

        Page<Image> otherImages = imageService.pageQueryByUsername(currentImage.getImageAccountNickname(), 1, 6);
        model.addAttribute("otherImages", otherImages.getData());

        List<Image> recommendedImages = imageService.findRecommendedByImage(
                currentImage, 4);
        model.addAttribute("recommendedImages", recommendedImages);

        Page<Image> hotImages = imageService.pageQueryAllForHot(1, 12);
        model.addAttribute("hotImages", hotImages.getData());

        return "detail";
    }

    @RequestMapping("/{homeAccountNickname}-{pageNo}/dynamic")
    @ResponseBody
    public Page<Image> getdynamicImages(@PathVariable String homeAccountNickname, @PathVariable int pageNo) {
        Page<Image> dynamicImages = imageService.pageQueryForLatest(pageNo, 3, homeAccountNickname);

        return dynamicImages;
    }

    @RequestMapping("/{pageNo}/recommend")
    @ResponseBody
    public Page<Image> getRecommentImages(@PathVariable int pageNo) {
        Page<Image> recommendImages = imageService.pageQueryAllForHot(pageNo, 3);

        if (recommendImages == null) {
            return null;
        }

        return recommendImages;
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

        Account currentAccount = (Account) request.getSession().getAttribute(Constant.CURRENT_ACCOUNT);
System.out.println(currentAccount);
        String location = Constant.USER_IMAGE_LOCATION + "/" + imageFile.getOriginalFilename();

        jmsTemplate.send("pp.uploadImage.queue", new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                return session.createObjectMessage((Serializable) imageFile);
            }
        });
        imageService.uploadImageSuccess(location, currentAccount, image);

        return "上传成功！";
    }

    @RequestMapping("/{username}/all/{pageNo}")
    @ResponseBody
    public Page<Image> getImagesByJSON(@PathVariable String username, @PathVariable int pageNo) {
        return imageService.pageQueryByUsername(username, pageNo, Page.DEFAULT_PAGE_SIZE);
    }

    /**
     * 点赞处理方法
     * @param imageId 被点赞的图片Id
     */
    @RequestMapping("/{imageId}/like")
    @ResponseBody
    public String doSupport(@PathVariable String imageId) {
        System.out.println(imageId);
        Image image = imageService.findImageByImageId(imageId);
        System.out.println(imageId + "1+++" + image);
        image.setImageLikeCount(image.getImageLikeCount() + 1);
        imageService.update(image);

        return "点赞成功";
    }

    @RequestMapping("/{imageId}/dislike")
    @ResponseBody
    public String doNotSupport(@PathVariable String imageId) {
        Image image = imageService.findImageByImageId(imageId);
        image.setImageDislikeCount(image.getImageDislikeCount() + 1);
        imageService.update(image);

        return "鄙视成功";
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

    @Resource
    public void setCatalogeService(CatalogeService catalogeService) {
        this.catalogeService = catalogeService;
    }

}
