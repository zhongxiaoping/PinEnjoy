package com.tianex.pinenjoy.dao;

import com.tianex.pinenjoy.domain.Account;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository("accountDao")
public class AccountDao extends BaseDao<Account> {

    public static final String ACCOUNT_BY_EMAIL = "from Account a where a.accountEmail=?";
    public static final String ACCOUNT_BY_ACCOUNTNICKNAME = "from Account a where a.accountNickname=?";

    public Account findAccountByEmail(String accountEmail) {
        List<Account> accountList = super.find(ACCOUNT_BY_EMAIL, accountEmail);

        if (accountList.size() <= 0) {
            return null;
        }

        return accountList.get(0);
    }

    public Account findAccountByUsername(String accountNickname) {
        List<Account> accountList = super.find(ACCOUNT_BY_ACCOUNTNICKNAME, accountNickname);

        if (accountList.size() <= 0) {
            return null;
        }

        return accountList.get(0);
    }

    public Account findAccountByAccountId(String accountId) {
        return super.get(accountId);
    }

    public Set<String> findRolesByUsername(String accountNickname) {
        return null;
    }

    public Set<String> findPermissionsByUsername(String accountNickname) {
        return null;
    }
}
