package com.guanglumedia.api.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.api.dao.ActivityRestDao;
import com.guanglumedia.api.utils.FormatPageBeanUtils;
import com.guanglumedia.cms.activity.entity.Activity;
import com.guanglumedia.cms.common.PagedModelList;

@Service
public class ActivityRestService {

	@Autowired
	private ActivityRestDao dao;
	
	public Map<String,Object> getAllActivity(int pageNo, int pageRow) {
		List<Activity> list = dao.getAllActivity(new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.dao.getActivityCount();
		PagedModelList<Activity> pml = new PagedModelList<Activity>(pageNo, pageRow, count);
		pml.addModels(list);
		return FormatPageBeanUtils.format(pml);
	}

}
