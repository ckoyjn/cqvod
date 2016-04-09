package com.guanglumedia.cms.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.admin.entity.User;

@Repository
public abstract interface UserDao {
	public List<User> findUserList(User user, RowBounds rowBounds);
	public int findCount();
	public User getUserById(@Param("id")int id);
	public int hasLoginName(@Param("loginname")String rname, @Param("id")String id);
	public int UpdateUser(User user);
	public int addUser(User user);
	public int delUser(@Param("id")int id);
	public int getUserByGroupId(@Param("groupid")int id);
}
