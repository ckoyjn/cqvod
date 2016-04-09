package com.guanglumedia.cms.category.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.category.entity.Category;
import com.guanglumedia.cms.movie.entity.Movie;

@Repository
public abstract interface CategoryDao {
    
    /**
     * 新增分类
     * @param category
     */
    int insertCategory(Category category);
    /**
     * 删除分类
     * @param ids
     * @return
     */
    int deleteCategoryByIds(@Param("ids")int [] ids);
    /**
     * 更新分类
     * @param cate
     * @return
     */
    int updateCategory(Category category);
    /**
     * 根据分类id获取分类信息
     * @param id
     * @return
     */
    Category getCategoryById(int id);
    /**
     * 分页查询分类列表
     * @param rowBounds
     * @return
     */
    List<Category> getCategoryList(RowBounds rowBounds);
    int getCategoryCount();
    
    /**
     * 根据分类id获取分类影片
     * @param id
     * @return
     */
    List<Movie> getMoviesByCategoryId(int id);
    
    /**
     * 获取上线的节目列表且不包含当前分类中已经有的节目
     * @param id
     * @return
     */
    List<Movie> getOnlineMoviesByCategoryId(@Param("id")int id,RowBounds rowBounds);
    int getMovieCountByCategoryId(int id);
    /**
     * 添加分类影片
     * @param categoryId
     * @param movieIds
     */
    int insertCategoryMovie(@Param("categoryId")int categoryId,@Param("movieIds")int[] movieIds);
    /**
     * 根据分类id和影片id删除分类影片
     * @param specialid
     * @param movieids
     * @return
     */
    int delCategoryMovieById(@Param("categoryId")int categoryId,@Param("movieIds")int[] movieIds);
    
	int hasOrderby(@Param("orderby")String orderby);
    
	/**
	 * 根据categoryId分组电影数
	 * @return
	 */
	List<Integer>getCountGroupByCategoryId();
}
