package com.guanglumedia.cms.common;

//import com.xs.ott.Global;
//import com.xs.ott.client.common.DistrictCache;
//import com.xs.ott.client.common.entity.District;
//import com.xs.ott.client.common.service.UploadSourceService;
//import com.xs.ott.common.exception.OTTException;
//import com.xs.ott.common.util.DateUtil;
//import com.xs.ott.common.util.PagedModelList;
//import com.xs.ott.common.util.StringUtils;
//import com.xs.ott.common.util.UploadApiUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.ui.Model;

import com.guanglumedia.common.listener.District;
import com.guanglumedia.common.listener.DistrictCache;
import com.guanglumedia.common.util.DateUtils;
import com.guanglumedia.common.util.StringUtils;

public class BaseAction{
		protected Model bindRequestToModel(HttpServletRequest request, Model model){
			Map<String, String[]> params = request.getParameterMap();
			if ((params != null) && (params.size() > 0)){
				Set<String> keys = params.keySet();
				String[] strs = null;
				for (String key : keys) {
					strs = params.get(key);
					model.addAttribute(key, strs[0]);
				}
			}
			return model;
		}
		protected String getParameter(HttpServletRequest request, String key){
			return request.getParameter(key);
		}
		protected Object resolveBeanFromRequest(HttpServletRequest request, Class<?> cls){
			if (cls == null) {
				return null;
			}
			Map<String,Field> maps = new HashMap<String,Field>();
			Field[] fields = cls.getDeclaredFields();
			for (Field field : fields) {
				maps.put(field.getName(), field);
			}
			Map<String, String[]> params = request.getParameterMap();
			try{
				Object obj = cls.newInstance();
				if ((params != null) && (params.size() > 0)) {
					Set<String> keys = params.keySet();
					String[] strs = null;
					for (String key : keys) {
						strs = params.get(key);
						Field field = (Field)maps.get(key);
						if (field == null){
							continue;
						}
						field.setAccessible(true);
						if ((field.getType().equals(Long.class)) || (field.getType().equals(Long.TYPE)))
							field.set(obj,Long.valueOf(StringUtils.parseLong(strs[0])));
						else if (field.getType().equals(String.class))
							field.set(obj, strs[0]);
						else if ((field.getType().equals(Double.class)) || (field.getType().equals(Double.TYPE)))
							field.set(obj,Double.valueOf(StringUtils.parseDouble(strs[0])));
						else if ((field.getType().equals(Integer.class)) || (field.getType().equals(Integer.TYPE)))
							field.set(obj,Integer.valueOf(StringUtils.parseInt(strs[0])));
						else if ((field.getType().equals(Float.class)) || (field.getType().equals(Float.TYPE)))
							field.set(obj,Float.valueOf(StringUtils.parseFloat(strs[0])));
						else if (field.getType().equals(Date.class)) {
							field.set(obj, DateUtils.parseDate(strs[0],"yyyy-MM-dd HH:mm:ss"));
						}
					}
				}
				return obj;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}

		private PrintWriter getDefaultAjaxWriter(HttpServletResponse response){
			response.setContentType("text/html;charset=utf-8");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			try {
				return response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("unable to get writer.");
			}
		}

		protected void writeAjaxResult(HttpServletResponse response, String result){
			PrintWriter out = null;
			try {
				out = getDefaultAjaxWriter(response);
				out.write(result);
				out.flush();
			} finally {
				if (out != null)out.close();
			}
		}

		protected void writeJson(HttpServletResponse response, Object obj){
			response.setContentType("text/html;charset=utf-8");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			try {
				response.getWriter().print(obj);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		protected String newErrorModelView(Model model, String errorMsg){
			if (model != null) {
				model.addAttribute("error", errorMsg);
			}
			return "error";
		}

		protected String newSuccessModelView(Model model){
			if (model != null) {
				model.addAttribute("success", "操作成功");
			}
			return "success";
		}

		protected String getPage(HttpServletRequest request){
			return getParameter(request, "_p");
		}

		protected int getPageNo(HttpServletRequest request){
			String strPageNo = getPage(request);
			if (StringUtils.isEmpty(strPageNo))
				strPageNo = "1";
			try{
				return Integer.parseInt(strPageNo); 
			}catch (Exception e) {
			}
			return 1;
		}

		protected int getPageRow(HttpServletRequest request){
			try{
				String _pageRow = getParameter(request, "_pageRow");
				String[] pageRowSelect = PagedModelList.pageRowSelect;
				boolean bool = false;
				for (String str : pageRowSelect) {
					if (_pageRow.equals(str)) {
						bool = true;
						break;
					}
				}
				if (!bool) {
					return 10;
				}
				return Integer.parseInt(_pageRow); 
			} catch (Exception localException) {
			}
			return 10;
		}

		protected String getOrderColumn(HttpServletRequest request){
			return getParameter(request, "orderColumn");
		}

		protected void bindCitysToModel(Model model, String proId){
			model.addAttribute("proId", proId);
			model.addAttribute("provins", DistrictCache.getProvinces());
			model.addAttribute("citys", DistrictCache.getCitys(StringUtils.isEmpty(proId) ? 0 : Integer.valueOf(proId).intValue()));
		}

		protected void bindCitysAllToModel(Model model, String areaCode){
			model.addAttribute("provins", DistrictCache.getProvinces());
			District city = DistrictCache.getCityByAreaCode(areaCode);
			if (city != null) {
				model.addAttribute("cityId", city.getAreacode());
				model.addAttribute("proId", Integer.valueOf(city.getUpid()));
				model.addAttribute("citys", DistrictCache.getCitys(city.getUpid()));
			}
		}
////
////		protected List<District> getProvinces(){
////			return DistrictCache.getProvinces();
////		}
////
////		protected List<District> getCitys(String proId){
////			return DistrictCache.getCitys(StringUtils.isEmpty(proId) ? 0 : Integer.valueOf(proId).intValue());
////		}
////
////		public static Map<String, Object> uploadToServer(MultipartFile file, String uploadUrl, String parent, String subDir) throws OTTException{
////			if (file.isEmpty())
////				return null;
////			Map<String,String> params = new HashMap<String,String>();
////			params.put("parentId", parent);
////			params.put("fileName", file.getOriginalFilename());
////			params.put("secondsDir", subDir);
////
////			HashMap<String,Object> map = UploadSourceService.upload(uploadUrl, file, params);
////			String returnMsg = (String)map.get("returnMsg");
////			if (!StringUtils.isEmpty(returnMsg)) {
////				throw new OTTException(returnMsg);
////			}
////			map.put("fileSize", String.valueOf(file.getSize()));
////			return map;
////		}
////
////		public static Map<String, Object> uploadToServer_FTP(String ftpDir, String uploadUrl, String parent, String subDir)throws OTTException{
////		  	if (StringUtils.isEmpty(ftpDir))
////		  		return null;
////		  	Map<String,String> params = new HashMap<String,String>();
////		  	params.put("parentId", parent);
////		  	params.put("secondsDir", subDir);
////		  	params.put("ftpDir", ftpDir);
////		  	HashMap<String,Object> map = UploadApiUtil.uploadSystemApk(uploadUrl, params);
////		  	String returnMsg = (String)map.get("returnMsg");
////		  	if (!StringUtils.isEmpty(returnMsg)) {
////		  		throw new OTTException(returnMsg);
////		  	}
////		  	return map;
////		}
}