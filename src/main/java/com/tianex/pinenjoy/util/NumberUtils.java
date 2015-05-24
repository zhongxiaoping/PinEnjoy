package com.tianex.pinenjoy.util;

import java.util.UUID;

/**
 * 用于生成与UUID/数字相关的工具类
 * @author TianEx
 * @version 0.1
 */
public abstract class NumberUtils {

    /**
     * 返回除去'-'后的UUID
     * @return String
     */
    public static String generateUUID() {
        String uuid = UUID.randomUUID().toString();
        uuid = uuid.substring(0, 8) + uuid.substring(9, 13) + uuid.substring(14, 18)
                + uuid.substring(19, 23) + uuid.substring(24);
        return uuid;
    }

    /**
     * 返回指定数量的UUID
     * @param sum
     * @return String[] 返回数组表示的UUID
     */
    public static String[] generateUUID(int sum) {
        if (sum <= 0) {
            return null;
        }
        String[] guuid = new String[sum];
        for (int i = 0; i < sum; i++) {
            guuid[i] = generateUUID();
        }
        return guuid;
    }

    public static void  main(String[] args) {
        for (String s : generateUUID(10))
            System.out.println(s);
    }

}
