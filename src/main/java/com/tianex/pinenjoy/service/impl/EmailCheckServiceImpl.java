package com.tianex.pinenjoy.service.impl;

import com.tianex.pinenjoy.dao.EmailCheckDao;
import com.tianex.pinenjoy.domain.EmailCheck;
import com.tianex.pinenjoy.service.EmailCheckService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("emailCheckService")
public class EmailCheckServiceImpl implements EmailCheckService {

    private EmailCheckDao emailCheckDao;

    public EmailCheck findEmailCheckByCode(String emailCheckCode) {
        return emailCheckDao.findEmailCheckByCode(emailCheckCode);
    }

    @Resource
    public void setEmailCheckDao(EmailCheckDao emailCheckDao) {
        this.emailCheckDao = emailCheckDao;
    }
}
