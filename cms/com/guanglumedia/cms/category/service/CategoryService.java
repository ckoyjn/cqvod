package com.guanglumedia.cms.category.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.category.dao.CategoryDao;
import com.guanglumedia.cms.category.entity.Category;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.entity.Movie;

@Service
public class CategoryService {
    @Autowired
    private CategoryDao categoryDao;
    /**
     * 新增分类
     * @param cate
     */
    public int insertCategory(Category category){
        return categoryDao.insertCategory(category);
    }
    /**
     * 删除分类
     * @param ids
     * @return
     */
    public int deleteCategoryByIds(int [] ids){
        return categoryDao.deleteCategoryByIds(ids);
    }
    /**
     * 更新分类
     * @param cate
     * @return
     */
    public int updateCategory(Category category){
        return categoryDao.updateCategory(category);
    }
    /**
     * 根据分类id获取分类信息
     * @param id
     * @return
     */
    public Category getCategoryById(int id){
        return categoryDao.getCategoryById(id);
    }
    /**
     * 分页获取分类列表
     * @param pageNo 当前页
     * @param pageRow 每页显示记录数
     * @return
     */
    public PagedModelList<Category> getCategoryList(int pageNo,int pageRow){
        List<Category> cateList = categoryDao.getCategoryList(new RowBounds((pageNo-1)*pageRow, pageRow));
        int count = categoryDao.getCategoryCount();
        PagedModelList<Category> page = new PagedModelList<Category>(pageNo, pageRow, count);
        page.addModels(cateList);
        return page;
    }
    /**
     * 根据分类id获取分类下影片的
     * @param id
     * @return
     */
    public List<Movie> getMoviesByCategoryId(int id){
        return categoryDao.getMoviesByCategoryId(id);
    }
    /**
     * 获取上线的节目列表且不包含当前分类中已经有的节目
     * @param id
     * @param pageNo
     * @param pageRow
     * @return
     */
    public PagedModelList<Movie> getOnlineMoviesByCategoryId(int id,int pageNo,int pageRow){
        List<Movie> movieList = categoryDao.getOnlineMoviesByCategoryId(id, new RowBounds((pageNo-1)*pageRow, pageRow) );
        int count = categoryDao.getMovieCountByCategoryId(id);
        PagedModelList<Movie> page = new PagedModelList<Movie>(pageNo, pageRow, count);
        page.addModels(movieList);
        return page;
    }
    /**
     * 添加分类影片
     * @param categoryId
     * @param movieIds
     * @return
     */
    public int insertCategoryMovie(int categoryId,int [] movieIds) {
        return categoryDao.insertCategoryMovie(categoryId, movieIds);
    }
    /**
     * 根据分类id和影片id删除分类影片
     * @param specialid
     * @param movieids
     * @return
     */
    public int delCategoryMovieById(int categoryId,int [] movieIds) {
        return categoryDao.delCategoryMovieById(categoryId, movieIds);
    }
    
	public int HasOrderby(String orderby) {
		return categoryDao.hasOrderby(orderby);
	}
	
	public boolean getCountGroupByCategoryId(){
	    List<Integer> list = categoryDao.getCountGroupByCategoryId();
	    if(list != null && list.size() > 0){
	        for(int i=0;i<list.size();i++){
	            int count = list.get(i);
	            if(count > 1){
	                return true;
	            }
	        }
	    }
	    return false;
	}
}
