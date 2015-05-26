package com.tianex.pinenjoy.dao;

import com.tianex.pinenjoy.domain.Resource;
import org.springframework.stereotype.Repository;

import java.util.HashSet;
import java.util.Set;

@Repository("resourceDao")
public class ResourceDao extends BaseDao<Resource> {

    public static final String PERMISSION_RESOURCEID = "from Resource r where r.";

    public Set<String> findPermissionByResourceId(String resourceId) {
        Resource resource = super.load(resourceId);

        Set<String> sets = new HashSet<String>();
        for (String s : resource.getPermission().split(",")) {
            sets.add(s);
        }

        return sets;
    }

    public Set<String> findPermissionByResourceIds(Set<String> resourceIds) {
        Set<String> sets = new HashSet<String>();

        for (String s : resourceIds) {
            sets.addAll(findPermissionByResourceId(s));
        }

        return sets;
    }

}
