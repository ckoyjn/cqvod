package com.guanglumedia.api.service;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.WatchRestDao;
import com.guanglumedia.api.utils.FormatPageBeanUtils;
import com.guanglumedia.cms.common.PagedModelList;

@Service
public class WatchRestService {
	
	@Autowired
	private WatchRestDao dao;

	@Transactional
	public boolean addWatchRecord(JSONObject jsonObject) {
		if(dao.addWatchRecord(jsonObject)>0){
			return true;
		}
		return false;
	}

	@Transactional
	public Map<String, Object> getwatchRecordByUserId(String smartcardid, int pageNo,
			int pageRow) {
		List<Map<String,Object>> list=dao.getwatchRecordByUserId(smartcardid,new RowBounds((pageNo-1)*pageRow,pageRow));
		int count =dao.findCount(smartcardid);
		PagedModelList<Map<String, Object>> pml=new PagedModelList<Map<String,Object>>(pageNo,pageRow,count);
		pml.addModels(list);
		return FormatPageBeanUtils.format(pml);
	}

}
