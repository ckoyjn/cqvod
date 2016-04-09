package com.guanglumedia.cms.common;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import com.guanglumedia.cms.admin.entity.User;
import com.guanglumedia.cms.common.tinytree.TinyTreeBean;

public class SessionController {
	public static User getSessionUser(HttpServletRequest request){
		return (User) request.getSession().getAttribute(Global.Session_User);
	}

	@SuppressWarnings("unchecked")
	public static List<TinyTreeBean> getSessionResource(HttpServletRequest request) {
		return  (List<TinyTreeBean>)request.getSession().getAttribute(Global.Session_Resource);
	}

	public static boolean hasPermission(HttpServletRequest request) {
		@SuppressWarnings("unchecked")
		Set <String>rights=(Set<String>) request.getSession().getAttribute(Global.Session_Rights);
		return rights.contains(request.getRequestURI().substring(request.getRequestURI().indexOf(request.getContextPath())));
	}
	public static boolean hasPermission(HttpServletRequest request,String RequestURI) {
		@SuppressWarnings("unchecked")
		Set <String>rights=(Set<String>) request.getSession().getAttribute(Global.Session_Rights);
		return rights.contains(RequestURI);
	}
}
