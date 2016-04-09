package com.guanglumedia.api.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.ExtboothRestDao;

@Service
public class ExtboothRestService {
    @Autowired
    private ExtboothRestDao dao;
    @Transactional
    public List<Map<String,Object>> getAllExtbooth() 
    {
    	return dao.getAllExtbooth();
    }
    public int findCount() 
    {
        return dao.findCount();
    }

}
