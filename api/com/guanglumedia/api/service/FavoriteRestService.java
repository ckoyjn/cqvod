package com.guanglumedia.api.service;


import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.FavoriteDao;
import com.guanglumedia.api.entity.Favorite;
import com.guanglumedia.api.utils.FormatPageBeanUtils;
import com.guanglumedia.cms.common.PagedModelList;

@Service
public class FavoriteRestService {
    @Autowired
    private FavoriteDao dao;
    @Transactional
    public boolean addFavorite(JSONObject jsonObject)
    {
    	if(dao.getFavoriteByIdPid(jsonObject)>0){
    		return true;
    	}else{
    		return dao.addFavorite(jsonObject)>0;
    	}
    }
    
    @Transactional
    public boolean delFavoriteByIdPid(JSONObject jsonObject)
    {
   		return dao.delFavoriteByIdPid(jsonObject)>0;
    }
    
    @Transactional
    public Map<String,Object> getFavorite(JSONObject jsonObject,int pageNo,int pageRow)
    {
    	List<Favorite> list = dao.getFavorite(jsonObject, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count= list.size();
		PagedModelList<Favorite> pml = new PagedModelList<Favorite>(pageNo, pageRow, count);
		pml.addModels(list);
		return FormatPageBeanUtils.format(pml);
    }
}
