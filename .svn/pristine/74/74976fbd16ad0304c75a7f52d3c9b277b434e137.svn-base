package com.guanglumedia.cms.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.movie.entity.Movie;
@Repository
public abstract interface MovieDao {

	public abstract List<Movie> findMovieList(Movie movie, RowBounds rowBounds);

	public abstract int findCount(Movie movie);

	public abstract Movie getMovieById(@Param("id")int id);

	public abstract int updateMovie(Movie movie);

	public abstract int addMovie(Movie movie);

	public abstract int delMovie(@Param("id")int id);

	public abstract List<Movie> findAllMovie();

    public abstract String findPrice(@Param("vodID")String vodID);

	public abstract int findRank(@Param("rank")String rank, @Param("id")String id);

    public abstract int checkMediaID(@Param("mediaID")String mediaID,@Param("id")String id);

	public abstract int findRecommend(String id);

	public abstract int findOrder(@Param("id")String id, @Param("today")String today);

	public abstract List<String> getExistsIdentifies();

	
}
