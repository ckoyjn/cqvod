package com.guanglumedia.cms.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.movie.entity.Publish;
@Repository
public abstract interface PublishDao {

	public abstract List<Publish> findPublishList(Publish publish, RowBounds rowBounds);

	public abstract int findCount(Publish publish);

	public abstract Publish getPublishById(@Param("id")int id);

	public abstract int delPublishByMovieId(@Param("id")int id);

	
}
