package com.guanglumedia.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class GetServerRealPathTools {

	/**
	 * 获取项目在服务其中的真实路径的工具类
	 * 
	 * 这是在web项目中，获取项目实际路径的最佳方式，在windows和linux系统下均可正常使用
	 * 
	 */
	public static String getRootPath() {

		//获取到类的路径
		String classPath = GetServerRealPathTools.class.getClassLoader().getResource("/").getPath();
		//System.out.println("classPath---" + classPath);
		String rootPath = "";
		// windows下
		if ("\\".equals(File.separator)) {
			// System.out.println("windows");
			rootPath = classPath.substring(1, classPath.indexOf("/WEB-INF/classes"));
			rootPath = rootPath.replace("/", "\\");
		}
		// linux下
		if ("/".equals(File.separator)) {
			// System.out.println("linux");
			rootPath = classPath.substring(0, classPath.indexOf("/WEB-INF/classes"));
			rootPath = rootPath.replace("\\", "/");
		}
		return rootPath;
	}
	
	/**
	 * 获取epgimg中所有的 _list.jpg 结尾的图片
	 */
	public static List<String> findAllIdentifys(List<String> existedIdentifies) {
		List<String> list = new ArrayList<String>();
		String filePath = GetServerRealPathTools.getRootPath()+File.separator+"static"+File.separator+"epgimg";//获取根目录
		File root = new File(filePath);
		File[] files = root.listFiles();
		for (File file : files) {
			if(file.isFile()){
				String fileName = file.getName();
				if(fileName.endsWith("_list.jpg")){
					String result = fileName.substring(0, fileName.length()-9);
					/*判断是否已经使用*/
					boolean isUsed = existedIdentifies.contains(result);
					if(isUsed){
						continue;
					}
					//判断是否为数字
					boolean isDigit = true;
					for (int i = 0; i < result.length(); i++) {
						if(!Character.isDigit(result.charAt(i))){
							isDigit = false;
							break;
						}
					}
					if(isDigit){
						list.add(result);
					}
				}
			}
		}
		return list;
	}
}
