package com.guanglumedia.cms.category.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.category.entity.Category;
import com.guanglumedia.cms.category.service.CategoryService;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.entity.Movie;

@Controller
@RequestMapping("/cms/category")
public class CategoryAction extends BaseAction{
    @Autowired
    private CategoryService categoryService;
    
    @RequestMapping(value="categorylist")
    public String getCategoryList(HttpServletRequest request, Model model){
        PagedModelList<Category> pml = categoryService.getCategoryList(this.getPageNo(request), this.getPageRow(request));
        model.addAttribute("pml", pml);
        return "category/categorylist";
    }
    
    @RequestMapping(value="tomodifycategory")
    public String toModifyCategory(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
        if(id>0) {
            Category category = categoryService.getCategoryById(id);
            model.addAttribute("category", category);
        }
        model.addAttribute("Edit", edit);
        model.addAttribute("categoryid",id);
        return "category/categorymodify";
    }
    
    @RequestMapping(value="categorymovielist")
    public String getMoviesByCategoryId(@RequestParam("id")int id, HttpServletRequest request, Model model) {
        List<Movie> list = this.categoryService.getMoviesByCategoryId(id);
        model.addAttribute("list", list);
        model.addAttribute("categoryid", id);
        return "category/categorymovielist";
    }
    
    @RequestMapping(value="categorymoviemodify")
    public String getOnlineMoviesByCategoryId(@RequestParam("id")int id,HttpServletRequest request, Model model){
        PagedModelList<Movie> pml = categoryService.getOnlineMoviesByCategoryId(id,this.getPageNo(request), this.getPageRow(request));
        model.addAttribute("pml", pml);
        model.addAttribute("categoryid", id);
        return "category/categorymoviemodify";
    }
    
    @RequestMapping(value="addcategory")
    @ResponseBody
    public Feedback insertCategory(Category category,HttpServletRequest request, Model model){
        int result=-1;
        String message="添加失败";
        try{
            result=this.categoryService.insertCategory(category);
        }catch (Exception e){
            e.printStackTrace();
            message=e.getMessage();
        }
        if(result>0){
            return Feedback.success("添加成功");
        }else{
            return Feedback.fail(message);
        }
    }
    
    @RequestMapping(value="addmovie")
    @ResponseBody
    public Feedback addMovies(@RequestParam("categoryid")int categoryid,@RequestParam("movieid")int [] movieid,HttpServletRequest request, Model model){
        int result=-1;
        String message="添加失败";
        try{
            result=this.categoryService.insertCategoryMovie(categoryid, movieid);
        }catch (Exception e){
            e.printStackTrace();
            message=e.getMessage();
        }
        if(result>0){
            return Feedback.success("添加成功");
        }else{
            return Feedback.fail(message);
        }
    }
    
    @RequestMapping(value="delcategory")
    @ResponseBody
    public Feedback DelCategory(@RequestParam("id")int[] ids,HttpServletRequest request, Model model){
        int result=-1;
        String message="删除失败";
        try{
            result=this.categoryService.deleteCategoryByIds(ids);
        }catch (Exception e){
            e.printStackTrace();
            message=e.getMessage();
        }
        if(result>0){
            return Feedback.success("删除成功");
        }else{
            return Feedback.fail(message);
        }
    }
    
    @RequestMapping(value="delcategorymovie")
    @ResponseBody
    public Feedback delCategoryMovie(@RequestParam("id")int id,int [] movieid,HttpServletRequest request, Model model){
        int result=-1;
        String message="删除失败";
        try{
            result=this.categoryService.delCategoryMovieById(id,movieid);
        }catch (Exception e){
            e.printStackTrace();
            message=e.getMessage();
        }
        if(result>0){
            return Feedback.success("删除成功");
        }else{
            return Feedback.fail(message);
        }
    }
    
    @RequestMapping(value="modifycategory")
    @ResponseBody
    public Feedback ModifyMovie(Category category,HttpServletRequest request, Model model){
        int result=-1;
        String message="更新失败";
        try{
            result=this.categoryService.updateCategory(category);
        }catch (Exception e){
            e.printStackTrace();
            message=e.getMessage();
        }
        if(result>0){
            return Feedback.success("更新成功");
        }else{
            return Feedback.fail(message);
        }
    }
    
	@RequestMapping(value={"updateCheckOrderby"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
	public void updateCheckOrderby(@Param("orderby")String orderby,HttpServletRequest request, HttpServletResponse response){
	    int result = this.categoryService.HasOrderby(orderby);
		writeAjaxResult(response, result>0?"false":"true");
	}
	@RequestMapping(value={"checkOrderby"})
	@ResponseBody
	public boolean CheckOrderby(@Param("orderby")String orderby,HttpServletRequest request, HttpServletResponse response){
		int result = this.categoryService.HasOrderby(orderby);
		return !(result>0);
	}
}
