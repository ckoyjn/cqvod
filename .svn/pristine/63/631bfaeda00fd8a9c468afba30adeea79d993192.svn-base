package com.guanglumedia.cms.interceptor.authorization;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.method.HandlerMethod;
import com.guanglumedia.cms.admin.entity.User;
import com.guanglumedia.cms.annotation.AuthEnum;
import com.guanglumedia.cms.annotation.AuthPassport;
import com.guanglumedia.cms.common.Global;
import com.guanglumedia.cms.common.SessionController;

public class AuthorizationInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception {
		 if(handler.getClass().isAssignableFrom(HandlerMethod.class)){
			 	AuthPassport authPassport = ((HandlerMethod) handler).getMethodAnnotation(AuthPassport.class);
	            if(authPassport != null){
	            	User user=SessionController.getSessionUser(request);
	            		if(user==null){
	            				request.getRequestDispatcher(Global.URL_Login).forward(request, response);
	            				return false;
	            		}
	            	if(authPassport.value()==AuthEnum.AdminAuth){
	            		if(!"1".endsWith(user.getGroupID())){
	            			request.getRequestDispatcher(Global.URL_NoPermission).forward(request, response);
	            			return false;
	            		}
	            	}else if(authPassport.value()==AuthEnum.RoleAuth){  
	            		boolean result=SessionController.hasPermission(request);
	            		if(!result){
	            			request.getRequestDispatcher(Global.URL_NoPermission).forward(request, response);
	            			return false;
	            		}
	            	}else{
	            		return true;
	            	}
	            } else{
	            	return true;   
	            }
		 }
		 return true;  
	}
}
