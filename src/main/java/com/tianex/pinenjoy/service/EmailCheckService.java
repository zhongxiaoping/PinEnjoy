package com.tianex.pinenjoy.service;

import com.tianex.pinenjoy.domain.EmailCheck;

public interface EmailCheckService {

    public EmailCheck findEmailCheckByCode(String emailCheckCode);

}
