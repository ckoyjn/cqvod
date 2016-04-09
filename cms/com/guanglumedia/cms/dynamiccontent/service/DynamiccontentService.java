package com.guanglumedia.cms.dynamiccontent.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.dynamiccontent.dao.DynamiccontentDao;
import com.guanglumedia.cms.dynamiccontent.entity.Dynamiccontent;

@Service
public class DynamiccontentService {
	@Autowired
	private DynamiccontentDao dynamiccontentdao;
	
	public PagedModelList<Dynamiccontent> findAllDynamiccontentList(Dynamiccontent dynamiccontent, int pageNo,int pageRow) throws UnsupportedEncodingException {
	    if (dynamiccontent.getTitle() != null) {
            String title = new String(dynamiccontent.getTitle().getBytes("ISO-8859-1"), "utf-8");
            dynamiccontent.setTitle(title);
        }
        if (dynamiccontent.getType()!= null) {
            String type = new String(dynamiccontent.getType().getBytes("ISO-8859-1"), "utf-8");
            dynamiccontent.setType(type);
        }
		List<Dynamiccontent>           list  = dynamiccontentdao.findDynamiccontentList(dynamiccontent, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int                            count = dynamiccontentdao.findCount(dynamiccontent);
		PagedModelList<Dynamiccontent> pml   = new PagedModelList<Dynamiccontent>(pageNo, pageRow, count);
		pml.addModels(list);
		return pml;
	}
	
	public Dynamiccontent getDynamiccontentById(int id) {
		return dynamiccontentdao.getDynamiccontentById(id);
	}
	
	public int updateDynamiccontent(Dynamiccontent dynamiccontent) {
		return dynamiccontentdao.updateDynamiccontent(dynamiccontent);
	}

	public int addDynamiccontent(Dynamiccontent dynamiccontent) {
		return dynamiccontentdao.addDynamiccontent(dynamiccontent);
	}

	public int delDynamiccontent(int id) {
		return dynamiccontentdao.delDynamiccontent(id);
	}
}
