package com.guanglumedia.cms.admin.dao;

import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.admin.entity.User;
@Repository
public abstract interface LoginDao {

	public User CheckUserLogin(@Param("LoginName")String loginName, @Param("Password")String password);

	public Set<String> getUserRightByGroupID(@Param("GroupID")String groupID);
	
}
