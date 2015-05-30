package com.tianex.pinenjoy.service.impl;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.dao.AccountDao;
import com.tianex.pinenjoy.dao.EmailCheckDao;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.EmailCheck;
import com.tianex.pinenjoy.domain.Image;
import com.tianex.pinenjoy.service.AccountService;
import com.tianex.pinenjoy.service.ImageService;
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
    private ImageService imageService;

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

    /**
     * ���������ѯ��ȡ�û�ʵ��
     * @param accountEmail
     * @return
     */
    public Account findAccountByEmail(String accountEmail) {
        return accountDao.findAccountByEmail(accountEmail);
    }

    /**
     * �����û�����ѯ��ȡ�û�ʵ��
     * @param accountNickname
     * @return
     */
    public Account findAccountByUsername(String accountNickname) {
        return accountDao.findAccountByUsername(accountNickname);
    }

    /**
     * �����û�Id��ѯ��ȡ�û�ʵ��
     * @param accountId
     * @return
     */
    public Account findAccountByAccountId(String accountId) {
        return accountDao.findAccountByAccountId(accountId);
    }

    /**
     * �����û�����ѯ��ȡ����ӵ�е���Դ
     * @param accountNickname
     * @return
     */
    public Set<String> findResourcesByUsername(String accountNickname) {
        Account account = findAccountByUsername(accountNickname);
        if (account == null) {
            return Collections.emptySet();
        }

        return roleService.findResourcesByRoleId(account.getAccountRoleIds());
    }

    /**
     * �����û�����ѯ��ȡ����ӵ�е�Ȩ��
     * @param accountNickname
     * @return
     */
    public Set<String> findPermissionsByUsername(String accountNickname) {
        Account account = findAccountByUsername(accountNickname);
        if (account == null) {
            return Collections.emptySet();
        }

        return roleService.findPermissionsByRoleId(account.getAccountRoleIds());
    }

    /**
     * �����û�����ѯ��ȡ����ӵ�еĽ�ɫ
     * @param accountNickname
     * @return
     */
    public Set<String> findRolesByUsername(String accountNickname) {
        Account account = findAccountByUsername(accountNickname);
        if (account == null) {
            return Collections.emptySet();
        }

        return roleService.findRolesByRoleIds(account.getAccountRoleIds());
    }

    /**
     * �����˻������û�����(����)���м���
     * ��������֤�˻����ʼ���ע���û�
     * @param account
     * @throws Exception
     */
    public void createAccount(Account account) throws Exception {
        account.setAccountRegisterTime(new Timestamp(System.currentTimeMillis()));
        account.setAccountIsLock(true);
        account.setAccountId(NumberUtils.generateUUID());

        String encryptPassword = AESUtils.parseByte2HexStr(
                    AESUtils.encrypt(account.getAccountPassword().getBytes(), Constant.KEY));
        account.setAccountPassword(encryptPassword);

        accountDao.save(account);

        //������֤�ʼ���ע���û�
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
     * �ղ�ָ��Id��ͼƬ
     * @param currentAccount ��ǰ�û�
     * @param image ָ��ͼƬ
     */
    @Override
    public void collectSuccess(Account currentAccount, Image image) {
        String collectImageIds = currentAccount.getAccountCollectImageIds();

        if (collectImageIds != null) {
            if (collectImageIds.contains(",")) {
                collectImageIds.concat("," + image.getImageId());
            }
        } else {
            collectImageIds = image.getImageId();
        }
        currentAccount.setAccountCollectImageIds(collectImageIds);
        image.setImageCollectCount(image.getImageCollectCount() + 1);

        imageService.update(image);
        accountDao.update(currentAccount);
    }

    /**
     * ȡ���ղ�ָ��Id��ͼƬ
     * @param currentAccount
     * @param image
     */
    public void unCollectSuccess(Account currentAccount, Image image) {
        String collectImageIds = currentAccount.getAccountCollectImageIds();

        if (collectImageIds.contains(",")) {
            collectImageIds.replace("," + image.getImageId(), "");
        } else {
            collectImageIds = null;
        }

        currentAccount.setAccountCollectImageIds(collectImageIds);
        image.setImageCollectCount(image.getImageCollectCount() - 1);

        imageService.update(image);

        accountDao.update(currentAccount);
    }

    /**
     * �����û����񣬱����ĵ��û���˿����1�������û����id
     * @param currentAccount
     * @param accountId �������û�Id
     */
    public void subscribeSuccess(Account currentAccount, String accountId) {
        Account _account = accountDao.get(accountId);
        _account.setAccountFansCount(_account.getAccountFansCount() + 1);

        String publishIds = _account.getAccountPublishIds();
        publishIds = (publishIds == null) ?
                publishIds : publishIds.concat("," + currentAccount.getAccountId());
        _account.setAccountPublishIds(publishIds);

        accountDao.update(_account);

        String subscribeId = currentAccount.getAccountSubcribeIds();
        subscribeId = (subscribeId == null) ?
                accountId : subscribeId.concat("," + accountId);
        currentAccount.setAccountSubcribeIds(subscribeId);
        currentAccount.setAccountFansCount(currentAccount.getAccountSubscribeCount() + 1);
        accountDao.update(currentAccount);
    }

    /**
     * ȡ������ָ���û�,ָ���û���˿����1�������û�ɾ��id
     * @param currentAccount
     * @param accountId �������û�
     */
    public void unsubscribeSuccess(Account currentAccount, String accountId) {
        Account _account = accountDao.get(accountId);
        _account.setAccountFansCount(_account.getAccountFansCount() - 1);

        String publishIds = _account.getAccountPublishIds();
        if (!publishIds.contains(",")) {
            publishIds = null;
        } else {
            publishIds = publishIds.replace("," + currentAccount.getAccountId(), "");
        }
        _account.setAccountPublishIds(publishIds);

        accountDao.update(_account);

        String subscribeId = currentAccount.getAccountSubcribeIds();
        if (!subscribeId.contains(",")) {
            subscribeId = null;
        } else {
            subscribeId = subscribeId.replace("," + accountId, "");
        }
        currentAccount.setAccountSubcribeIds(subscribeId);
        currentAccount.setAccountFansCount(currentAccount.getAccountSubscribeCount() - 1);

        accountDao.update(currentAccount);
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
    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

    @Resource
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }
}
