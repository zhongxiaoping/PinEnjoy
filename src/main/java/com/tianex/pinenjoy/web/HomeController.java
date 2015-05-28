package com.tianex.pinenjoy.web;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Cataloge;
import com.tianex.pinenjoy.domain.Guest;
import com.tianex.pinenjoy.domain.Image;
import com.tianex.pinenjoy.service.AccountService;
import com.tianex.pinenjoy.service.CatalogeService;
import com.tianex.pinenjoy.service.GuestService;
import com.tianex.pinenjoy.service.ImageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HomeController {

    private AccountService accountService;
    private ImageService imageService;
    private GuestService guestService;
    private CatalogeService catalogeService;

    /**
     * 用户必须已经登录，否则返回登录页面(shiro)
     * @param accountId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/home/{accountId}")
    public String home(@PathVariable String accountId, HttpServletRequest request, Model model) {
        Account homeAccount = (Account) accountService.findAccountByAccountId(accountId);
        Account currentAccount = (Account) request.getSession().getAttribute(Constant.CURRENT_ACCOUNT);

        if (homeAccount == null || accountId == null) {
            return "404.jsp";
        }

        model.addAttribute("currentAccount", currentAccount);
        model.addAttribute("homeAccount", homeAccount);

        if (!currentAccount.getAccountId().equals(accountId)) {
            //记录访客
            guestService.logGuestSuccess(currentAccount, homeAccount);
        }

        Page<Guest> guestAccounts = guestService.pageQueryByAccountNickname(1, 6, homeAccount.getAccountNickname());
        model.addAttribute("guestAccounts", guestAccounts.getData());

        List<Image> collectImages = imageService.findCollectionByAccount(homeAccount, 12);
        model.addAttribute("collectImages", collectImages);

        Page<Image> recommendImages = imageService.pageQueryAllForHot(1, 1);
        model.addAttribute("recommendImage", recommendImages.getData().get(0));

        Page<Image> dynamicImage = imageService.pageQueryForLatest(1, 1 ,homeAccount.getAccountNickname());
        if (dynamicImage != null) {
            model.addAttribute("dynamicImage", dynamicImage.getData().get(0));
        } else {
            model.addAttribute("dynamicImage", null);
        }


        List<Cataloge> cataloges = catalogeService.findAll();
        model.addAttribute("cataloges", cataloges);

        return "home";
    }

    @RequestMapping("/homeImage/{imageId}")
    public String toHome(@PathVariable String imageId, Model model) {
        Image image = imageService.findImageByImageId(imageId);
        String username = image.getImageAccountNickname();
        Account homeAccount = accountService.findAccountByUsername(username);
        model.addAttribute("homeAccount", homeAccount);

        return "home";
    }

    @Resource
    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }

    @Resource
    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

    @Resource
    public void setCatalogeService(CatalogeService catalogeService) {
        this.catalogeService = catalogeService;
    }

    @Resource
    public void setGuestService(GuestService guestService) {
        this.guestService = guestService;
    }

}
