package com.guanglumedia.cms.admin.service;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.cms.admin.dao.GroupDao;
import com.guanglumedia.cms.admin.dao.RoleDao;
import com.guanglumedia.cms.admin.entity.Group;
import com.guanglumedia.cms.common.PagedModelList;

@Service
public class GroupService {
	@Autowired
	private GroupDao groupdao;
	
	@Autowired
	private RoleDao roledao;
	
	@Transactional
	public PagedModelList<Group> findAllGroupList(Group group, int pageNo,int pageRow) throws UnsupportedEncodingException {
	    if (group.getGroupName() != null) {
            String groupName = new String(group.getGroupName().getBytes("ISO-8859-1"), "utf-8");
            group.setGroupName(groupName);
        }
		List<Group> list = this.groupdao.findGroupList(group, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.groupdao.findCount();
		PagedModelList<Group> pml = new PagedModelList<Group>(pageNo, pageRow, count);
		pml.addModels(list);
		return pml;
	}

	public Group getGroupById(int id) {
		return groupdao.getGroupById(id);
	}

	public int UpdateGroup(Group group) {
		return groupdao.updateGroup(group);
	}

	public int AddGroup(Group group) {
		return groupdao.addGroup(group);
	}

	public int DelGroup(int id) {
		return groupdao.delGroup(id);
	}
	
	@Transactional
	public int UpdateRoleByGroupId(String roleId, String groupId) {
		String[] roles=roleId.split(",");
		groupdao.delteAllRoleByGroupID(groupId);
		int i=groupdao.batchupdateRoleByGroupId(Arrays.asList(roles),groupId);
		return 0;
	}

	public int HasGroupName(String groupName, int i) {
		return groupdao.hasGroupName(groupName,i);
	}

	public List<Group> findAllGroup() {
		return groupdao.findAllGroup();
	}
}
