package com.guanglumedia.cms.admin.action;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.guanglumedia.cms.admin.entity.User;
import com.guanglumedia.cms.admin.service.LoginService;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Global;
import com.guanglumedia.cms.common.SessionController;
import com.guanglumedia.cms.common.tinytree.TinyTreeBean;
import com.guanglumedia.common.util.StringUtils;
@Controller
@RequestMapping(value="/cms/admin")
public class LoginAction extends BaseAction{
	@Autowired
	private LoginService loginservice;
	
	@RequestMapping(value={"logout"})
	public String Logout(HttpServletRequest request){
		request.getSession().setAttribute(Global.Session_User,null);
		return "redirect:/index.html";
	}
	
	@RequestMapping(value={"tologin"})
	public String ToLogin(HttpServletRequest request){	
		return "admin/Login";
	}
	
	@RequestMapping(value={"login"})
	public String Login(HttpServletRequest request,String LoginName,String Password, Model model){
		User user=SessionController.getSessionUser(request);
		if(user!=null){
			SetIndexAttribute(model,request);	
			return "admin/Index";
		}else{
			if(StringUtils.isEmpty(LoginName)||StringUtils.isEmpty(Password)){		
				return "admin/Login";
			}else{
				boolean result = loginservice.doLogin(LoginName,Password,request.getSession());
				if(result){
					SetIndexAttribute(model,request);
					return "admin/Index";
				}else{
					model.addAttribute("loginResult", "登录失败!");
					return "admin/Login";
				}
			}
		}
	}

	private void SetIndexAttribute(Model model, HttpServletRequest request) {
		model.addAttribute("user_session", SessionController.getSessionUser(request));
		List<TinyTreeBean>  menus = SessionController.getSessionResource(request);
		model.addAttribute("menus", menus);
	}
}
