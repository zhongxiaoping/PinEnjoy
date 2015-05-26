package com.tianex.pinenjoy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
@Table(name = "t_account")
public class Account implements Serializable {
    private static final long serialVersionUID = -1718018743979275416L;

    private String accountId;

    private String accountNickname;
    private String accountEmail;
    private String accountPassword;

    private String accountSex;
    private String accountResume;
    private String accountThumb;

    private Date accountBirthday;
    private Timestamp accountRegisterTime;
    private Timestamp accountLastLoginTime;

    private boolean accountIsLock;
    private long accountFansCount;

    private String accountSubscribeImageIds;
    private String accountCollectImageIds;

    private String accountSubscribeIds;
    private String accountPublishIds;

    private String accountRoleIds;

    public Account() {
    }

    @Id
    @Column(name = "account_id")
    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    @Column(name = "account_nickname")
    public String getAccountNickname() {
        return accountNickname;
    }

    public void setAccountNickname(String accountNickname) {
        this.accountNickname = accountNickname;
    }

    @Column(name = "account_password")
    public String getAccountPassword() {
        return accountPassword;
    }

    public void setAccountPassword(String accountPassword) {
        this.accountPassword = accountPassword;
    }

    @Column(name = "account_email")
    public String getAccountEmail() {
        return accountEmail;
    }

    public void setAccountEmail(String accountEmail) {
        this.accountEmail = accountEmail;
    }

    @Column(name = "account_birthday")
    public Date getAccountBirthday() {
        return accountBirthday;
    }

    public void setAccountBirthday(Date accountBirthday) {
        this.accountBirthday = accountBirthday;
    }

    @Column(name = "account_resume")
    public String getAccountResume() {
        return accountResume;
    }

    public void setAccountResume(String accountResume) {
        this.accountResume = accountResume;
    }

    @Column(name = "account_sex")
    public String getAccountSex() {
        return accountSex;
    }

    public void setAccountSex(String accountSex) {
        this.accountSex = accountSex;
    }

    @Column(name = "account_thumb")
    public String getAccountThumb() {
        return accountThumb;
    }

    public void setAccountThumb(String accountThumb) {
        this.accountThumb = accountThumb;
    }

    @Column(name = "account_registerTime")
    public Timestamp getAccountRegisterTime() {
        return accountRegisterTime;
    }

    public void setAccountRegisterTime(Timestamp accountRegisterTime) {
        this.accountRegisterTime = accountRegisterTime;
    }

    @Column(name = "account_lastLoginTime")
    public Timestamp getAccountLastLoginTime() {
        return accountLastLoginTime;
    }

    public void setAccountLastLoginTime(Timestamp accountLastLoginTime) {
        this.accountLastLoginTime = accountLastLoginTime;
    }

    @Column(name = "account_isLock")
    public boolean getAccountIsLock() {
        return accountIsLock;
    }

    public void setAccountIsLock(boolean accountIsLock) {
        this.accountIsLock = accountIsLock;
    }

    @Column(name = "account_fansCount")
    public long getAccountFansCount() {
        return accountFansCount;
    }

    public void setAccountFansCount(long accountFansCount) {
        this.accountFansCount = accountFansCount;
    }

    @Column(name = "account_subscribeImageIds")
    public String getAccountSubscribeImageIds() {
        return accountSubscribeImageIds;
    }

    public void setAccountSubscribeImageIds(String accountSubscribeImageIds) {
        this.accountSubscribeImageIds = accountSubscribeImageIds;
    }

    @Column(name = "account_collectImageIds")
    public String getAccountCollectImageIds() {
        return accountCollectImageIds;
    }

    public void setAccountCollectImageIds(String accountCollectImageIds) {
        this.accountCollectImageIds = accountCollectImageIds;
    }

    @Column(name = "account_subscribeIds")
    public String getAccountSubscribeIds() {
        return accountSubscribeIds;
    }

    public void setAccountSubscribeIds(String accountSubscribeIds) {
        this.accountSubscribeIds = accountSubscribeIds;
    }

    @Column(name = "account_publishIds")
    public String getAccountPublishIds() {
        return accountPublishIds;
    }

    public void setAccountPublishIds(String accountPublishIds) {
        this.accountPublishIds = accountPublishIds;
    }

    @Column(name = "account_roleIds")
    public String getAccountRoleIds() {
        return accountRoleIds;
    }

    public void setAccountRoleIds(String accountRoleIds) {
        this.accountRoleIds = accountRoleIds;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Account account = (Account) o;

        return !(accountId != null ? !accountId.equals(account.accountId) : account.accountId != null);
    }

    @Override
    public int hashCode() {
        return accountId != null ? accountId.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "Account{" +
                "accountId='" + accountId + '\'' +
                ", accountNickname='" + accountNickname + '\'' +
                ", accountEmail='" + accountEmail + '\'' +
                ", accountPassword='" + accountPassword + '\'' +
                ", accountAge=" + accountBirthday +
                ", accountSex='" + accountSex + '\'' +
                ", accountResume='" + accountResume + '\'' +
                ", accountThumb='" + accountThumb + '\'' +
                ", accountRegisterTime=" + accountRegisterTime +
                ", accountLastLoginTime=" + accountLastLoginTime +
                ", accountIsLock=" + accountIsLock +
                ", accountFansCount=" + accountFansCount +
                ", accountSubscribeImageIds='" + accountSubscribeImageIds + '\'' +
                ", accountCollectImageIds='" + accountCollectImageIds + '\'' +
                ", accountSubscribeIds='" + accountSubscribeIds + '\'' +
                ", accountPublishIds='" + accountPublishIds + '\'' +
                ", accountRoleIds='" + accountRoleIds + '\'' +
                '}';
    }

}
