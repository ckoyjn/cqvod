package com.guanglumedia.cms.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.movie.entity.PreView;
@Repository
public abstract interface PreviewDao {

	public abstract List<PreView> findPreViewList(PreView preview, RowBounds rowBounds);

	public abstract int findCount(PreView preview);

	public abstract PreView getPreViewById(@Param("id")int id);

	public abstract int updatePreView(PreView preView);

	public abstract int addPreView(PreView preView);

	public abstract int delPreView(@Param("id")int id);

	public abstract List<PreView> findAllPreView();

	public abstract int findRank(@Param("rank")String rank, @Param("id")String id);

	public abstract int checkMediaID(@Param("mediaID")String mediaID,@Param("id")String id);

	
}
