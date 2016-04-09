package com.guanglumedia.cms.movie.action;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.entity.Inject;
import com.guanglumedia.cms.movie.entity.Movie;
import com.guanglumedia.cms.movie.entity.PreView;
import com.guanglumedia.cms.movie.service.InjectService;
import com.guanglumedia.cms.movie.service.MovieService;
import com.guanglumedia.cms.movie.service.PreviewService;

@Controller
@RequestMapping(value="/cms/inject")
public class InjectAction extends BaseAction{
	@Autowired
	private InjectService injectservice;
	@Autowired
	private MovieService movieservice;
	@Autowired
	private PreviewService previewservice;
	
	@RequestMapping(value="findinjectlist")
	public String FindinjectList(Inject inject,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		PagedModelList<Inject> pagedModelList = this.injectservice.findAllInjectList(inject,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pagedModelList);
		model.addAttribute("Inject", inject);
		return "inject/ListInject";
	}
	
	@RequestMapping(value="tomodifyinject")
	public String ToModifyInject(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		if(id>0){
			Inject inject=injectservice.getInjectById(id);
			model.addAttribute("InjectInfo",inject);
		}
		List<Movie> movies=movieservice.findAllMovieList();
		List<PreView>previews=previewservice.findAllPreViewList();
		model.addAttribute("movies", movies);
		model.addAttribute("previews", previews);
		model.addAttribute("Edit", edit);
		model.addAttribute("InjectID",id);
		return "inject/ModifyInject";
	}
		
	@RequestMapping(value="modifyinject")
	@ResponseBody
	public Feedback ModifyInject(@RequestParam("id")int id,HttpServletRequest request, Model model){
//	public Feedback ModifyInject(Inject inject,HttpServletRequest request, Model model){
//		int result=-1;
//		String message="更新失败";
//		try{
//			if("1".equals(inject.getVideotype())){
//				inject.setVideoid(inject.getMovieid());
//			}else{
//				inject.setVideoid(inject.getPreviewid());
//			}
//			result=this.injectservice.ModifyInject(inject);
////			result=this.injectservice.UpdateInject(inject);
//		}catch (Exception e){
//			e.printStackTrace();
//			message=e.getMessage();
//		}
//		if(result>0){
//			return Feedback.success("更新成功");
//		}else{
//			return Feedback.fail(message);
//		}
		return this.injectservice.ModifyInject(id);
	}
	
	@RequestMapping(value="addinject")
	@ResponseBody
	public Feedback AddInject(Inject inject,HttpServletRequest request, Model model){
//		int result=-1;
//		String message="添加失败";
//		try{		
//			if("1".equals(inject.getVideotype())){
//				inject.setVideoid(inject.getMovieid());
//			}else {
//				inject.setVideoid(inject.getPreviewid());
//			}
//			message = this.injectservice.AddInject(inject);
//			
//		}catch (Exception e){
//			e.printStackTrace();
//			message=e.getMessage();
//		}
//		if(result>0){
//			return Feedback.success("添加成功");
//		}else if(result==-500){
//			return Feedback.fail("注入资源失败");
//		}else{
//			return Feedback.fail(message);
//		}
		try {
			if("1".equals(inject.getVideotype())){
				inject.setVideoid(inject.getMovieid());
			}else {
				inject.setVideoid(inject.getPreviewid());
			}
			
			return this.injectservice.AddInject(inject);
		} catch (Exception e) {
			e.printStackTrace();
			return Feedback.fail("系统出错");
		}
		
	}
	
	@RequestMapping(value="delinject")
	@ResponseBody
	public Feedback DelInject(@RequestParam("id")int id,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try{
			result=this.injectservice.DelInject(id);
		}catch (Exception e){
			e.printStackTrace();
			message=e.getMessage();
		}
		if(result == 0){
			return Feedback.success("删除成功");
		}else{
			return Feedback.fail(message);
		}
	}
	
	@RequestMapping(value="updateinject")
	@ResponseBody
	public Feedback UpdateInject(@RequestParam("id")int id,HttpServletRequest request, Model model){
		int result=-1;
		String message="修改失败";
		try{
			Inject inject = injectservice.getInjectById(id);
			inject.setStatus("1");
			result=this.injectservice.UpdateInject(inject);
		}catch (Exception e){
			e.printStackTrace();
			message=e.getMessage();
		}
		if(result > 0){
			return Feedback.success("修改成功");
		}else{
			return Feedback.fail(message);
		}
	}
}
