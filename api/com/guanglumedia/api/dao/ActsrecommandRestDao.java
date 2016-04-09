package com.guanglumedia.api.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface ActsrecommandRestDao {
    
	public int findCount();

    public List<Map<String, Object>> getAllActsrecommand();
}
