package com.guanglumedia.cms.admin.action;

import java.io.UnsupportedEncodingException;
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

import com.guanglumedia.cms.admin.entity.Group;
import com.guanglumedia.cms.admin.entity.User;
import com.guanglumedia.cms.admin.service.GroupService;
import com.guanglumedia.cms.admin.service.UserService;
import com.guanglumedia.cms.annotation.AuthEnum;
import com.guanglumedia.cms.annotation.AuthPassport;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.common.listener.District;
import com.guanglumedia.common.listener.DistrictCache;
import com.guanglumedia.common.util.StringUtils;

@Controller
@RequestMapping(value="/cms/user")
public class UserAction extends BaseAction{
	@Autowired
	private UserService userservice;
	@Autowired
    private GroupService groupservice;
	
	@RequestMapping(value="finduserlist")
	@AuthPassport(AuthEnum.AdminAuth)
	public String FindUserList(User user,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		PagedModelList<User> pagedModelList = this.userservice.findAllUserList(user,getPageNo(request),getPageRow(request));
		model.addAttribute("pagedModelList", pagedModelList);
		model.addAttribute("users", user);
		return "user/ListUser";
	}
	
	
	@RequestMapping(value="tomodifyuser")
	@AuthPassport(AuthEnum.AdminAuth)
	public String ToModifyUser(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		if(id>0){
			User user=userservice.getUserById(id);
			model.addAttribute("UserInfo",user);
			bindCitysAllToModel(model, user.getCity());
		}else{
			bindCitysToModel(model, "0755");
		}
		model.addAttribute("Edit", edit);
		model.addAttribute("UserId",id);
		model.addAttribute("groups",groupservice.findAllGroup());
		return "user/ModifyUser";
	}
	
	@RequestMapping(value={"checkloginname"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
	public void CheckLoginName(@Param("loginName")String loginName,@Param("id")String id,HttpServletRequest request, HttpServletResponse response){
	    int result = this.userservice.HasLoginName(loginName,id);
		writeAjaxResult(response, result>0?"false":"true");
	}
	
	@RequestMapping(value="modifyuser")
	@AuthPassport(AuthEnum.AdminAuth)
	@ResponseBody
	public Feedback ModifyUser(User user,HttpServletRequest request, Model model){
		int result=-1;
		String message="更新失败";
		try{
			if(userservice.HasLoginName(user.getLoginName(),(String)user.getID()==null?0+"":user.getID())>=1){
				message="登录账号已经存在";
			}else{
				result=this.userservice.UpdateUser(user);
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
	
	@RequestMapping(value="adduser")
	@AuthPassport(AuthEnum.AdminAuth)
	@ResponseBody
	public Feedback AddUser(User user,HttpServletRequest request, Model model){
		int result=-1;
		String message="添加失败";
		try{		
			if(userservice.HasLoginName(user.getLoginName(),(String)user.getID()==null?0+"":user.getID())>=1){
				message="登录账号不能重复";
			}else{
				result=this.userservice.AddUser(user);
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
	
	@RequestMapping(value="deluser")
	@AuthPassport(AuthEnum.AdminAuth)
	@ResponseBody
	public Feedback DelUser(@RequestParam("id")int id,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try{		
			result=this.userservice.DelUser(id);
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
	
	@RequestMapping({"changeCity"})
	@ResponseBody
	public List<District> changeCity(HttpServletRequest request){
		String proId = request.getParameter("proId");
		return DistrictCache.getCitys(StringUtils.isEmpty(proId) ? 0 : Integer.valueOf(proId).intValue());
	}
}
