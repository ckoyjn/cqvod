package com.guanglumedia.cms.admin.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.cms.admin.dao.RoleDao;
import com.guanglumedia.cms.admin.entity.Role;
import com.guanglumedia.cms.common.PagedModelList;

@Service
public class RoleService {
	@Autowired
	private RoleDao Roledao;
	@Transactional
	public PagedModelList<Role> findAllRoleList(Role role, int pageNo,int pageRow) throws UnsupportedEncodingException {
	    if (role.getRoleName() != null) {
            String roleName= new String(role.getRoleName().getBytes("ISO-8859-1"), "utf-8");
            role.setRoleName(roleName);
        }
		List<Role> list = this.Roledao.findRoleList(role, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.Roledao.findCount();
		PagedModelList<Role> pml = new PagedModelList<Role>(pageNo, pageRow, count);
		pml.addModels(list);
		return pml;
	}

	public Role getRoleById(int id) {
		return this.Roledao.getRoleById(id);
	}

	public int UpdateRole(Role role) {
		return this.Roledao.updateRole(role);
	}

	public int AddRole(Role role) {
		return  this.Roledao.addRole(role);
	}

	public int DelRole(int id) {
		this.Roledao.deleteRoleRight(id+"");
		return this.Roledao.delRole(id);
	}

	public Set<Integer> findAllRoleIdByGroupId(int id) {
		return  this.Roledao.findRoleListByGroupId(id);
	}

	public List<Role>  findAllRoleList() {
		return this.Roledao.findAllRoleList();
	}

	public int UpdateRoleResource(String roleId, String[] resources) {
		this.Roledao.deleteRoleResource(roleId);
		if(null ==resources[0] || "".equals(resources[0])){
			return 100;
		}else{
			return this.Roledao.AddRoleResource(roleId,resources);
		}
	}

	public int UpdateRightByRoleId(String roleId, String rightId) {
		this.Roledao.deleteRoleRight(roleId);
		return this.Roledao.AddRoleRight(roleId,rightId.split(","));
	}

	public Set<Integer> findGroupIdByRoleId(int id) {
		return this.Roledao.findGroupIdByRoleId(id);
	}

	public List<Role> findAllSelectRoleList() {
		return this.Roledao.findAllSelectRoleList();
	}

	public int hasRoleName(String roleName, int id) {
		return Roledao.hasRoleName(roleName, id);
	}
}
