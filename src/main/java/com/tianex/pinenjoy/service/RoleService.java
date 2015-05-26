package com.tianex.pinenjoy.service;

import java.util.Set;

public interface RoleService {

    public Set<String> findResourcesByRoleId(String roleId);
    public Set<String> findPermissionsByRoleId(String roleId);

    public Set<String> findRolesByRoleIds(String accountRoleIds);
}
