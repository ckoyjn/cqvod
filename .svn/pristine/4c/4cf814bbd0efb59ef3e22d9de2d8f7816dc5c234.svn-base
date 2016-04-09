package com.guanglumedia.common.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

public class PropertiesUtils {
	private static Map<String,Properties> props=new HashMap<String,Properties>();
	public static Properties getProperties(String path){
		if(!props.containsKey(path)){
			try {
				Resource resource = new ClassPathResource(path);
				Properties prop = PropertiesLoaderUtils.loadProperties(resource);
				props.put(path, prop);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return props.get(path);
	}
}
