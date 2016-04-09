package com.guanglumedia.api.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface MorespecialRestDao {
    public Map<String, Object> getMorespecial(Map<String,Object> par);

    public Map<String, Object> getSpecial(String id);
}
