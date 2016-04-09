package com.guanglumedia.common.util;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

public class LCWorldProUtil {

	private static String lost;
	
	private static final String DEFAULT_PROPERTIES_PATH = "LCWorld.properties";
	
	private static final Properties defaultProperties;
	
	static {
		// load resource
		Log logger = LogFactory.getLog(LCWorldProUtil.class);
		
		if (logger.isInfoEnabled()) {
			logger.info("ItnovaProUtil: initialization defaultProperties started");
		}
		long startTime = System.currentTimeMillis();
		try {
			Resource resource = new DefaultResourceLoader().getResource(DEFAULT_PROPERTIES_PATH);
			defaultProperties = PropertiesLoaderUtils.loadProperties(resource);
		}
		catch (IOException ex) {
			throw new IllegalStateException("Could not load 'itnova.properties': " + ex.getMessage());
		}
		if (defaultProperties != null) {
			lost = defaultProperties.getProperty("post_lost");
		}
		if (logger.isInfoEnabled()) {
			long elapsedTime = System.currentTimeMillis() - startTime;
			logger.info("ItnovaProUtil:initialization defaultProperties completed in " + elapsedTime + " ms");
		}
	}
	
	public static String getLost() {
		return lost;
	}

	public static String getDate() {
		String lostStr = LCWorldProUtil.getLost();
		if (lostStr == null || "".equals(lostStr.trim())) {
			lostStr = "15";
		}
		int lost = Integer.parseInt(lostStr);
		Date d = new Date();
		System.out.println(d);
		long dl = d.getTime();
		dl = dl + lost * 24 * 60 * 60 * 1000;
		Date date = new Date(dl);

		SimpleDateFormat myFmt = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = myFmt.format(date);
		return dateStr;

	}
	/**
	 * 通过key获取资源文件中的value
	 * @description <p></p>
	 * @author wanghe
	 * @since 2011-2-11
	 * @param key
	 * @return
	 * String
	 */
	public static String getProperties(String key) {
		try {
			return getProperties(key,null);
		} catch (Exception e) {
			return null;
		}
	}
	/**
	 * 通过key获取资源文件中的value
	 * @description <p></p>
	 * @author wanghe
	 * @since 2011-2-11
	 * @param key
	 * @param defaultValue 如果没有指定的value的默认值
	 * @return
	 * String
	 */
	public static String getProperties(String key,String defaultValue) {
		String message = "";
		try {
			message = defaultProperties.getProperty(key, defaultValue);
			
			return (message != null && !message.equals("") ? message: null);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void init(){
		
		
		
	}
	
}
