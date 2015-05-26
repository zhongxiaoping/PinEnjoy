package com.tianex.pinenjoy.service.impl;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.dao.AccountDao;
import com.tianex.pinenjoy.dao.EmailCheckDao;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.EmailCheck;
import com.tianex.pinenjoy.service.AccountService;
import com.tianex.pinenjoy.service.RoleService;
import com.tianex.pinenjoy.util.AESUtils;
import com.tianex.pinenjoy.util.DateUtils;
import com.tianex.pinenjoy.util.NumberUtils;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;
import java.util.Set;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

    private AccountDao accountDao;
    private EmailCheckDao emailCheckDao;
    private RoleService roleService;

    private MailSender mailSender;
    private SimpleMailMessage completeRegisterCheck;

    public void deleteAccount(Account account) {
        accountDao.delete(account);
    }

    public void updateAccount(Account account) {
        accountDao.update(account);
    }

    public List<Account> findAll() {
        return accountDao.loadAll();
    }

    public Account findAccountByEmail(String accountEmail) {
        return accountDao.findAccountByEmail(accountEmail);
    }

    public Account findAccountByUsername(String accountNickname) {
        return accountDao.findAccountByUsername(accountNickname);
    }

    public Account findAccountByAccountId(String accountId) {
        return accountDao.findAccountByAccountId(accountId);
    }

    public Set<String> findResourcesByUsername(String accountNickname) {
        Account account = findAccountByUsername(accountNickname);
        if (account == null) {
            return Collections.emptySet();
        }

        return roleService.findResourcesByRoleId(account.getAccountRoleIds());
    }

    public Set<String> findPermissionsByUsername(String accountNickname) {
        Account account = findAccountByUsername(accountNickname);
        if (account == null) {
            return Collections.emptySet();
        }

        return roleService.findPermissionsByRoleId(account.getAccountRoleIds());
    }

    @Override
    public Set<String> findRolesByUsername(String accountNickname) {
        Account account = findAccountByUsername(accountNickname);
        if (account == null) {
            return Collections.emptySet();
        }

        return roleService.findRolesByRoleIds(account.getAccountRoleIds());
    }

    /**
     * 创建账户，将用户资料(密码)进行加密
     * 并发送验证账户的邮件给注册用户
     * @param account
     */
    public void createAccount(Account account) throws Exception {
        account.setAccountRegisterTime(new Timestamp(System.currentTimeMillis()));
        account.setAccountIsLock(true);
        account.setAccountId(NumberUtils.generateUUID());

        String encryptPassword = AESUtils.parseByte2HexStr(
                    AESUtils.encrypt(account.getAccountPassword().getBytes(), Constant.KEY));
        account.setAccountPassword(encryptPassword);

        accountDao.save(account);

        //发送验证邮件给注册用户
        String[] uuid = NumberUtils.generateUUID(2);
        EmailCheck checkCodeForAccount = new EmailCheck(uuid[0], account.getAccountNickname(), uuid[1]);
        checkCodeForAccount.setEmailCheckGenerateTime(DateUtils.getNowByTimestamp());
        emailCheckDao.save(checkCodeForAccount);

        SimpleMailMessage message = new SimpleMailMessage(completeRegisterCheck);
        message.setText(String.format(completeRegisterCheck.getText(), uuid[1],
                    DateUtils.getNowByTimestamp(), DateUtils.convertToTimeText(Constant.CHECKCODE_AVAILABLE)));
        message.setTo(account.getAccountEmail());
        mailSender.send(message);
    }

    /**
     * 收藏指定Id的图片
     * @param currentAccount 当前用户
     * @param imageId 指定图片Id
     */
    public void collectSuccess(Account currentAccount, String imageId) {
        String collectImageIds = currentAccount.getAccountCollectImageIds();
        if (collectImageIds.contains(",")) {
            collectImageIds.concat("," + imageId);
        } else {
            collectImageIds = imageId;
        }
        currentAccount.setAccountCollectImageIds(collectImageIds);

        accountDao.update(currentAccount);
    }

    /**
     * 取消收藏指定Id的图片
     * @param currentAccount
     * @param imageId
     */
    public void unCollectSuccess(Account currentAccount, String imageId) {
        String collectImageIds = currentAccount.getAccountCollectImageIds();

        if (collectImageIds.contains(",")) {
            collectImageIds.replace("," + imageId, "");
        } else {
            collectImageIds = null;
        }

        currentAccount.setAccountCollectImageIds(collectImageIds);

        accountDao.update(currentAccount);
    }

    /**
     * 订阅用户服务，被订阅的用户粉丝数加1，订阅用户添加id
     * @param currentAccount
     * @param accountId
     */
    public void subscribeSuccess(Account currentAccount, String accountId) {
        Account _account = accountDao.get(accountId);
        String publishIds = _account.getAccountPublishIds();
        _account.setAccountFansCount(_account.getAccountFansCount() + 1);

        publishIds = (publishIds == null) ?
                currentAccount.getAccountId() : publishIds.concat("," + _account.getAccountId());
        _account.setAccountPublishIds(publishIds);

        accountDao.update(_account);

        currentAccount.setAccountSubscribeIds(_account.getAccountId());
        accountDao.update(currentAccount);
    }

    /**
     * 取消订阅指定用户,指定用户粉丝数减1，订阅用户删除id
     * @param currentAccount
     * @param accountId
     */
    public void unsubscribeSuccess(Account currentAccount, String accountId) {
        String subscribeIds = currentAccount.getAccountSubscribeIds();

        if (subscribeIds.contains(",")) {
            subscribeIds.replace("," + accountId, "");
        } else {
            subscribeIds = null;
        }
        currentAccount.setAccountSubscribeIds(subscribeIds);
        accountDao.update(currentAccount);

        Account _account = accountDao.get(accountId);
        _account.setAccountFansCount(_account.getAccountFansCount() + 1);
        String publishIds = currentAccount.getAccountPublishIds();

        if (publishIds.contains(",")) {
            publishIds.replace("," + currentAccount.getAccountId(), "");
        } else {
            publishIds = null;
        }
        accountDao.update(_account);
    }

    @Resource
    public void setAccountDao(AccountDao accountDao) {
        this.accountDao = accountDao;
    }

    @Resource
    public void setEmailCheckDao(EmailCheckDao emailCheckDao) {
        this.emailCheckDao = emailCheckDao;
    }

    @Resource
    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Resource
    public void setCompleteRegisterCheck(SimpleMailMessage completeRegisterCheck) {
        this.completeRegisterCheck = completeRegisterCheck;
    }

    @Resource
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }
}
