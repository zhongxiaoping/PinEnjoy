package com.tianex.pinenjoy.service;

import com.tianex.pinenjoy.domain.Cataloge;

import java.util.List;

public interface CatalogeService {

    void createCataloge(Cataloge cataloge);
    void deleteCataloge(Cataloge cataloge);
    void updateCataloge(Cataloge cataloge);

    List<Cataloge> findAll();

    Cataloge findCatalogeByCatalogeName(String imageCatalogeName);

}
