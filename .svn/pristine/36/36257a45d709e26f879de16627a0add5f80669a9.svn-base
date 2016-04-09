package com.guanglumedia.cms.extbooth.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.extbooth.entity.Extbooth;
import com.guanglumedia.cms.morespecial.entity.Morespecial;
import com.guanglumedia.cms.special.entity.Special;

/**
 * 专题扩展接口
 * @author caokai
 */
@Repository
public abstract interface ExtboothDao {
//	public abstract List<Extbooth>     findExtboothList(Extbooth extbooth, RowBounds rowBounds);
	public abstract Extbooth           getExtboothById(@Param("id")int id);
	public abstract int                updateExtbooth(Extbooth extbooth);
	public abstract int                addExtbooth(Extbooth extbooth);
	public abstract int                delExtbooth(@Param("id")int id);
	public abstract List<Extbooth> 	   findAllExtbooth();
	
	/**
	 * 查询扩展专题列表
	 * @param rowBounds
	 * @param map 请求参数集合对象
	 * @return List<Extbooth> 返回扩展专题列表类型的对象
	 */
    List<Extbooth> findExtboothList(RowBounds rowBounds,Map<String,Object> map);
    
    /**
     * 查询扩展专题列表的总记录
     * @param map 请求参数的集合对象
     * @return int 整数型
     */
    int findCount(Map<String,Object> map);
    
    
}
