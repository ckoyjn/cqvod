package com.guanglumedia.api.utils;

import java.lang.reflect.Field;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;
import org.apache.log4j.Logger;

import com.guanglumedia.common.util.StringUtils;

	public class ControllerUtils{
		private static final Logger LOGGER = Logger.getLogger(ControllerUtils.class);
		private static final String OPERA_TYPE_DELETE = "3";
		private static final String OPERA_TYPE_MODIFY = "2";
		private static final String OPERA_TYPE_ADD = "1";
		private static final String OPERA_TYPE_BATCH_ADD = "4";
		public static final int MAX_API_RESULT_LENGTH = 256;
		public static final String UnknowError="{\"total\":\"0\",\"pagecount\":\"0\",\"returnecode\":\"999\",\"result\":\"[]\"}";
		public static String getParameter(HttpServletRequest request, String param){
			String str = request.getParameter(param);
			if (str == null) {
				str = "";
			}
			return str;
		}

		public static String getParameter(HttpServletRequest request, String key, boolean nullable)throws Exception{
			String str = request.getParameter(key);
			if (nullable) {
				return str;
			}
			if (str == null) {
				throw new Exception( "参数" + key + "缺失!");
			}
			if ("".equals(str.trim())) {
				throw new Exception("参数" + key + "不能为空");
			}
			return str;
		}

		public static JSONObject getJSONObj(HttpServletRequest request)throws Exception{
			try{
					String jsonString = StringUtils.requestGetStreamToString(request);
					LOGGER.debug("客户端JSON：" + jsonString);
					return JSONObject.fromObject(jsonString); 
				} catch (Exception localException) {
					throw new Exception("JSON格式不正确");
				}
			
		}

		public static JSONArray getJSONArr(HttpServletRequest request) throws Exception{
			try {
				String jsonString = StringUtils.requestGetStreamToString(request);
				LOGGER.debug("客户端jsonString：" + jsonString);
				return JSONArray.fromObject(jsonString); 
				}catch (Exception localException) {
					throw new Exception( "JSON格式不正确");
				}
		}

		public static String getStringFromJsonObject(JSONObject json, String key){
			try{
				if (json == null) {
					return null;
				}
				return json.getString(key);
			} catch (JSONException e) {
				e.printStackTrace();
			}return null;
		}

		public static String getStringFromJsonObject(JSONObject json, String key, boolean nullable)throws Exception{
			try{
				if (json == null) {
					return null;
				}
				return json.getString(key);
			} catch (JSONException localJSONException) {
				if (nullable)
					return null;
				}
			throw new Exception( "参数" + key + "缺失!");
		}

		public static String getStringFromRequestHeader(HttpServletRequest request, String key, boolean nullable)throws Exception{
			if ((request == null) || (StringUtils.isEmpty(key))) {
				return null;
			}
			String value = request.getHeader(key);
			if ((StringUtils.isEmpty(value)) && (!nullable)) {
				throw new Exception("公用请求参数" + key + "不能为空");
			}
			return value;
		}

		public static <T> T NullValueFilter(T object){
			if (object == null)
				return null;
			try{
				Class<? extends Object> clazz = object.getClass();
				Field[] field = clazz.getDeclaredFields();
				for (Field f : field) {
					Class<? extends Object> type = f.getType();
					if (type == String.class)
						setFieldValueIfNull(f, object, "");
					else if (type == Integer.class)
						setFieldValueIfNull(f, object, Integer.valueOf(0));
				}
			}catch (Exception e) {
				LOGGER.error("NullValueFilter设置属性值时出错", e);
			}
			return object;
		}

		private static void setFieldValueIfNull(Field f, Object object, Object value) throws Exception {
			f.setAccessible(true);
			Object o = f.get(object);
			if (o == null)
				f.set(object, value);
		}

		public static int getPageNo(HttpServletRequest request){
			String strPageNo = getPage(request);
			if (StringUtils.isEmpty(strPageNo))
				strPageNo = "1";
			try{
				return Integer.parseInt(strPageNo); } catch (Exception localException) {
				}
			return 1;
		}

		public static boolean isAllPropertyNull(Object o){
			Field[] fields = o.getClass().getDeclaredFields();
			for (Field f : fields) {
				f.setAccessible(true);
				try {
					Object obj = f.get(o);
					if (obj != null)
						return true;
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
			return false;
		}

		public static String getPage(HttpServletRequest request){
			return getParameter(request, "_p");
		}

		public String checkLength(String str){
			if (StringUtils.isEmpty(str))
				return str;
			if (str.length() > 256)
				str = str.substring(0, 253) + "...";
			return str;
		}
}