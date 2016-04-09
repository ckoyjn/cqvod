package com.guanglumedia.cms.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.admin.entity.Resource;
@Repository
public abstract interface ResourceDao {
	public abstract List<Resource> findAllResourceList();
	
	public abstract List<Resource> findResourcesByGroupID(@Param("groupid")String id);
	

	public abstract List<Resource> findResourceList(Resource resource,RowBounds rowBounds);

	public abstract int findCount();

	public abstract Resource getResourceById(@Param("id")int id);

	public abstract int updateResource(Resource resource);

	public abstract int addResource(Resource resource);

	public abstract int delResource(@Param("id")int id);

	public abstract List<Resource> findAllResource(@Param("id")int id);

	public abstract List<Resource> getAllParents();
	
	public abstract int hasResourceName(@Param("resourcename")String resourceName, @Param("id")String id);
}
