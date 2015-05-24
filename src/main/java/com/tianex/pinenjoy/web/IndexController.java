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

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {

    private ImageService imageService;
    private CatalogeService catalogeService;

    @RequestMapping("/")
    public String toIndex() {
        return "redirect:/index_1";
    }

    @RequestMapping(value = "/index_{pageNo}", method = RequestMethod.GET)
    public String index(@PathVariable int pageNo, Model model, HttpServletRequest request) {
        Account currentAccount = (Account) request.getSession().getAttribute(Constant.CURRENT_ACCOUNT);
        model.addAttribute("currentAccount", currentAccount);

        List<Cataloge> cataloges = catalogeService.findAll();
        model.addAttribute("cataloges", cataloges);

        Page<Image> pageOfImages = imageService.pageQueryAll(pageNo, Page.DEFAULT_PAGE_SIZE);
        model.addAttribute("currentImages", pageOfImages.getData());

        return "index";
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
