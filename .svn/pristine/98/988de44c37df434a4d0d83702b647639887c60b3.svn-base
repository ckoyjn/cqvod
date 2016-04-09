package com.guanglumedia.api.dao;

import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Repository;

import com.guanglumedia.api.entity.EpgEvcn;

@Repository
public interface OrderRestDao {
    public int addOrder(JSONObject object);
    
    public int addOrderOuter(Map<String, Object> map);

	public EpgEvcn getEvcn(String evcnid);

	public int updateEvcn(Map<String, Object> map);
	
	public int addBossLog(Map<String,Object> map);

	public int addPlayRecord(Map<String, Object> map);
	
	int getProgrameId(String mediaid);
	int getPreviewId(String mediaid);
	
	int addwatchrecord(Map<String, Object> map);
}
