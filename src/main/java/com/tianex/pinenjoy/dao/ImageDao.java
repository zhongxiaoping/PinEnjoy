package com.tianex.pinenjoy.dao;

import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.domain.Image;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("imageDao")
public class ImageDao extends BaseDao<Image> {

    public static final String PAGEQUERY_ALL = "from Image";

    public static final String PAGEQUERY_ACCOUNTNICKNAME = "from Image i where i.imageAccountNickname=?";
    public static final String PAGEQUERY_LATEST = "from Image i where i.imageAccountNickname=? order by i.imageUploadTime DESC";
    public static final String PAGEQUERY_ALL_LATEST = "from Image i order by i.imageUploadTime DESC";
    public static final String PAGEQUERY_HOT = "from Image i where i.imageAccountNickname=? order by i.imageScore DESC";
    public static final String PAGEQUERY_ALL_HOT = "from Image i order by i.imageScore DESC";


    public Page<Image> pageQueryAll(int pageNo, int pageSize) {
        return super.pagedQuery(PAGEQUERY_ALL, pageNo, pageSize);
    }

    public Page<Image> pagedQueryByUsername(String accountNickname, int pageNo, int pageSize) {
        return super.pagedQuery(PAGEQUERY_ACCOUNTNICKNAME, pageNo, pageSize, accountNickname);
    }

    public Page<Image> pageQueryAllForLatest(int pageNo, int pageSize, String accountNickname) {
        return super.pagedQuery(PAGEQUERY_ALL_LATEST, pageNo, pageSize, accountNickname);
    }

    public Page<Image> pageQueryAllForHot(int pageNo, int pageSize, String accountNickname) {
        return super.pagedQuery(PAGEQUERY_ALL_HOT, pageNo, pageSize, accountNickname);
    }

    public Page<Image> pageQueryForLatest(int pageNo, int pageSize, String accountNickname) {
        return super.pagedQuery(PAGEQUERY_LATEST, pageNo, pageSize, accountNickname);
    }

    public Page<Image> pageQueryForHot(int pageNo, int pageSize, String accountNickname) {
        return super.pagedQuery(PAGEQUERY_HOT, pageNo, pageSize, accountNickname);
    }

    public Image findImageByImageId(String imageId) {
        return super.get(imageId);
    }

    public List<Image> findAll() {
        return super.loadAll();
    }
}
