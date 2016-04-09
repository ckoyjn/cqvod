package com.guanglumedia.cms.pagerecommend.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;
import com.guanglumedia.cms.pagerecommend.entity.Pagerecommend;
import com.guanglumedia.cms.special.entity.Special;
/**
 * 首页广告推荐接口类
 * @author caokai
 */
@Repository
public abstract interface PagerecommendDao {
	List<Pagerecommend> findPagerecommendList(RowBounds rowBounds,Map<String,Object> map);
	int findCount(Map<String,Object> map);
	public abstract Pagerecommend       getPagerecommendById(@Param("id")int id);
	public abstract int                 updatePagerecommend(Pagerecommend pagerecommend);
	public abstract int                 addPagerecommend(Pagerecommend pagerecommend);
	public abstract int                 delPagerecommend(@Param("id")int id);
}
