package com.tianex.pinenjoy.web;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/account")
public class AccountController {

    private AccountService accountService;

    /**
     * 完成用户订阅（关注）的功能
     * @param accountId 被关注用户Id
     */
    @RequestMapping("/{accountId}/subscribe")
    public void doSubscribe(@PathVariable String accountId, HttpServletRequest request) {
        Account currentAccount = (Account) request.getSession().getAttribute(Constant.CURRENT_ACCOUNT);
        accountService.subscribeSuccess(currentAccount, accountId);
    }

    @RequestMapping("/{accountId}/unsubscribe")
    public void doUnsubscribe(@PathVariable String accountId, HttpServletRequest request) {
        Account currentAccount = (Account) request.getSession().getAttribute(Constant.CURRENT_ACCOUNT);
        accountService.unsubscribeSuccess(currentAccount, accountId);
    }

    @Resource
    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }

}
