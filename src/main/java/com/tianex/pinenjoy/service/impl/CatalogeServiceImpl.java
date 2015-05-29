package com.tianex.pinenjoy.service.impl;

import com.tianex.pinenjoy.dao.CatalogeDao;
import com.tianex.pinenjoy.domain.Cataloge;
import com.tianex.pinenjoy.service.CatalogeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("catalogeService")
public class CatalogeServiceImpl implements CatalogeService {

    private CatalogeDao catalogeDao;

    public void createCataloge(Cataloge cataloge) {
        catalogeDao.save(cataloge);
    }

    public void deleteCataloge(Cataloge cataloge) {
        catalogeDao.delete(cataloge);
    }

    public void updateCataloge(Cataloge cataloge) {
        catalogeDao.update(cataloge);
    }

    public List<Cataloge> findAll() {
        return catalogeDao.loadAll();
    }

    @Override
    public Cataloge findCatalogeByCatalogeName(String imageCatalogeName) {
        return catalogeDao.findCatalogeByCatalogeName(imageCatalogeName);
    }

    @Resource
    public void setCatalogeDao(CatalogeDao catalogeDao) {
        this.catalogeDao = catalogeDao;
    }

}
