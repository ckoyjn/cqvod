package com.guanglumedia.api.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.ActsrecommandRestDao;

@Service
public class ActsrecommandRestService {
    @Autowired
    private ActsrecommandRestDao dao;
    @Transactional
    public Map<String,Object> getAllActsrecommand() 
    {
        Map<String,Object> result=new HashMap<String, Object>();
        List<Map<String,Object>> list=dao.getAllActsrecommand();
    	return result;
    }
    public int findCount() 
    {
        return dao.findCount();
    }

}
