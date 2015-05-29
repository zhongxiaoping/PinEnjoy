package com.tianex.pinenjoy.web;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.service.AccountService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    private AccountService accountService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginForm() {
        return "/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("id") String accountId, @RequestParam String password,
                        Model model, HttpServletRequest request) {
        UsernamePasswordToken token = new UsernamePasswordToken(accountId, password);
        token.setRememberMe(true);//默认记住用户

        Subject currentAccount = SecurityUtils.getSubject();

        try {
            currentAccount.login(token);
        } catch (UnknownAccountException uae) {
            model.addAttribute(Constant.ERROR_MSG, "账户错误");
            return "redirect:/login";
        } catch (IncorrectCredentialsException ice) {
            model.addAttribute(Constant.ERROR_MSG, "密码不正确");
            return "redirect:/login";
        } catch (LockedAccountException lae) {
            model.addAttribute(Constant.ERROR_MSG, "账户被锁定");
            return "redirect:/login";
        } catch (ExcessiveAttemptsException eae) {
            return "redirect:/login";
        }

        return "redirect:/";
    }

    @RequestMapping("/logout")
    public String logout() {
        Subject currentAccount = SecurityUtils.getSubject();
        currentAccount.logout();

        return "redirect:/index";
    }

    @Resource
    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }
}
