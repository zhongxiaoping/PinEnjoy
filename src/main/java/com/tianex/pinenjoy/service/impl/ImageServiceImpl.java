package com.tianex.pinenjoy.service.impl;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.dao.ImageDao;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Image;
import com.tianex.pinenjoy.service.AccountService;
import com.tianex.pinenjoy.service.ImageService;
import com.tianex.pinenjoy.util.DateUtils;
import com.tianex.pinenjoy.util.NumberUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("imageService")
public class ImageServiceImpl implements ImageService {

    private ImageDao imageDao;

    private AccountService accountService;

    public void createImage(Image image) {
        imageDao.save(image);
    }

    public void deleteImage(Image image) {
        imageDao.delete(image);
    }

    public void update(Image image) {
        imageDao.update(image);
    }

    /**
     * 获取所有图片
     * @return
     */
    public List<Image> findAll() {
        return imageDao.findAll();
    }

    /**
     * 根据图片Id获取图片实例
     * @param imageId
     * @return
     */
    public Image findImageByImageId(String imageId) {
        return imageDao.findImageByImageId(imageId);
    }

    /**
     * 分页查询所有用户上传的图片
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<Image> pageQueryAll(int pageNo, int pageSize) {
        return imageDao.pageQueryAll(pageNo, pageSize);
    }

    /**
     * 分页查询指定用户上传的图片
     * @param accountNickname
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<Image> pageQueryByUsername(String accountNickname, int pageNo, int pageSize) {
        return imageDao.pagedQueryByUsername(accountNickname, pageNo, pageSize);
    }

    /**
     * 按照图片上传时间先后分页查询指定用户上传的图片
     * @param pageNo
     * @param pageSize
     * @param accountNickname
     * @return
     */
    public Page<Image> pageQueryForLatest(int pageNo, int pageSize, String accountNickname) {
        return imageDao.pageQueryForLatest(pageNo, pageSize, accountNickname);
    }

    /**
     * 按照图片热度递减的顺序分页查询指定用户上传的图片
     * @param pageNo
     * @param pageSize
     * @param accountNickname
     * @return
     */
    public Page<Image> pageQueryForHot(int pageNo, int pageSize, String accountNickname) {
        return imageDao.pageQueryForHot(pageNo, pageSize, accountNickname);
    }

    /**
     * 按照图片上传时间先后分页查询所有图片
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<Image> pageQueryAllForLatest(int pageNo, int pageSize) {
        return imageDao.pageQueryAllForLatest(pageNo, pageSize);
    }

    /**
     * 按照图片热度递减的顺序分页查询所有图片
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<Image> pageQueryAllForHot(int pageNo, int pageSize) {
        return imageDao.pageQueryAllForHot(pageNo, pageSize);
    }

    /**
     * 下载图片成功，图片下载次数+1
     * @param image
     */
    public void downloadImageSuccess(Image image) {
        image.setImageDownloadCount(image.getImageDownloadCount() + 1);
        imageDao.update(image);

        Account account = accountService.findAccountByUsername(image.getImageAccountNickname());
        accountService.updateAccount(account);
    }

    /**
     * 上传图片成功，保存图片Id到用户列表
     * @param location
     * @param account
     * @param image
     */
    public void uploadImageSuccess(String location, Account account, Image image) {
        image.setImageLocation(location);
        image.setImageUploadTime(DateUtils.getNowByTimestamp());
        image.setImageId(NumberUtils.generateUUID());

        if (image.getImageIsAutoDelete() && image.getImageAutoDeleteTime() == null) {
            image.setImageAutoDeleteTime(DateUtils.convertLongToTime(System.currentTimeMillis() + Constant.AUTO_DELETE_TIME));
        }

        createImage(image);

        accountService.updateAccount(account);
    }

    /**
     * 获取系统对指定图片产生的指定数量的相关推荐图片
     * @param image
     * @param count
     * @return
     */
    @Override
    public List<Image> findRecommendedByImage(Image image, int count) {
        String cataloge = image.getImageCatalogeName();
        Page<Image> imagePage = this.pageQueryForCataloge(cataloge, 1, count);

        return imagePage.getData();
    }

    @Override
    public Page<Image> pageQueryForCataloge(String catalogeName, int pageNo, int pageSize) {
        return imageDao.pageQueryForCataloge(catalogeName, pageNo, pageSize);
    }

    /**
     * 查询获取指定数量指定用户收藏的图片
     * @param homeAccount
     * @param count 如果为0，则获取所有图片
     * @return
     */
    @Override
    public List<Image> findCollectionByAccount(Account homeAccount, int count) {
        String collectionOfImages = homeAccount.getAccountCollectImageIds();
        List<Image> images = new ArrayList<Image>();

        if (collectionOfImages == null) {
            return null;
        }

        if (count == 0) {
            for (String imageId : collectionOfImages.split(",")) {
                images.add(this.findImageByImageId(imageId));
            }
        } else {
            while (count > 0) {
                for (String imageId : collectionOfImages.split(",")) {
                    images.add(this.findImageByImageId(imageId));
                    count--;
                }
            }
        }

        return images;
    }

    @Resource
    public void setImageDao(ImageDao imageDao) {
        this.imageDao = imageDao;
    }

    @Resource
    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }
}
