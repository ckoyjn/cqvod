package com.guanglumedia.api.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface PageRestDao {

    public List<Map<String, Object>> getRollingnewsList();

    public int findRollingnewsCount();

    public List<Map<String, Object>> getDynamiccontentList();

    public int findDynamiccontentCount();

    public List<Map<String, Object>> getRecommendList();

    public int findRecommendCount();
}
