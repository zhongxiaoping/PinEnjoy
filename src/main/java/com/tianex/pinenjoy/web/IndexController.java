package com.tianex.pinenjoy.web;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Cataloge;
import com.tianex.pinenjoy.domain.Image;
import com.tianex.pinenjoy.service.CatalogeService;
import com.tianex.pinenjoy.service.ImageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {

    private ImageService imageService;
    private CatalogeService catalogeService;

    @RequestMapping("/")
    public String toIndex(Model model, HttpServletRequest request) {
        Account currentAccount = (Account) request.getSession().getAttribute(Constant.CURRENT_ACCOUNT);
        model.addAttribute("currentAccount", currentAccount);

        Page<Image> imagePage = imageService.pageQueryAll(1, 10);
        model.addAttribute("currentImages", imagePage.getData());

        List<Cataloge> cataloges = catalogeService.findAll();
        model.addAttribute("cataloges", cataloges);

        return "index";
    }

    @RequestMapping(value = "/index/asy", method = RequestMethod.GET)
    @ResponseBody
    public List<Image> index() {
        List<Image> images = imageService.findAll();

        return images;
    }

    @Resource
    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

    @Resource
    public void setCatalogeService(CatalogeService catalogeService) {
        this.catalogeService = catalogeService;
    }
}
