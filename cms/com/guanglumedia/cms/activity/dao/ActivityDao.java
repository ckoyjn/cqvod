package com.guanglumedia.cms.activity.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.guanglumedia.cms.activity.entity.Activity;

public interface ActivityDao {

	int getActivityCount();

	List<Activity> getActivityList(RowBounds rowBounds);

	Activity getActivityById(int id);

	int hasOrderby(String orderby);

	int insertActivity(Activity activity);

	int deleteActivityByIds(@Param("ids")int[] ids);

	int updateActivity(Activity activity);

}
