package com.tianex.pinenjoy.core;

/**
 * 系统常量类
 * @author TianEx
 */
public class Constant {

    public static final String CURRENT_ACCOUNT = "current_account";

    public static final String USER_IMAGE_LOCATION = "static/image/user";

    /*
     * AES对称加密算法的密钥(128bit)，基于Base64表示(有bug!，改为二进制表示)
     */
    public static final String KEY = "163E3742E749F010612E1984A0D3F538";

    public static final String CHARSET = "UTF-8";

    /*
     * 邮箱验证有效时间为1天(单位毫秒)
     */
    public static final long CHECKCODE_AVAILABLE = 1000 * 60 * 60 * 24;

    public static final String ERROR_MSG = "error_msg";

    /*
     * 图片默认的自动删除的毫秒数
     */
    public static final long AUTO_DELETE_TIME = 1000 * 60 * 60 * 24;
}
