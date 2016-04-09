package com.guanglumedia.cms.analysis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.analysis.entity.AccessCategory;
@Repository
public abstract interface AnalysisDao {

	public abstract List<AccessCategory> findAllAccessCategoryList(AccessCategory accesscategory);

	public abstract List<AccessCategory> findAccessDate(AccessCategory accesscategory, RowBounds rowBounds);

	public abstract int findCount(AccessCategory accesscategory);

	public abstract List<AccessCategory> getRegGraphData(AccessCategory accesscategory);

	public abstract List<AccessCategory> getRegGraphDataDist(AccessCategory accesscategory);

    public abstract List<Map<String, Object>> exportAccessCategoryList(AccessCategory accesscategory);

	/**
	 * 新增用户量
	 * @param accesscategory 时间区间
	 */
	public abstract AccessCategory findNewUserAccessCategory(AccessCategory accesscategory);

	/**
	 * 累计用户量
	 */
	public abstract AccessCategory findAllUserAccessCategory(AccessCategory accesscategory);

	
	/**
	 * 使用用户量
	 * @param accesscategory 时间区间
	 */
	public abstract AccessCategory findUseUserAccessCategory(AccessCategory accesscategory);

	/**
	 * 点播用户量
	 * @param accesscategory 时间区间
	 */
	public abstract AccessCategory findDemandUserAccessCategory(AccessCategory accesscategory);

	
}
