package com.guanglumedia.api.service;


import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.CategoryRestDao;
import com.guanglumedia.api.utils.FormatPageBeanUtils;
import com.guanglumedia.cms.common.PagedModelList;

@Service
public class CategoryRestService {
    @Autowired
    private CategoryRestDao dao;
    @Transactional
    public List<Map<String,Object>> getAllCategory() throws UnsupportedEncodingException
    {
    	List<Map<String,Object>> list = dao.getAllCategory();
    	return list;
    }
    
    @Transactional
    public Map<String,Object> getCategoryMovie(int categoryid,int pageNo,int pageRow)
    {
    	List<Map<String, Object>> list = dao.getCategoryMovie(categoryid, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.dao.findCount(categoryid);
		PagedModelList<Map<String,Object>> pml = new PagedModelList<Map<String,Object>>(pageNo, pageRow, count);
		pml.addModels(list);
		return FormatPageBeanUtils.format(pml);
    }

    public Object getHotMovie(int pageNo, int pageRow) {
        List<Map<String, Object>> list = dao.getHotMovie( new RowBounds((pageNo - 1) * pageRow, pageRow));
        int count=this.dao.findHotMovieCount();
        PagedModelList<Map<String,Object>> pml = new PagedModelList<Map<String,Object>>(pageNo, pageRow, count);
        pml.addModels(list);
        return FormatPageBeanUtils.format(pml);
    }

}
