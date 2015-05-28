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
     * ��ȡ����ͼƬ
     * @return
     */
    public List<Image> findAll() {
        return imageDao.findAll();
    }

    /**
     * ����ͼƬId��ȡͼƬʵ��
     * @param imageId
     * @return
     */
    public Image findImageByImageId(String imageId) {
        return imageDao.findImageByImageId(imageId);
    }

    /**
     * ��ҳ��ѯ�����û��ϴ���ͼƬ
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<Image> pageQueryAll(int pageNo, int pageSize) {
        return imageDao.pageQueryAll(pageNo, pageSize);
    }

    /**
     * ��ҳ��ѯָ���û��ϴ���ͼƬ
     * @param accountNickname
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<Image> pageQueryByUsername(String accountNickname, int pageNo, int pageSize) {
        return imageDao.pagedQueryByUsername(accountNickname, pageNo, pageSize);
    }

    /**
     * ����ͼƬ�ϴ�ʱ���Ⱥ��ҳ��ѯָ���û��ϴ���ͼƬ
     * @param pageNo
     * @param pageSize
     * @param accountNickname
     * @return
     */
    public Page<Image> pageQueryForLatest(int pageNo, int pageSize, String accountNickname) {
        return imageDao.pageQueryForLatest(pageNo, pageSize, accountNickname);
    }

    /**
     * ����ͼƬ�ȶȵݼ���˳���ҳ��ѯָ���û��ϴ���ͼƬ
     * @param pageNo
     * @param pageSize
     * @param accountNickname
     * @return
     */
    public Page<Image> pageQueryForHot(int pageNo, int pageSize, String accountNickname) {
        return imageDao.pageQueryForHot(pageNo, pageSize, accountNickname);
    }

    /**
     * ����ͼƬ�ϴ�ʱ���Ⱥ��ҳ��ѯ����ͼƬ
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<Image> pageQueryAllForLatest(int pageNo, int pageSize) {
        return imageDao.pageQueryAllForLatest(pageNo, pageSize);
    }

    /**
     * ����ͼƬ�ȶȵݼ���˳���ҳ��ѯ����ͼƬ
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<Image> pageQueryAllForHot(int pageNo, int pageSize) {
        return imageDao.pageQueryAllForHot(pageNo, pageSize);
    }

    /**
     * ����ͼƬ�ɹ���ͼƬ���ش���+1
     * @param image
     */
    public void downloadImageSuccess(Image image) {
        image.setImageDownloadCount(image.getImageDownloadCount() + 1);
        imageDao.update(image);

        Account account = accountService.findAccountByUsername(image.getImageAccountNickname());
        accountService.updateAccount(account);
    }

    /**
     * �ϴ�ͼƬ�ɹ�������ͼƬId���û��б�
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
     * ��ȡϵͳ��ָ��ͼƬ������ָ������������Ƽ�ͼƬ
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
     * ��ѯ��ȡָ������ָ���û��ղص�ͼƬ
     * @param homeAccount
     * @param count ���Ϊ0�����ȡ����ͼƬ
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
