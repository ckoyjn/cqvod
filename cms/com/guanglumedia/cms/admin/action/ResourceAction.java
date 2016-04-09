package com.guanglumedia.cms.admin.action;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.admin.entity.Resource;
import com.guanglumedia.cms.admin.service.ResourceService;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;

@Controller
@RequestMapping(value="/cms/resource")
public class ResourceAction extends BaseAction{
	@Autowired
	private ResourceService  resourceservice;
	
	@RequestMapping(value="findresourcelist")
	public String FindResourceList(Resource resource,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		PagedModelList<Resource> pagedModelList = this.resourceservice.findAllResourceList(resource,getPageNo(request),getPageRow(request));
		model.addAttribute("resources", resource);
		model.addAttribute("pagedModelList", pagedModelList);
		return "resource/ListResource";
	}
	
	@RequestMapping(value="tomodifyresource")
	public String ToModifyResource(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		if(id>0){
			Resource resource=resourceservice.getResourceById(id);
			model.addAttribute("ResourceInfo",resource);
		}
		model.addAttribute("parents", resourceservice.getAllParents());
		model.addAttribute("Edit", edit);
		model.addAttribute("ResourceID",id);
		return "resource/ModifyResource";
	}
		
	@RequestMapping(value="modifyresource")
	@ResponseBody
	public Feedback ModifyResource(Resource resource,HttpServletRequest request, Model model){
		int result=-1;
		String message="更新失败";
		try{
			if(resourceservice.hasResourceName(resource.getResourcename(),resource.getResourceId())<=0){
				result=this.resourceservice.UpdateResource(resource);
			}else {
				message="资源名称不能重复";
			}
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
	
	@RequestMapping(value="addresource")
	@ResponseBody
	public Feedback AddResource(Resource resource,HttpServletRequest request, Model model){
		int result=-1;
		String message="添加失败";
		try{
			if(resourceservice.hasResourceName(resource.getResourcename(),resource.getResourceId())<=0){
				result=this.resourceservice.AddResource(resource);
			}else {
				message="资源名称不能重复";
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
	
	@RequestMapping(value="delresource")
	@ResponseBody
	public Feedback DelResource(@RequestParam("id")int id,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try{		
			result=this.resourceservice.DelResource(id);
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
