package com.guanglumedia.api.dao;

import java.util.List;

import net.sf.json.JSONObject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.api.entity.Favorite;


@Repository
public interface FavoriteDao {
    public int addFavorite(JSONObject jsonObject);
    
    public int getFavoriteByIdPid(JSONObject jsonObject);
    
    public int delFavoriteByIdPid(JSONObject jsonObject);
    
    public List<Favorite> getFavorite(JSONObject jsonObject, RowBounds rowBounds);

	public int findCount(JSONObject jsonObject);
}
