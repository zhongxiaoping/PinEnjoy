package com.tianex.pinenjoy.service.impl;

import com.tianex.pinenjoy.dao.RoleDao;
import com.tianex.pinenjoy.domain.Role;
import com.tianex.pinenjoy.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

    private RoleDao roleDao;

    @Override
    public Set<String> findResourcesByRoleId(String roleId) {
        return roleDao.findResourcesByRoleId(roleId);
    }

    @Override
    public Set<String> findPermissionsByRoleId(String roleId) {
        return roleDao.findPermissionsByRoleId(roleId);
    }

    @Override
    public Set<String> findRolesByRoleIds(String accountRoleIds) {
        Set<String> stringSet = new HashSet<String>();

        Role role = null;
        for (String s : accountRoleIds.split(",")) {
            role = roleDao.load(s);
            if (role != null) {
                stringSet.add(role.getRoleLabel());
            }
        }

        return stringSet;
    }

    @Resource
    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }
}
