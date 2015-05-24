package com.tianex.pinenjoy.service;

import com.tianex.pinenjoy.domain.Cataloge;

import java.util.List;

public interface CatalogeService {

    public void createCataloge(Cataloge cataloge);
    public void deleteCataloge(Cataloge cataloge);
    public void updateCataloge(Cataloge cataloge);

    public List<Cataloge> findAll();

}
