package com.guanglumedia.api.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONObject;

import com.guanglumedia.api.dao.SubjectDao;
import com.guanglumedia.api.entity.CmsSpecial;
import com.guanglumedia.cms.movie.dao.MovieDao;
import com.guanglumedia.cms.movie.entity.Movie;

@Service
public class SubjectService {
	
	@Autowired
	private SubjectDao subjectDao;
	@Autowired
	private MovieDao  movieDao;

	@Transactional
	public Map<String, Object> findMovieBySubject(JSONObject jsonObject) {
		Map<String, Object> map=new HashMap<String, Object>();
		//根据Id获取专题对象
		CmsSpecial cmsSpecial=subjectDao.getSubjectById(jsonObject);
		map.put("identify", cmsSpecial.getIdentify());

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		String[] movieId=cmsSpecial.getMovieIDs().split(",");
		for (String string : movieId) {
			if(string!=null){
				//根据id获取movie对象
				Movie movie=movieDao.getMovieById(Integer.parseInt(string));
				Map<String,Object> m = new HashMap<String, Object>();
				m.put("pid", movie.getId());
				m.put("name", movie.getName());
				m.put("identify", movie.getIdentify());
				list.add(m);
			}
		}
		//将专题对象以及专题下的电影保存在map中
		map.put("list", list);
		return map;
	}

	public Map<String, Object> findAllSubject() {
		Map<String, Object> map=new HashMap<String, Object>();
		List<CmsSpecial> list = subjectDao.findAllSubject();
		map.put("list", list);
		return map;
	}
}
