package com.tianex.pinenjoy.service.impl;

import com.tianex.pinenjoy.dao.AccountDao;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.service.AccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

    private AccountDao accountDao;

    public void createAccount(Account account) {
        accountDao.save(account);
    }

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

    public Set<String> findRolesByUsername(String accountNickname) {
        return accountDao.findRolesByUsername(accountNickname);
    }

    public Set<String> findPermissionsByUsername(String accountNickname) {
        return accountDao.findPermissionsByUsername(accountNickname);
    }

    public void collectSuccess(Account account, String imageId) {

    }

    public void unCollectSuccess(Account account, String imageId) {

    }

    public void subscribeSuccess(Account CurrentAccount, String accountId) {

    }

    public void unsubscribeSuccess(Account account, String accountId) {

    }

    @Resource
    public void setAccountDao(AccountDao accountDao) {
        this.accountDao = accountDao;
    }
}
