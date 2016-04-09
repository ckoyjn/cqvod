package com.guanglumedia.cms.admin.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.admin.entity.Group;
import com.guanglumedia.cms.admin.entity.Role;
import com.guanglumedia.cms.admin.service.GroupService;
import com.guanglumedia.cms.admin.service.RoleService;
import com.guanglumedia.cms.admin.service.UserService;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;

@Controller
@RequestMapping(value="/cms/group")
public class GroupAction extends BaseAction{
	@Autowired
	private GroupService groupservice;
	
	@Autowired
	private RoleService roleservice;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="findgrouplist")
	public String FindGroupList(Group group,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		PagedModelList<Group> pagedModelList = this.groupservice.findAllGroupList(group,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pagedModelList);
		model.addAttribute("groups", group);
		return "group/ListGroup";
	}
	
	@RequestMapping(value="tomodifygroup")
	public String ToModifyGroup(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		if(id>0){
			Group group=groupservice.getGroupById(id);
			model.addAttribute("GroupInfo",group);
		}
		model.addAttribute("Edit", edit);
		model.addAttribute("GroupID",id);
		return "group/ModifyGroup";
	}
		
	@RequestMapping(value="modifygroup")
	@ResponseBody
	public Feedback ModifyGroup(Group group,HttpServletRequest request, Model model){
		int result=-1;
		String message="更新失败";
		try{
			if(groupservice.HasGroupName(group.getGroupName(),group.getId())<=0){
				if(group.getStatus().equals("0")){
					if(userService.getUserByGroupId(group.getId())<=0){
						result=this.groupservice.UpdateGroup(group);
					}else{
						message="该户组名下还有用户，不能禁用";
					}
				}else{
					result=this.groupservice.UpdateGroup(group);
				}
				}else{
				message="用户组名不能相同";
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
	
	@RequestMapping(value="addgroup")
	@ResponseBody
	public Feedback AddGroup(Group group,HttpServletRequest request, Model model){
		int result=-1;
		String message="添加失败";
		try{
			if(groupservice.HasGroupName(group.getGroupName(),group.getId())<=0){
				result=this.groupservice.AddGroup(group);
			}else{
				message="用户组名不能相同";
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
	
	@RequestMapping(value="delgroup")
	@ResponseBody
	public Feedback DelGroup(@RequestParam("id")int id,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try{
			if(userService.getUserByGroupId(id)<0){
				result=this.groupservice.DelGroup(id);
			}else{
				 message="该用户组下还有用户，不能删除";
			}
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
	
	@RequestMapping(value="tosetgroup_role")
	public String ToSetGroupRole(@RequestParam("id")int id,HttpServletRequest request, Model model){
		List<Role> selectroles=new ArrayList<Role>();
		List<Role> unselectroles=new ArrayList<Role>();
		Set<Integer> selectList = this.roleservice.findAllRoleIdByGroupId(id);
		List<Role> allList = this.roleservice.findAllSelectRoleList();
		for(Role r:allList){
			if(selectList.contains(r.getId())){
				selectroles.add(r);
			}else{
				unselectroles.add(r);
			}
		}
		model.addAttribute("select", selectroles);
		model.addAttribute("unselect", unselectroles);
		model.addAttribute("GroupID",id);
		return "group/SetGroupRole";
	}
	
	@RequestMapping(value="addroletogroup")
	@ResponseBody
	public Feedback AddRoleToGroup(@RequestParam("groupId")String groupId,@RequestParam("roleId")String roleId,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try{		
			result=this.groupservice.UpdateRoleByGroupId(roleId,groupId);
			if(result==-1){
				return Feedback.success("该权限已经被被禁用");
			}
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
