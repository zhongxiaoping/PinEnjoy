package com.tianex.pinenjoy.service;

import java.util.Set;


public interface ResourceService {

    Set<String> findPermissionByResourceId(String resourceId);
    Set<String> findPermissionByResourceIds(Set<String> sets);

}
