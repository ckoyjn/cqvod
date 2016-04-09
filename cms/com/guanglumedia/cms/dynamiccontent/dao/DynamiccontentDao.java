package com.guanglumedia.cms.dynamiccontent.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;
import com.guanglumedia.cms.dynamiccontent.entity.Dynamiccontent;

public interface DynamiccontentDao {
	public abstract List<Dynamiccontent> findDynamiccontentList(Dynamiccontent dynamiccontent, RowBounds rowBounds);
	public abstract int                  findCount(Dynamiccontent dynamiccontent);
	public abstract Dynamiccontent       getDynamiccontentById(@Param("id")int id);
	public abstract int                  updateDynamiccontent(Dynamiccontent dynamiccontent);
	public abstract int                  addDynamiccontent(Dynamiccontent dynamiccontent);
	public abstract int                  delDynamiccontent(@Param("id")int id);
}