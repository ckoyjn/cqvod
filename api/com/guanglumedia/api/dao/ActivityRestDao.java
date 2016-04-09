package com.guanglumedia.api.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.guanglumedia.cms.activity.entity.Activity;

public interface ActivityRestDao {

	List<Activity> getAllActivity(RowBounds rowBounds);

	int getActivityCount();

}
