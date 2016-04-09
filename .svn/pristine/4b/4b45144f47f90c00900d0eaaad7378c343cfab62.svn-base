package com.guanglumedia.cms.bosslog.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.bosslog.dao.BosslogDao;
import com.guanglumedia.cms.bosslog.entity.Bosslog;
import com.guanglumedia.cms.common.PagedModelList;

@Service
public class BosslogService {
	
	@Autowired
	private BosslogDao bosslogDao;

	public PagedModelList<Bosslog> getBosslogList(int pageNo, int pageRow,Bosslog bl) {
		 List<Bosslog> list= bosslogDao.getBosslogList(bl,new RowBounds((pageNo-1)*pageRow, pageRow));
	     int count = bosslogDao.getBosslogCount();
	     PagedModelList<Bosslog> page = new PagedModelList<Bosslog>(pageNo, pageRow, count);
	     page.addModels(list);
	     return page;
	}
	
	public Map<String,Object> getCount(Bosslog bl){
		return bosslogDao.getCount(bl);
	}

}
