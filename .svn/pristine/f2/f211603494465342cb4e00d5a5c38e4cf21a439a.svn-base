package com.guanglumedia.cms.admin.dao;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.admin.entity.Role;
@Repository
public abstract interface RoleDao {

	public abstract List<Role> findRoleList(Role role, RowBounds rowBounds);

	public abstract int findCount();
	
	public abstract Role getRoleById(@Param("id")int id);

	public abstract int updateRole(Role role);

	public abstract int addRole(Role role);

	public abstract int delRole(@Param("id")int id);

	public abstract Set<Integer> findRoleListByGroupId(@Param("id")int id);

	public abstract List<Role> findAllRoleList();

	public abstract Set<String> findRoleResource(@Param("id")int id);

	public abstract void deleteRoleResource(@Param("id")String roleId);

	public abstract int AddRoleResource(@Param("id")String roleId, @Param("resources")String[] resources);

	public abstract void deleteRoleRight(@Param("id")String roleId);

	public abstract int AddRoleRight(@Param("id")String roleId, @Param("rights")String[] split);

	public abstract int getStatusByRoleId(@Param("id")int roleId);

	public abstract Set<Integer> findGroupIdByRoleId(@Param("id")int id);

	public abstract List<Role> findAllSelectRoleList();
	
	public abstract int hasRoleName(@Param("rolename")String roleName, @Param("id")int id);
	
}
