package com.tianex.pinenjoy.service;

import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Image;

import java.util.List;

public interface ImageService {

    void createImage(Image image);
    void deleteImage(Image image);
    void update(Image image);

    List<Image> findAll();
    Image findImageByImageId(String imageId);

    Page<Image> pageQueryByUsername(String accountNickname, int pageNo, int pageSize);
    Page<Image> pageQueryForLatest(int pageNo, int pageSize, String accountNickname);
    Page<Image> pageQueryForHot(int pageNo, int pageSize, String accountNickname);

    Page<Image> pageQueryAll(int pageNo, int pageSize);
    Page<Image> pageQueryAllForLatest(int pageNo, int pageSize);
    Page<Image> pageQueryAllForHot(int pageNo, int pageSize);

    void downloadImageSuccess(Image image);
    void uploadImageSuccess(String location, Account account, Image image);

    List<Image> findRecommendedByImage(Image image, int i);
    Page<Image> pageQueryForCataloge(String catalogeName, int pageNo, int pageSize);

    List<Image> findCollectionByAccount(Account homeAccount, int count);
}
