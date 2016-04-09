package com.guanglumedia.api.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import net.sf.json.JSONObject;

@Repository
public interface UserRestDao {

	public int addScore(JSONObject jsonObject);

	public List<Map<String, Object>> selectUserOrder(JSONObject jsonObject, RowBounds rowBounds);

	public int findUserOrderCount(JSONObject jsonObject);

	public int addPraise(JSONObject jsonObject);
}
