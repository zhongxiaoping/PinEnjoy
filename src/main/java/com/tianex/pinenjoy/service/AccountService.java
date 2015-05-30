package com.tianex.pinenjoy.service;

import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Image;

import java.util.List;
import java.util.Set;

public interface AccountService {

    void createAccount(Account account) throws Exception;
    void deleteAccount(Account account);
    void updateAccount(Account account);

    public List<Account> findAll();
    public Account findAccountByEmail(String accountEmail);
    public Account findAccountByUsername(String accountNickname);
    public Account findAccountByAccountId(String accountId);
    public Set<String> findResourcesByUsername(String accountNickname);
    public Set<String> findPermissionsByUsername(String accountNickname);
    public Set<String> findRolesByUsername(String accountNickname);

    public void collectSuccess(Account account, Image image);
    public void unCollectSuccess(Account account, Image image);

    public void subscribeSuccess(Account CurrentAccount, String accountId);
    public void unsubscribeSuccess(Account account, String accountId);

}
