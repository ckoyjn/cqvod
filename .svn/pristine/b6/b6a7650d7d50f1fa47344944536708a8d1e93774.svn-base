package com.guanglumedia.cms.movie.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.movie.entity.Associate;
import com.guanglumedia.cms.movie.entity.Movie;
import com.guanglumedia.cms.movie.entity.PreView;

@Repository
public interface AssociateDao {

	public List<Associate> findAssociateList(Associate associate, RowBounds rowBounds);

	public int findCount(Associate associate);

	public Associate getAssociateById(@Param("movieid")int movieid, @Param("previewid")int previewid);

	public List<Movie> findAllMovieList();

	public List<PreView> findAllPreViewList();

	public int addAssociate(Associate associate);

	public int updateAssociate(Map<String, Object> map);

	public int delAssociate(Map<String, Object> map);
	

}
