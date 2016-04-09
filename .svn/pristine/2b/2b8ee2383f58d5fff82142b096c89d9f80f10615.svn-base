package com.guanglumedia.cms.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.movie.entity.Inject;
import com.guanglumedia.cms.movie.entity.Product;
@Repository
public abstract interface InjectDao {

	public abstract List<Inject> findInjectList(Inject inject, RowBounds rowBounds);

	public abstract int findCount(Inject inject);

	public abstract Inject getInjectById(@Param("id")int id);

	public abstract int updateInject(Inject inject);

	public abstract int addInject(Inject inject);

	public abstract int delInject(@Param("id")int id);

	public abstract int DelInjectByMovieId(@Param("id")int movieId);

	public abstract int getInjectByMovieId(@Param("videoid")int movieId);
	
}
