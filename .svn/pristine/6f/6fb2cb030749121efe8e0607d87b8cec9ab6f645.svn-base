package com.guanglumedia.cms.recommend.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.recommend.entity.Recommend;

@Repository
public abstract interface CmsRecommendDao {

    public abstract int findCount();

    public abstract Recommend getRecommendInfoByID(int id);

    public abstract int addRecommend(Map<String, Object> map);

    public abstract List<Map<String, Object>> findAllMovie();

    public abstract List<Map<String, Object>> findRecommendList(Map<String, Object> map, RowBounds rowBounds);

    public abstract Map<String, Object> getRecommendById(Map<String, Object> map);

    public abstract int updateRecommend(Map<String, Object> map);

    public abstract int delRecommend(int id);

    public abstract List<Map<String, Object>> findObjectNameByType(Map<String, Object> map);

    public abstract List<Map<String, Object>> findAllSpecil();

    public abstract String findobjectIdentify(Map<String, Object> map);
}
