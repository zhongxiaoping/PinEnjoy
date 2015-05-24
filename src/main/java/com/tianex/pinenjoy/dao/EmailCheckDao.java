package com.tianex.pinenjoy.dao;

import com.tianex.pinenjoy.domain.EmailCheck;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("emailCheckDao")
public class EmailCheckDao extends BaseDao<EmailCheck> {

    public static final String EMAILCHECK_CODE = "from EmailCheck e where e.emailCheckCode=?";

    public EmailCheck findEmailCheckByCode(String emailCheckCode) {
        List<EmailCheck> emailCheckList = super.find(EMAILCHECK_CODE, emailCheckCode);

        if (emailCheckList.size() <= 0) {
            return null;
        }

        return emailCheckList.get(0);
    }

}
