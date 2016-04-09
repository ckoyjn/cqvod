package com.guanglumedia.cms.rollingnews.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.guanglumedia.cms.rollingnews.entity.Rollingnews;

@Repository
public abstract interface RollingnewsDao {
    public List<Map<String, Object>> findRollingnewsList(RowBounds rowBounds, Map<String, Object> map);
    public int                       findCount();
    public int              		 addRollingnews(Map<String, Object> map);
    public Rollingnews               getRollingnewsById(@RequestParam("id")int id);
    public int                       updateRollingnews(Rollingnews rollingnews);
    public int                       delRollingnews(@Param("id")int  id);
}
