package com.tianex.pinenjoy.service;

import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Image;

import java.util.List;

public interface ImageService {

    public void createImage(Image image);
    public void deleteImage(Image image);
    public void update(Image image);

    public List<Image> findAll();
    public Image findImageByImageId(String imageId);

    public Page<Image> pageQueryAll(int pageNo, int pageSize);
    public Page<Image> pageQueryByUsername(String accountNickname, int pageNo, int pageSize);
    public Page<Image> pageQueryForLatest(int pageNo, int pageSize, String accountNickname);
    public Page<Image> pageQueryForHot(int pageNo, int pageSize, String accountNickname);
    public Page<Image> pageQueryAllForLatest(int pageNo, int pageSize, String accountNickname);
    public Page<Image> pageQueryAllForHot(int pageNo, int pageSize, String accountNickname);

    public void downloadImageSuccess(Image image);
    public void uploadImageSuccess(String location, Account account, Image image);

}
