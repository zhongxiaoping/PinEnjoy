package com.tianex.pinenjoy.bean;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.util.HttpUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * 基于异步接收消息的MDB
 * @author TianEx
 * @version 0.1
 */
public class MDBean {

    public void uploadImageSuccess(MultipartFile imageFile) {
        String location = Constant.USER_IMAGE_LOCATION + "/" + imageFile.getOriginalFilename();
        location = HttpUtils.getWebProjectPath() + location;
        try {
            imageFile.transferTo(new File(location));
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
