package com.tianex.pinenjoy.service.impl;

import com.tianex.pinenjoy.dao.ResourceDao;
import com.tianex.pinenjoy.service.ResourceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Set;

@Service("resourceService")
public class ResourceServiceImpl implements ResourceService {

    private ResourceDao resourceDao;

    @Override
    public Set<String> findPermissionByResourceId(String resourceId) {
        return resourceDao.findPermissionByResourceId(resourceId);
    }

    @Override
    public Set<String> findPermissionByResourceIds(Set<String> sets) {
        return resourceDao.findPermissionByResourceIds(sets);
    }

    @Resource
    public void setResourceDao(ResourceDao resourceDao) {
        this.resourceDao = resourceDao;
    }
}

