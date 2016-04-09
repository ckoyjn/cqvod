package com.guanglumedia.common.listener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
public class DistrictListener implements ServletContextListener{
	private static final Logger logger = Logger.getLogger(DistrictListener.class);
	private ApplicationContext app;  
	public void contextDestroyed(ServletContextEvent arg0){
		logger.warn("缓存服务器关闭..... ");
	}
	public void contextInitialized(ServletContextEvent event){
		app = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		logger.warn("服务器启动..... 开始查找缓存数据.");
		DistrictService service = app.getBean(DistrictService.class);
		DistrictCache.reload(service.getAllDistrict(2));
	}
}
