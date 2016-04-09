package com.guanglumedia.cms.movie.action;

import java.util.List;
import java.util.Map;

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
import com.guanglumedia.cms.movie.entity.Associate;
import com.guanglumedia.cms.movie.entity.Movie;
import com.guanglumedia.cms.movie.entity.PreView;
import com.guanglumedia.cms.movie.service.AssociateService;

@Controller
@RequestMapping(value="/cms/associate")
public class AssociateAction extends BaseAction{
	
	@Autowired
	public AssociateService associateService;
	
	@RequestMapping(value="findassociatelist")
	public String FindAssociateList(Associate associate,HttpServletRequest request,Model model){
		PagedModelList<Associate> pml = associateService.findAllAssociateList(associate,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pml);
		model.addAttribute("associate", associate);
		return "associate/ListAssociate";
	}
	
	@RequestMapping(value="tomodifyassociate")
	public String ToModifyAssociate(@RequestParam("movieid")int movieid,@RequestParam("previewid")int previewid,@RequestParam("Edit")String Edit,HttpServletRequest request,Model model){
		if(movieid > 0 && previewid > 0){
			Associate associate = associateService.getAssociateById(movieid,previewid);
			model.addAttribute("AssociateInfo", associate);
		}
		List<Movie> movies=associateService.findAllMovieList();
		List<PreView>previews=associateService.findAllPreViewList();
		model.addAttribute("movies", movies);
		model.addAttribute("previews", previews);
		model.addAttribute("Edit", Edit);
		model.addAttribute("movieid", movieid);
		model.addAttribute("previewid", previewid);
		return "associate/ModifyAssociate";
	}
	
	
	@RequestMapping(value="addassociate")
	@ResponseBody
	public Feedback AddAssociate(Associate associate,HttpServletRequest request,Model model){
		int result = -1;
		String message = "添加失败";
		try {
			result = associateService.addAssociate(associate);
		} catch (Exception e) {
			e.printStackTrace();
			message = e.getMessage();
		}
		if(result > 0){
			return Feedback.success("添加成功");
		}else{
			return Feedback.fail(message);
		}
	}
	
	@RequestMapping(value="modifyassociate")
	@ResponseBody
	public Feedback ModifyAssociate(@RequestParam Map<String,Object> map,HttpServletRequest request,Model model){
		int result = -1;
		String message = "添加失败";
		try {
			result = associateService.updateAssociate(map);
		} catch (Exception e) {
			e.printStackTrace();
			message = e.getMessage();
		}
		if(result > 0){
			return Feedback.success("添加成功");
		}else{
			return Feedback.fail(message);
		}
	}
	
	@RequestMapping(value="delassociate")
	@ResponseBody
	public Feedback DelAssociate(@RequestParam Map<String,Object> map, HttpServletRequest request, Model model){
		int result = -1;
		String message = "删除失败";
		try {
			result = associateService.delAssociate(map);
		} catch (Exception e) {
			e.printStackTrace();
			message = e.getMessage();
		}
		if(result > 0){
			return Feedback.success("删除成功");
		}else{
			return Feedback.fail(message);
		}
	}
}
