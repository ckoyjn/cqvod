package com.guanglumedia.api.dao;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRestDao {
    public List<Map<String, Object>> getAllCategory();
    
    public List<Map<String,Object>> getCategoryMovie(int categoryid, RowBounds rowBounds);

    public List<Map<String,Object>> getRandomMovieByCategoryId(JSONObject jsonObject);
    
	public int findCount(int categoryid);

    public List<Map<String, Object>> getHotMovie(RowBounds rowBounds);

    public int findHotMovieCount();
}
