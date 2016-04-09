package com.guanglumedia.cms.actsrecommend.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.actsrecommend.entity.Actsrecommend;
import com.guanglumedia.cms.special.entity.Special;

/**
 * 活动推荐接口
 * @author caokai
 */
@Repository
public abstract interface ActsrecommendDao {

	public abstract Actsrecommend       getActsrecommendById(@Param("id")int id);
	public abstract int                 updateActsrecommend(Actsrecommend actsrecommend);
	public abstract int                 addActsrecommend(Actsrecommend actsrecommend);
	public abstract int                 delActsrecommend(@Param("id")int id);
	public abstract List<Actsrecommend> findAllActsrecommend();
	
	 List<Actsrecommend> findActsrecommendList(RowBounds rowBounds,Map<String,Object> map);
	 int findCount(Map<String,Object> map);
}
