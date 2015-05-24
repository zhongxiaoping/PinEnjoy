package com.tianex.pinenjoy.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.Properties;

/**
 * Http相关的工具类
 * @author TianEx
 * @version 0.1
 */
public abstract class HttpUtils {

    public static final String CHARACTER_ENCODING = "UTF-8";
    public static final String METHOD_POST = "POST";
    public static final String CONTENT_TYPE = "Content-Type";

    /**
     * 获取web项目中资源的真实路径
     * @return
     */
    public static String getWebProjectPath() {
        String realPath = Thread.currentThread().getContextClassLoader().getResource("/").getFile();
        int i = realPath.lastIndexOf("WEB-INF");
        return realPath.substring(0, i);
    }

    /**
     * 打印数据
     * @param response
     * @param data 待打印的数据
     * @throws IOException
     */
    public static void responseWrite(HttpServletResponse response, byte[] data) throws IOException {
        if (data != null) {
            response.setContentLength(data.length);
            DataOutputStream out = new DataOutputStream(response.getOutputStream());
            out.write(data);
            out.flush();
            out.close();
        }
    }

    /**
     * 从请求中读取字节流
     * @param request
     * @return byte[] 数据
     * @throws IOException
     */
    public static byte[] requestRead(HttpServletRequest request) throws IOException {
        int contentLength = request.getContentLength();
        byte[] data = null;
        if (contentLength > 0) {
            data = new byte[contentLength];
            InputStream is = request.getInputStream();
            DataInputStream dis = new DataInputStream(is);
            dis.readFully(data);
            dis.close();
        }
        return data;
    }

    /**
     * 以POST方式向指定地址发送数据包请求，并取得返回的数据包
     * @param urlString
     * @param requestData
     * @return
     * @throws Exception
     */
    public static byte[] postRequest(String urlString, byte[] requestData) throws Exception {
        Properties requestProperties = new Properties();
        requestProperties.setProperty(CONTENT_TYPE, "application/octet-stream;charset=" + CHARACTER_ENCODING);
        return postRequest(urlString, requestData, requestProperties);
    }

    /**
     * 以POST方式向指定地址发送数据包请求，并取得返回的数据包
     * @param urlString 请求地址
     * @param requestData 请求数据
     * @param requestProperties 请求包体
     * @return byte[] 数据包
     * @throws Exception
     */
    public static byte[] postRequest(String urlString, byte[] requestData, Properties requestProperties) throws Exception {
        byte[] responseData = null;
        HttpURLConnection conn = null;
        try {
            URL url = new URL(urlString);
            conn = (HttpURLConnection) url.openConnection();
            if ((requestProperties != null) && (requestProperties.size() > 0)) {
                for (Map.Entry<Object, Object> entry : requestProperties.entrySet()) {
                    String key = String.valueOf(entry.getKey());
                    String value = String.valueOf(entry.getValue());
                    conn.setRequestProperty(key, value);
                }
            }
            conn.setRequestMethod(METHOD_POST);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
            if (requestData != null) {
                dos.write(requestData);
            }
            dos.flush();
            dos.close();
            DataInputStream dis = new DataInputStream(conn.getInputStream());
            int length = conn.getContentLength();
            if (length > 0) {
                responseData = new byte[length];
                dis.readFully(responseData);
            }
            dis.close();
        } finally {
            if (conn != null) {
                conn.disconnect();
                conn = null;
            }
        }
        return responseData;
    }

}
