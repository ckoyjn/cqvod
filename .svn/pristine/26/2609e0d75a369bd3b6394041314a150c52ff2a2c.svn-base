package com.guanglumedia.cms.admin.action;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.admin.entity.Right;
import com.guanglumedia.cms.admin.service.RightService;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;

@Controller
@RequestMapping(value="/cms/right")
public class RightAction extends BaseAction{
	@Autowired
	private RightService rightservice;
	
	@RequestMapping(value="findrightlist")
	public String FindRightList(Right right,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		PagedModelList<Right> pagedModelList = this.rightservice.findAllRightList(right,getPageNo(request),getPageRow(request));
		model.addAttribute("rights",right);
		model.addAttribute("pagedModelList", pagedModelList);
		return "right/ListRight";
	}
	
	@RequestMapping(value="tomodifyright")
	public String ToModifyRight(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		if(id>0){
			Right right=rightservice.getRightById(id);
			model.addAttribute("RightInfo",right);
		}
		model.addAttribute("Edit", edit);
		model.addAttribute("RightID",id);
		return "right/ModifyRight";
	}
		
	@RequestMapping(value="modifyright")
	@ResponseBody
	public Feedback ModifyRight(Right right,HttpServletRequest request, Model model){
		int result=-1;
		String message="更新失败";
		try{
			if(rightservice.hasRightName(right.getRightName(),right.getId())<=0){
				result=this.rightservice.UpdateRight(right);
			}else {
				message="权限名称不能重复";
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
	
	@RequestMapping(value="addright")
	@ResponseBody
	public Feedback AddRight(Right right,HttpServletRequest request, Model model){
		int result=-1;
		String message="添加失败";
		try{	
			if(rightservice.hasRightName(right.getRightName(),right.getId())<=0){
				result=this.rightservice.AddRight(right);
			}else {
				message="权限名称不能重复";
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
	
	@RequestMapping(value="delright")
	@ResponseBody
	public Feedback DelRight(@RequestParam("id")int id,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try{		
			if(this.rightservice.findAllRightByRoleId(id)!=null){
				message="该权限已被使用！请先取消用户的该权限，再进行删除！";
				return Feedback.fail(message);
			}
			result=this.rightservice.DelRight(id);
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
