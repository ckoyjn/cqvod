package com.guanglumedia.cms.movie.action;
import java.io.UnsupportedEncodingException;

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
import com.guanglumedia.cms.movie.entity.PreView;
import com.guanglumedia.cms.movie.service.PreviewService;

@Controller
@RequestMapping(value="/cms/preview")
public class PreviewAction extends BaseAction{
	@Autowired
	private PreviewService preViewservice;
	
	
	@RequestMapping(value="findpreviewlist")
	public String FindPreViewList(PreView preView,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		PagedModelList<PreView> pagedModelList = this.preViewservice.findAllPreViewList(preView,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pagedModelList);
		model.addAttribute("PreView", preView);
		return "preview/ListPreview";
	}
	
	@RequestMapping(value="tomodifypreview")
	public String ToModifyPreView(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		if(id>0){
			PreView movie=preViewservice.getPreViewById(id);
			model.addAttribute("PreviewInfo",movie);
		}
		
		model.addAttribute("Edit", edit);
		model.addAttribute("PreviewID",id);
		return "preview/ModifyPreview";
	}
		
	@RequestMapping(value="modifypreview")
	@ResponseBody
	public Feedback ModifyPreView(PreView preview,HttpServletRequest request, Model model){
		int result=-1;
		String message="更新失败";
		try{
			if(preViewservice.findRank(preview.getRank(),preview.getId())<=0){
				result=this.preViewservice.UpdatePreView(preview);
			}else{
				message="排序的序号不能相同";
			}
			System.out.println(preview.getRank());
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
	
	@RequestMapping(value="addpreview")
	@ResponseBody
	public Feedback AddPreView(PreView preview,HttpServletRequest request, Model model){
		int result=-1;
		String message="添加失败";
		try{		
			if(preViewservice.findRank(preview.getRank(),preview.getId())<=0){
				if(preViewservice.checkMediaID(preview.getMediaID(),preview.getId())<=0){
					result=this.preViewservice.AddPreView(preview);
				}else{
					message="内部ID不能重复";
				}
			}else{
				message="排序的序号不能相同";
			}
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
	
	@RequestMapping(value="delpreview")
	@ResponseBody
	public Feedback DelPreView(@RequestParam("id")int id,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try{		
			result=this.preViewservice.DelPreView(id);
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
	
}
