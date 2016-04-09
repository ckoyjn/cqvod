package com.guanglumedia.common.util;


import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.guanglumedia.common.listener.MyServletContextListener;
/**
 * Miscellaneous utility methods for Context.
 * @description <p>提供各种与环境相关的静态方法</p>
 * ContextUtils
 * @author wanghe
 * @version 0.9
 * @since 2011-1-21 上午03:16:18
 * @see
 */
public class ContextUtils {
	public static final String FSP = System.getProperty("file.separator");
	public static final String LSP = System.getProperty("line.separator");
	ServletContext  context=(ServletContext)MyServletContextListener.local.get();
	 ApplicationContext ctx = WebApplicationContextUtils  
             .getRequiredWebApplicationContext(context);  
	private static String CONTEXTPATH;
	private static String REALPATH;
	
	/**
	 * Get the ContextPath
	 * @description <p>获取应用名称</p>
	 * @author wanghe
	 * @since 2011-1-21
	 * @return
	 * String
	 */
	public static String getContextPath(){
		return CONTEXTPATH;
	}
	
	public static String getRealPath(){
		return REALPATH;
	}
	
	public static void setContextPath(String contextpath){
		CONTEXTPATH = contextpath;
	}
	
	public static void getRealPath(String realpath){
		REALPATH = realpath;
	}
}
