package com.guanglumedia.api.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.CategoryRestDao;
import com.guanglumedia.api.dao.MovieRestDao;

@Service
public class MovieRestService {
    @Autowired
    private MovieRestDao dao;
    
    @Autowired
    private CategoryRestDao categoryRestDao;
    
    @Transactional
    public JSONObject getMovieDetail(JSONObject object)
    {
    	
    	JSONObject obj = dao.getMovieDetail(object);
    	/*用户鉴权*/
    	if(auth(object)){
    		obj.put("isAuthed", 1);
    	}else{
    		obj.put("isAuthed", 0);
    	}
    	return obj;
    }
    
    public boolean auth(JSONObject obj){
    	return dao.getAuth(obj)>0;
    }

	public List<Map<String, Object>> getPreviews() throws UnsupportedEncodingException {
		return dao.getPreviews();
	}
    
    
    @Transactional
	public List<Map<String,Object>> getRandomMovieByCategoryId(JSONObject jsonObject,int num) {
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		//同类型的影片集合
		List<Map<String,Object>> mlist=categoryRestDao.getRandomMovieByCategoryId(jsonObject);
		int size=num;
		if(num>mlist.size()){
			size=mlist.size();
		}
		for (int i = 0; i < size; i++) {
			list.add(mlist.get(i));
		}
		return list;
	}
}
