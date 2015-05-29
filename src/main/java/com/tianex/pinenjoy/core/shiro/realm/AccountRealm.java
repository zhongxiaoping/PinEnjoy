package com.tianex.pinenjoy.core.shiro.realm;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.service.AccountService;
import com.tianex.pinenjoy.util.AESUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AccountRealm extends AuthorizingRealm {

    private AccountService accountService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String accountId = (String) super.getAvailablePrincipal(principalCollection);
        Account currentAccount = findAccount(accountId);
        if (currentAccount == null) {
            return null;
        }

        Set<String> roleList = accountService.findRolesByUsername(currentAccount.getAccountNickname());
        Set<String> permissionList = accountService.findPermissionsByUsername(currentAccount.getAccountNickname());

        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.addRoles(roleList);
        simpleAuthorizationInfo.addStringPermissions(permissionList);

        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
            throws AuthenticationException {

        String accountId = (String) authenticationToken.getPrincipal();
        Account currentAccount = findAccount(accountId);

        if (currentAccount == null) {
            throw new UnknownAccountException();//没找到帐号
        }
        if (Boolean.TRUE.equals(currentAccount.getAccountIsLock())) {
            throw new LockedAccountException(); //帐号锁定
        }

        String passwordForAccount = null;
        try {
            byte[] _password = AESUtils.parseHexStr2Byte(currentAccount.getAccountPassword());
            passwordForAccount = new String(AESUtils.decrypt(_password, Constant.KEY));
        } catch (Exception e) {
            e.printStackTrace();
        }

        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，可以在此判断或自定义实现
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                currentAccount.getAccountNickname(),
                passwordForAccount,
                this.getName());

        this.setSession(Constant.CURRENT_ACCOUNT, currentAccount);

        return authenticationInfo;
    }

    private Account findAccount(String accountId) {
        if (accountId.trim().equals("") || accountId == null) {
            return null;
        }

        accountId = accountId.toLowerCase();
        String emailRegex = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(accountId);

        Account currentAccount = null;
        if (matcher.find()) {
            currentAccount = accountService.findAccountByEmail(accountId);
        } else {
            currentAccount = accountService.findAccountByUsername(accountId);
        }

        return currentAccount;
    }

    /**
     * 将一些数据放到ShiroSession中,以便于其它地方使用
     * @param key
     * @param value
     */
    private void setSession(Object key, Object value) {
        Subject currentAccount = SecurityUtils.getSubject();
        if (currentAccount != null) {
            Session session = currentAccount.getSession();

            if (session != null) {
                session.setAttribute(key, value);
            }
        }
    }

    @Resource
    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }

}
