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

import com.guanglumedia.cms.admin.entity.Right;
import com.guanglumedia.cms.admin.entity.Role;
import com.guanglumedia.cms.admin.service.ResourceService;
import com.guanglumedia.cms.admin.service.RightService;
import com.guanglumedia.cms.admin.service.RoleService;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;

@Controller
@RequestMapping(value="/cms/role")
public class RoleAction extends BaseAction{
	@Autowired
	private RoleService roleservice;
	@Autowired
	private ResourceService resourService;
	@Autowired
	private RightService rightservice;
	@RequestMapping(value="findrolelist")
	
	public String FindRoleList(Role role,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		PagedModelList<Role> pagedModelList = this.roleservice.findAllRoleList(role,getPageNo(request),getPageRow(request));
		model.addAttribute("pagedModelList", pagedModelList);
		return "role/ListRole";
	}
	
	@RequestMapping(value="tomodifyrole")
	public String ToModifyRole(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		if(id>0){
			Role role=roleservice.getRoleById(id);
			model.addAttribute("RoleInfo",role);
		}
		model.addAttribute("Edit", edit);
		model.addAttribute("RoleID",id);
		return "role/ModifyRole";
	}
		
	@RequestMapping(value="modifyrole")
	@ResponseBody
	public Feedback ModifyRole(Role role,HttpServletRequest request, Model model){
		int result=-1;
		String message="更新失败";
		try{
			//如果更新角色状态为禁用 先查询有没有用户组在使用角色 ，如果有就不能禁用角色
			if(role.getStatus().equals("0")){
				//表示要修改成禁用状态
				if(!roleservice.findGroupIdByRoleId(role.getId()).isEmpty()){
					//表示有用户组在使用该角色
						return Feedback.success("该角色正在被使用，不能更新为禁用");
				}
			}
			if(roleservice.hasRoleName(role.getRoleName(),role.getId())<=0){
				result=this.roleservice.UpdateRole(role);
			}else{
				message = "角色名称不能重复";
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
	
	@RequestMapping(value="addrole")
	@ResponseBody
	public Feedback AddRole(Role role,HttpServletRequest request, Model model){
		int result=-1;
		String message="添加失败";
		try{	
			if(roleservice.hasRoleName(role.getRoleName(),role.getId())<=0){
				result=this.roleservice.AddRole(role);
			}else{
				message = "角色名称不能重复";
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
	
	@RequestMapping(value="delrole")
	@ResponseBody
	public Feedback DelRole(@RequestParam("id")int id,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try{	
			if(!roleservice.findGroupIdByRoleId(id).isEmpty()){
				//表示有用户组在使用该角色
				return Feedback.success("该角色正在被使用，不能删除");
			}
			result=this.roleservice.DelRole(id);
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
	
	@RequestMapping(value="toupdateroleresource")
	public String ToUpdateRoleResource(@RequestParam("id")int id,HttpServletRequest request, Model model){
		model.addAttribute("roleId", id);
		return "role/RoleResourceTree";
	}
	
	@RequestMapping(value="buildresourcetree")
	@ResponseBody
	public String BuildResourceTree(@RequestParam("id")int id,HttpServletRequest request, Model model){
		return this.resourService.bindResourceTree(id);
	}
	
	@RequestMapping(value="updateroleresource")
	@ResponseBody
	public Feedback UpdateRoleResource(@RequestParam("roleId")String roleId,@RequestParam("resIds")String resIds,HttpServletRequest request, Model model){
		int result=-1;
		String message="添加失败";
		try{		
			result=this.roleservice.UpdateRoleResource(roleId,resIds.split(","));
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
	
	@RequestMapping(value="toupdateroleright")
	public String ToSetGroupRole(@RequestParam("id")int id,HttpServletRequest request, Model model){
		List<Right> selectrights=new ArrayList<Right>();
		List<Right> unselectrights=new ArrayList<Right>();
		Set<Integer> selectList = this.rightservice.findAllRightByRoleId(id);
		List<Right> allList = this.rightservice.findRightList();
		for(Right r:allList){
			if(selectList.contains(r.getId())){
				selectrights.add(r);
			}else{
				unselectrights.add(r);
			}
		}
		model.addAttribute("select", selectrights);
		model.addAttribute("unselect", unselectrights);
		model.addAttribute("RoleID",id);
		return "role/SetRoleRight";
	}
	
	@RequestMapping(value="addroletoright")
	@ResponseBody
	public Feedback AddRoleToGroup(@RequestParam("roleId")String roleId,@RequestParam("rightId")String rightId,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try{		
			result=this.roleservice.UpdateRightByRoleId(roleId,rightId);
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
