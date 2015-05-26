package com.tianex.pinenjoy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "t_emailCheck")
public class EmailCheck implements Serializable {
    private static final long serialVersionUID = 8433971403184400937L;

    private String emailCheckId;

    private String emailCheckAccountNickname;
    private String emailCheckCode;
    private Timestamp emailCheckGenerateTime;

    public EmailCheck() {
    }

    public EmailCheck(String emailCheckId, String emailCheckCode, String emailCheckAccountNickname) {
        this.emailCheckId = emailCheckId;
        this.emailCheckCode = emailCheckCode;
        this.emailCheckAccountNickname = emailCheckAccountNickname;
    }

    @Id
    @Column(name = "emailCheck_id")
    public String getEmailCheckId() {
        return emailCheckId;
    }

    public void setEmailCheckId(String emailCheckId) {
        emailCheckId = emailCheckId;
    }

    @Column(name = "emailCheck_accountNickname")
    public String getEmailCheckAccountNickname() {
        return emailCheckAccountNickname;
    }

    public void setEmailCheckAccountNickname(String emailCheckAccountNickname) {
        this.emailCheckAccountNickname = emailCheckAccountNickname;
    }

    @Column(name = "emailCheck_code")
    public String getEmailCheckCode() {
        return emailCheckCode;
    }

    public void setEmailCheckCode(String emailCheckCode) {
        emailCheckCode = emailCheckCode;
    }

    @Column(name = "emailCheck_generateTime")
    public Timestamp getEmailCheckGenerateTime() {
        return emailCheckGenerateTime;
    }

    public void setEmailCheckGenerateTime(Timestamp emailCheckGenerateTime) {
        this.emailCheckGenerateTime = emailCheckGenerateTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EmailCheck that = (EmailCheck) o;

        return !(emailCheckId != null ? !emailCheckId.equals(that.emailCheckId) : that.emailCheckId != null);

    }

    @Override
    public int hashCode() {
        return emailCheckId != null ? emailCheckId.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "EmailCheck{" +
                "emailCheckId='" + emailCheckId + '\'' +
                ", emailCheckAccountNickname='" + emailCheckAccountNickname + '\'' +
                ", emailCheckCode='" + emailCheckCode + '\'' +
                ", emailCheckGenerateTime=" + emailCheckGenerateTime +
                '}';
    }

}
