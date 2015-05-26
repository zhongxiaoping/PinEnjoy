package com.tianex.pinenjoy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "t_role")
public class Role implements Serializable {
    private static final long serialVersionUID = 5918150653828406872L;

    private String roleId;
    /*
     * 角色标识, 程序中判断使用, eg."admin"
     */
    private String roleLabel;
    /*
     * 角色描述, UI界面显示使用
     */
    private String description;
    /*
     * 角色拥有的资源
     */
    private String resourceIds;
    /*
     * 是否可用,如果不可用将不会添加给用户
     */
    private Boolean available;

    public Role() {
    }

    public Role(String roleLabel, String description, Boolean available) {
        this.roleLabel = roleLabel;
        this.description = description;
        this.available = available;
    }

    @Id
    @Column(name = "role_id")
    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    @Column(name = "role_label")
    public String getRoleLabel() {
        return roleLabel;
    }

    public void setRoleLabel(String roleLabel) {
        this.roleLabel = roleLabel;
    }

    @Column(name = "role_description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "role_resourceIds")
    public String getResourceIds() {
        return resourceIds;
    }

    public void setResourceIds(String resourceIds) {
        this.resourceIds = resourceIds;
    }

    @Column(name = "role_available")
    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Role role = (Role) o;

        return !(roleId != null ? !roleId.equals(role.roleId) : role.roleId != null);

    }

    @Override
    public int hashCode() {
        return roleId != null ? roleId.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleId='" + roleId + '\'' +
                ", roleLabel='" + roleLabel + '\'' +
                ", description='" + description + '\'' +
                ", resourceIds='" + resourceIds + '\'' +
                ", available=" + available +
                '}';
    }

}
