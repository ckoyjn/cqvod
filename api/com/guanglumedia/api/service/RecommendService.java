package com.guanglumedia.api.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.RecommendDao;
import com.guanglumedia.api.entity.CmsSpecial;

@Service
public class RecommendService {
	
	@Autowired
	private RecommendDao recommendDao;

	@Transactional
	public List<Map<String,Object>> findRecommend() {
		return recommendDao.findRecommend();
	}

	public CmsSpecial findRecommendSubject() {
		return recommendDao.findRecommendSubject();
	}

	public List<Map<String,Object>> findActivity() {
		return recommendDao.findActivity();
	}
	
}
