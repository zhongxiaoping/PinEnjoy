package com.tianex.pinenjoy.dao;

import com.tianex.pinenjoy.domain.Cataloge;
import org.springframework.stereotype.Repository;

@Repository("catalogeDao")
public class CatalogeDao extends BaseDao<Cataloge> {

    public static final String CATALOGE_NAME = "from Cataloge c where c.catalogeName=?";

    public Cataloge findCatalogeByCatalogeName(String imageCatalogeName) {
        return super.find(CATALOGE_NAME, imageCatalogeName).get(0);
    }

}
