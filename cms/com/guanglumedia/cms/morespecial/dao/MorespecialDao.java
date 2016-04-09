package com.guanglumedia.cms.morespecial.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;
import com.guanglumedia.cms.morespecial.entity.Morespecial;

/**
 * 更多专题接口
 * @author caokai
 */
@Repository
public abstract interface MorespecialDao {
	public abstract int                findCount(Morespecial morespecial);
	public abstract Morespecial        getMorespecialById(@Param("id")int id);
	public abstract int                updateMorespecial(Morespecial morespecial);
	public abstract int                addMorespecial(Morespecial morespecial);
	public abstract int                delMorespecial(@Param("id")int id);
	public abstract List<Morespecial>  findAllMorespecial();
	List<Morespecial> getMorespecialList(RowBounds rowBounds,Map<String,Object> map);
	int findCount(Map<String,Object> map);
}
