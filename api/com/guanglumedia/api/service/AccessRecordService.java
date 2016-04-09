package com.guanglumedia.api.service;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.api.dao.AccessRecordRestDao;

@Service
public class AccessRecordService {
	 @Autowired
	 private AccessRecordRestDao dao;

	public boolean add(JSONObject jsonObject) {
		return dao.add(jsonObject)>0;
	}
}
