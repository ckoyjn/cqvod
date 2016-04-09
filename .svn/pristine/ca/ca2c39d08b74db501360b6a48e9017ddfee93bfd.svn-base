package com.guanglumedia.cms.favorite.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.favorite.dao.CMSFavoriteDao;
import com.guanglumedia.cms.favorite.entity.CMSFavorite;

@Service
public class CMSFavoriteService {
    @Autowired
    CMSFavoriteDao cMSFavoriteDao; 
    
    public PagedModelList<CMSFavorite> getFavoriteList(int pageNo,int pageRow,CMSFavorite f) {
        List<CMSFavorite> list = cMSFavoriteDao.getFavoriteList(f, new RowBounds((pageNo-1)*pageRow, pageRow));
        int count = cMSFavoriteDao.getFavoriteListCount(f);
        PagedModelList<CMSFavorite> page = new PagedModelList<CMSFavorite>(pageNo, pageRow, count);
        page.addModels(list);
        return page;
    }

    public CMSFavoriteDao getcMSFavoriteDao() {
        return cMSFavoriteDao;
    }

    public void setcMSFavoriteDao(CMSFavoriteDao cMSFavoriteDao) {
        this.cMSFavoriteDao = cMSFavoriteDao;
    }
    
}
