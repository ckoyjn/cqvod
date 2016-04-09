package com.guanglumedia.cms.admin.dao;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.admin.entity.Right;
@Repository
public abstract interface RightDao {


	public abstract int findCount();

	public abstract List<Right> findRightList(Right right, RowBounds rowBounds);

	public abstract Right getRightById(@Param("id")int id);

	public abstract int updateRight(Right right);

	public abstract int addRight(Right right);

	public abstract int delRight(@Param("id")int id);

	public abstract Set<Integer> findAllRgihtByRoleId(@Param("id")int id);

	public abstract List<Right> findAllRightList();
	
	public abstract int hasRightName(@Param("rightname")String rightName, @Param("id")int id);
}
