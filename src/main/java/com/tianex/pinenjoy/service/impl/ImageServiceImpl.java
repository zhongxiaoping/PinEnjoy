package com.tianex.pinenjoy.service.impl;

import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.dao.ImageDao;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Image;
import com.tianex.pinenjoy.service.ImageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("imageService")
public class ImageServiceImpl implements ImageService {

    private ImageDao imageDao;

    public void createImage(Image image) {
        imageDao.save(image);
    }

    public void deleteImage(Image image) {
        imageDao.delete(image);
    }

    public void update(Image image) {
        imageDao.update(image);
    }

    public Image findImageByImageId(String imageId) {
        return imageDao.findImageByImageId(imageId);
    }

    public Page<Image> pageQueryAll(int pageNo, int pageSize) {
        return imageDao.pageQueryAll(pageNo, pageSize);
    }

    public Page<Image> pageQueryByUsername(String accountNickname, int pageNo, int pageSize) {
        return imageDao.pagedQueryByUsername(accountNickname, pageNo, pageSize);
    }

    public Page<Image> pageQueryForLatest(int pageNo, int pageSize, String accountNickname) {
        return imageDao.pageQueryForLatest(pageNo, pageSize, accountNickname);
    }

    public Page<Image> pageQueryForHot(int pageNo, int pageSize, String accountNickname) {
        return imageDao.pageQueryForHot(pageNo, pageSize, accountNickname);
    }

    public Page<Image> pageQueryAllForLatest(int pageNo, int pageSize, String accountNickname) {
        return imageDao.pageQueryAllForLatest(pageNo, pageSize, accountNickname);
    }

    public Page<Image> pageQueryAllForHot(int pageNo, int pageSize, String accountNickname) {
        return imageDao.pageQueryAllForHot(pageNo, pageSize, accountNickname);
    }

    public void downloadImageSuccess(Image image) {

    }

    public void uploadImageSuccess(String location, Account account, Image image) {

    }

    @Resource
    public void setImageDao(ImageDao imageDao) {
        this.imageDao = imageDao;
    }

}
