package com.guanglumedia.api.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import net.sf.json.JSONObject;

public interface WatchRestDao {

	public int addWatchRecord(JSONObject jsonObject);

	public List<Map<String, Object>> getwatchRecordByUserId(String smartcardid,
			RowBounds rowBounds);

	public int findCount(String smartcardid);

	
}
