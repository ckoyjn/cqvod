package com.guanglumedia.cms.recommend.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.recommend.dao.CmsRecommendDao;

@Service
public class CmsRecommendService {
    @Autowired
    private CmsRecommendDao cmsRecommendDao;

    public int AddRecommend(Map<String, Object> map) {
        return cmsRecommendDao.addRecommend(map);
    }

    public List<Map<String, Object>> findAllMovie() {
      
        return cmsRecommendDao.findAllMovie();
    }
    @Transactional
    public PagedModelList<Map<String, Object>> findRecommendList(Map<String, Object> map, int pageNo, int pageRow) {
        List<Map<String, Object>> list = this.cmsRecommendDao.findRecommendList(map, new RowBounds((pageNo - 1) * pageRow, pageRow));
        int count = this.cmsRecommendDao.findCount();
        PagedModelList<Map<String, Object>> pml = new PagedModelList<Map<String, Object>>(pageNo, pageRow, count);
        pml.addModels(list);
        return pml;
    }

    public Map<String, Object> getRecommendById(Map<String,Object> map) {
        return cmsRecommendDao.getRecommendById(map);
    }


    public int updateRecommend(Map<String, Object> map) {
       
        return cmsRecommendDao.updateRecommend(map);
    }

    public int delRecommend(int id) {
      
        return cmsRecommendDao.delRecommend(id);
    }


    public List<Map<String, Object>> findObjectNameByType(Map<String,Object> map) {
        return cmsRecommendDao.findObjectNameByType(map);
    }

    public List<Map<String, Object>> findAllSpecil() {
        return cmsRecommendDao.findAllSpecil();
    }

    public String findobjectIdentify(Map<String, Object> map) {
        return cmsRecommendDao.findobjectIdentify(map);
    }

  
}
