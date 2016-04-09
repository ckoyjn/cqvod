package com.guanglumedia.common.util;
import it.sauronsoftware.base64.Base64;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

public final class StringUtils{
	private static Logger log = Logger.getLogger(StringUtils.class);

	public static boolean isEmpty(String str){
		return (str == null) || ("".equals(str.trim()));
	}

	public static boolean isNotEmpty(String str){
		return !isEmpty(str);
	}

	public static boolean isPhoneNumber(String phoneNumber){
		String reg = "1\\d{10}";
		return phoneNumber.matches(reg);
	}

	public static boolean isNumber(String str){
		String reg = "[0-9]+";
		return str.matches(reg);
	}
	public static boolean isNotNumber(String str) {
		return !isNumber(str);
	}

	public static int stringToInt(String str){
	  if (isEmpty(str)){
		  return -1;
	  }
	  try{
		  return Integer.parseInt(str.trim()); 
		  } catch (NumberFormatException e) {
			  return -1;
		  }
	}

	public static boolean stringToBoolean(String str){
		if (isEmpty(str)){
			return false;
		}
		try{
			return Boolean.parseBoolean(str.trim()); 
			} catch (Exception e) {
				return false;
			}
	}

	public static String BooleanToString(Boolean bool){
		String booleanString = "false";
		if (bool.booleanValue()) {
			booleanString = "true";
		}
		return booleanString;
	}

	public static String getExceptionStackTrace(Throwable ex){
		  Writer writer = new StringWriter();
		  PrintWriter printWriter = new PrintWriter(writer);
		  ex.printStackTrace(printWriter);
		  Throwable cause = ex.getCause();
		  while (cause != null) {
			  cause.printStackTrace(printWriter);
			  cause = cause.getCause();
		  }
		  printWriter.close();
		  String result = writer.toString();
		  return result;
  	}

	public static String decodeUnicode(String dataStr){
		StringBuffer buffer = new StringBuffer();
		String tempStr = "";
		String operStr = dataStr;
		if ((operStr != null) && (operStr.indexOf("\\u") == -1)) {
			return operStr;
		}
		if ((operStr != null) && (!operStr.equals("")) && (!operStr.startsWith("\\u"))){
			tempStr = substring(operStr, 0, operStr.indexOf("\\u"));
			operStr = substring(operStr, operStr.indexOf("\\u"), 
					operStr.length());
		}
		buffer.append(tempStr);
		while ((operStr != null) && (!operStr.equals("")) && (operStr.startsWith("\\u"))){
			tempStr = substring(operStr, 0, 6);
			operStr = substring(operStr, 6, operStr.length());
			String charStr = "";
			charStr = substring(tempStr, 2, tempStr.length());
			char letter = (char)Integer.parseInt(charStr, 16);
			buffer.append(String.valueOf(letter));
			if (operStr.indexOf("\\u") == -1) {
				buffer.append(operStr);
			}else {
				tempStr = substring(operStr, 0, operStr.indexOf("\\u"));
				operStr = substring(operStr, operStr.indexOf("\\u"), operStr.length());
				buffer.append(tempStr);
			}
		}
		return buffer.toString();
	}

	public static String substring(String str, int start, int end){
		if (isEmpty(str)) {
			return "";
		}
		int len = str.length();
		if (start > end) {
			return "";
		}
		if (start > len) {
			return "";
		}
		if (end > len) {
			return str.substring(start, len);
		}
		return str.substring(start, end);
	}

	public static String substring(String str, int start){
		if (isEmpty(str)) {
			return "";
		}
		int len = str.length();
		if (start > len) {
			return "";
		}
		return str.substring(start);
	}

	public static String streamToString(InputStream input){
		StringBuffer sb = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(
					new InputStreamReader(input,"UTF-8"));
			String temp = br.readLine();
			do {
				sb.append(temp);
				temp = br.readLine();
				if (temp == null) break; 
			}while (!"".equals(temp));
		}catch (IOException e) {
			log.error("流转换string错误！", e);
			return "";
		}
		return sb.toString();
	}

	public static String requestGetStreamToString(HttpServletRequest request){
	  	InputStream input = null;
	  	try {
	  		input = request.getInputStream();
	  		return streamToString(input);
	  	} catch (IOException e) {
	  		log.error("获得输入流失败！", e);
	  		return "";
	  	}
	}

	public static long parseLong(String str){
		try {
				return Long.valueOf(str).longValue(); 
			} catch (Exception localException) {
				return 0L;
			}
		
	}

	public static int parseInt(String str){
		try {
				return Integer.valueOf(str).intValue(); 
			} catch (Exception e) {
				return 0;
			}
	}

	public static float parseFloat(String str){
		try {
				return Float.valueOf(str).floatValue(); 
			} catch (Exception localException) {
				return 0.0F;
			}   
	}

	public static double parseDouble(String str){
		try {
				return Double.valueOf(str).doubleValue(); 
			} catch (Exception e) {
				return 0.0D;
			}
	}

	public static String transformBase64(String message){
		if (isEmpty(message)) {
			return "";
		}
		return Base64.encode(message, "UTF-8");
	}

	public static String decodeformBase64(String message) {
		if (isEmpty(message)) {
			return "";
		}
		return Base64.decode(message, "UTF-8");
	}

	public static boolean isChinese(char c) {
		Character.UnicodeBlock ub = Character.UnicodeBlock.of(c);
		return (ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS) || 
				(ub == Character.UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS) || 
				(ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A) || 
				(ub == Character.UnicodeBlock.GENERAL_PUNCTUATION) || 
				(ub == Character.UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION) || 
				(ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS);
	}

	public static boolean isChinese(String strName){
		char[] ch = strName.toCharArray();
		for (int i = 0; i < ch.length; i++) {
			char c = ch[i];
			if (isChinese(c)) {
				return true;
			}
		}
		return false;
	}

	public static boolean isMessyCode(String strName) {
		Pattern p = Pattern.compile("\\s*|\t*|\r*|\n*");
		Matcher m = p.matcher(strName);
		String after = m.replaceAll("");
		String temp = after.replaceAll("\\p{P}", "");
		char[] ch = temp.trim().toCharArray();
		float chLength = ch.length;
		float count = 0.0F;
		for (int i = 0; i < ch.length; i++) {
			char c = ch[i];
			if ((Character.isLetterOrDigit(c)) || (isChinese(c))) continue;
			count += 1.0F;
		}
		float result = count / chLength;
		return result > 0.4D;
	}

	public static String join(Object[] obj, String join){
		if ((obj == null) || (obj.length == 0)){
			return "";
		}
		boolean isFirst = true;
		String result = "";
		Object[] arrayOfObject = obj; 
		int j = obj.length; 
		for (int i = 0; i < j; i++) { 
			Object object = arrayOfObject[i];
			if (isFirst) {
				isFirst = false;
				result = object.toString();
			} else {
				result = result + join + object.toString();
			}
		}
		return result;
	}

	public static String join(List<?> list, String join){
		if ((list == null) || (list.size() == 0)){
			return "";
		}
		boolean isFirst = true;
		String result = "";
		for (Iterator<?> localIterator = list.iterator(); localIterator.hasNext(); ) { 
			Object object = localIterator.next();
			if (isFirst) {
				isFirst = false;
				result = object.toString();
			} else {
				result = result + join + object.toString();
			}
		}
		return result;
	}

	public static String join(List<?> list, String join, String fieldName){
			if ((list == null) || (list.size() == 0)){
				return "";
			}
			boolean isFirst = true;
			String result = "";
			try {
				for (Iterator<?> localIterator = list.iterator(); localIterator.hasNext(); ) {
					Object object = localIterator.next();
					Class<?> clazz = object.getClass();
					Field f = clazz.getDeclaredField(fieldName);
					f.setAccessible(true);
					if (isFirst) {
						isFirst = false;
						result = (String)f.get(object);
					} else {
						result = result + join + (String)f.get(object);
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}

	public static String NullToZero(String str) {
		if (isEmpty(str)){
			return "0";
		}
		return str;
	}

	public static String removeAllEmptyChar(String str){
	  	if (isEmpty(str)){
	  		return str;
	  	}
	  	return str.replaceAll(" |\t", "");
  	}
	
	public static String getTypeOfFile(String str){
		String type=null;
		String st=str.replace(".", "#");
		String[] a=st.split("#");
		int length=a.length-1;
		type=a[length];
		return type;
	}
}