package com.guanglumedia.cms.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.admin.entity.Group;
import com.guanglumedia.cms.admin.entity.GroupRoleView;
@Repository
public abstract interface GroupDao {

	public abstract List<Group> findGroupList(Group group, RowBounds rowBounds);

	public abstract int findCount();

	public abstract Group getGroupById(@Param("id")int id);

	public abstract int updateGroup(Group group);

	public abstract int addGroup(Group group);

	public abstract int delGroup(@Param("id")int id);

	public abstract List<GroupRoleView> findAllGroupByIdList(@Param("id")int id);

	public abstract void delteAllRoleByGroupID(@Param("groupId")String groupId);

	public abstract int batchupdateRoleByGroupId(@Param("roles")List<String> asList,
			@Param("id")String groupId);

	public abstract int hasGroupName(@Param("groupName")String groupName, @Param("id")int i);

	public abstract List<Group> findAllGroup();

}
