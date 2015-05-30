package com.tianex.pinenjoy.web;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Image;
import com.tianex.pinenjoy.service.AccountService;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;

@Controller
@RequestMapping("/account")
public class AccountController {

    private AccountService accountService;
    private JmsTemplate jmsTemplate;

    /**
     * 修改用户资料
     * @param homeAccountNickname
     * @param editedAccount
     * @return
     */
    @RequestMapping(value = "/{homeAccountNickname}/editProfile", method = RequestMethod.POST)
    @ResponseBody
    public String editProfile(@PathVariable String homeAccountNickname, Account editedAccount) {
        Account homeAccount = accountService.findAccountByUsername(homeAccountNickname);

        if (editedAccount.getAccountNickname() != null) {
            homeAccount.setAccountNickname(editedAccount.getAccountNickname());
        }
        if (editedAccount.getAccountSex() != null) {
            homeAccount.setAccountSex(editedAccount.getAccountSex());
        }
        if (editedAccount.getAccountPassword() != null) {
            homeAccount.setAccountPassword(editedAccount.getAccountPassword());
        }
        if (editedAccount.getAccountResume() != null) {
            homeAccount.setAccountResume(editedAccount.getAccountResume());
        }

        accountService.updateAccount(homeAccount);

        return "修改成功";
    }

    @RequestMapping(value = "/{homeAccountNickname}/editThumb", method = RequestMethod.POST)
    @ResponseBody
    public String editThumb(@PathVariable String homeAccountNickname, @RequestParam("thumbFile") MultipartFile thumbFile) {
        if (thumbFile == null) {
            return "出错了";
        }

        Account homeAccount = accountService.findAccountByUsername(homeAccountNickname);
        String location = Constant.USER_IMAGE_LOCATION + "/" + thumbFile.getOriginalFilename();

        jmsTemplate.send("pp.uploadImage.queue", new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                return session.createObjectMessage((Serializable) thumbFile);
            }
        });
        homeAccount.setAccountThumb(location);
        accountService.updateAccount(homeAccount);

        return "修改头像成功";
    }

    /**
     * 完成用户订阅（关注）的功能
     * @param accountId 被关注用户Id
     * @param request
     * @return
     */
    @RequestMapping("/{accountId}/subscribe")
    @ResponseBody
    public String doSubscribe(@PathVariable String accountId, HttpServletRequest request) {
        Account currentAccount = (Account) request.getSession().getAttribute(Constant.CURRENT_ACCOUNT);
        accountService.subscribeSuccess(currentAccount, accountId);

        return "关注成功";
    }

    /**
     * 完成取消用户订阅（关注）的功能
     * @param accountId
     * @param request
     * @return
     */
    @RequestMapping("/{accountId}/unsubscribe")
    @ResponseBody
    public String doUnsubscribe(@PathVariable String accountId, HttpServletRequest request) {
        Account currentAccount = (Account) request.getSession().getAttribute(Constant.CURRENT_ACCOUNT);
        accountService.unsubscribeSuccess(currentAccount, accountId);

        return "取消关注成功";
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
