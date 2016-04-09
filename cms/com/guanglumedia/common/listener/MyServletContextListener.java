package com.guanglumedia.common.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.guanglumedia.common.util.ContextUtils;

public class MyServletContextListener implements ServletContextListener{
	public static ThreadLocal<ServletContext> local=new ThreadLocal<ServletContext>();
	private ServletContext context=null;

	public void contextDestroyed(ServletContextEvent event) {
		this.context=null;
	}

	//初始化
	public void contextInitialized(ServletContextEvent event) {
		  
        this.context = event.getServletContext();  
  
        String contextName = context.getServletContextName();  
          
        String realpath = context.getRealPath(ContextUtils.FSP);  
  
        ContextUtils.setContextPath(contextName);  
        ContextUtils.getRealPath(realpath);  
	}

}
