package com.tianex.pinenjoy.util;

import com.tianex.pinenjoy.core.Constant;

import java.sql.Timestamp;

/**
 * 时间相关的工具类，提供各种...
 * @author TianEx
 * @version 0.1
 */
public class DateUtils {
    public static final long day = 1000 * 60 * 60 * 24;
    public static final long hour = 1000 * 60 * 60;
    public static final long minute = 1000 * 60;

    /**
     * 返回用Timestamp表示的当前时间
     * @return
     */
    public static Timestamp getNowByTimestamp() {
        return new Timestamp(System.currentTimeMillis());
    }

    /**
     * 比较时间基于Timestamp，true表示generateTime大于等于nowByTimestamp
     * @param generateTime
     * @param nowByTimestamp
     * @return
     */
    public static boolean compareTime(Timestamp generateTime, Timestamp nowByTimestamp) {
        return generateTime.compareTo(nowByTimestamp) < 0 ? true : false;
    }

    /**
     * 根据邮件验证产生时间和有效时间判断是否验证码过期，返回true表示未过期
     * @param generateTime
     * @return
     */
    public static boolean compareTimeForAvailableToCheck(Timestamp generateTime) {
        Timestamp nowByTimestamp = new Timestamp(Constant.CHECKCODE_AVAILABLE + System.currentTimeMillis());
        return compareTime(generateTime, nowByTimestamp);
    }

    /**
     * 转换long类型毫秒为单位的时间到文字表示
     * @param time
     * @return
     */
    public static String convertToTimeText(long time) {
        StringBuffer sb = new StringBuffer();
        long d = time / day;
        if (d > 0) {
            sb.append(d + "天");
        }
        long h = (time - d * day) / hour;
        if (h > 0) {
            sb.append(h + "小时");
        }
        long m = (time - d * day - h * hour) / minute;
        if (m > 0) {
            return m + "分钟";
        }

        return sb.toString();
    }

    public static String convertTimeToText(Timestamp time) {
        return convertToTimeText(time.getTime());
    }

    public static Timestamp convertLongToTime(long currentTimeMillis) {
        return new Timestamp(currentTimeMillis);
    }

}
