package com.tianex.pinenjoy.dao;

import com.tianex.pinenjoy.domain.Role;
import com.tianex.pinenjoy.service.ResourceService;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

@Repository("roleDao")
public class RoleDao extends BaseDao<Role> {

    private ResourceService resourceService;

    public Set<String> findResourcesByRoleId(String roleId) {
        Role role = super.load(roleId);
        Set<String> sets = new HashSet<String>();

        for (String s : role.getResourceIds().split(",")) {
            sets.add(s);
        }

        return sets;
    }

    public Set<String> findPermissionsByRoleId(String roleId) {
        Set<String> sets = findResourcesByRoleId(roleId);

        return resourceService.findPermissionByResourceIds(sets);
    }

    @Resource
    public void setResourceService(ResourceService resourceService) {
        this.resourceService = resourceService;
    }

}
