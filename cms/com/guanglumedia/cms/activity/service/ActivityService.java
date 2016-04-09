package com.guanglumedia.cms.activity.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.activity.dao.ActivityDao;
import com.guanglumedia.cms.activity.entity.Activity;
import com.guanglumedia.cms.common.PagedModelList;

@Service
public class ActivityService {

	@Autowired
	private ActivityDao dao;
	
	public PagedModelList<Activity> getActivityList(int pageNo, int pageRow) {
		List<Activity> activtyList = dao.getActivityList(new RowBounds((pageNo-1)*pageRow, pageRow));
		int count = dao.getActivityCount();
		PagedModelList<Activity> page = new PagedModelList<Activity>(pageNo, pageRow, count);
		page.addModels(activtyList);
		return page;
	}

	public Activity getActivityById(int id) {
		return dao.getActivityById(id);
	}

	public int HasOrderby(String orderby) {
		return dao.hasOrderby(orderby);
	}

	public int insertActivity(Activity activity) {
		return dao.insertActivity(activity);
	}

	public int deleteActivityByIds(int[] ids) {
		return dao.deleteActivityByIds(ids);
	}

	public int updateActivity(Activity activity) {
		return dao.updateActivity(activity);
	}

}
