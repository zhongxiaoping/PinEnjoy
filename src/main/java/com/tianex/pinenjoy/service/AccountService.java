package com.tianex.pinenjoy.service;

import com.tianex.pinenjoy.domain.Account;

import java.util.List;
import java.util.Set;

public interface AccountService {

    public void createAccount(Account account);
    public void deleteAccount(Account account);
    public void updateAccount(Account account);

    public List<Account> findAll();
    public Account findAccountByEmail(String accountEmail);
    public Account findAccountByUsername(String accountNickname);
    public Account findAccountByAccountId(String accountId);
    public Set<String> findRolesByUsername(String accountNickname);
    public Set<String> findPermissionsByUsername(String accountNickname);

    public void collectSuccess(Account account, String imageId);
    public void unCollectSuccess(Account account, String imageId);

    public void subscribeSuccess(Account CurrentAccount, String accountId);
    public void unsubscribeSuccess(Account account, String accountId);

}
