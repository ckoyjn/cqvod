package com.guanglumedia.api.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.ExtboothRestDao;
import com.guanglumedia.api.dao.PageRestDao;

@Service
public class PageRestService {
    @Autowired
    private PageRestDao dao;
    @Transactional
    public List<Map<String,Object>> getRollingnewsList() {
        return dao.getRollingnewsList();
    }
    public int findRollingnewsCount() {
        return dao.findRollingnewsCount();
    }
    public List<Map<String,Object>> getDynamiccontentList() {
        return dao.getDynamiccontentList();
    }
    public int findDynamiccontentCount() {
        return dao.findDynamiccontentCount();
    }
    public List<Map<String,Object>> getRecommendList() {
        return dao.getRecommendList();
    }
    public int findRecommendCount() {
        return dao.findRecommendCount();
    }

}
