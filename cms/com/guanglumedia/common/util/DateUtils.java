	package com.guanglumedia.common.util;
	import java.text.ParseException;
	import java.text.SimpleDateFormat;
	import java.util.Date;

	public final class DateUtils{

  	public static Date parseDate(String source, String pattern) {
  		SimpleDateFormat format = new SimpleDateFormat(pattern);
  		try {
  				return format.parse(source); 
  			} catch (ParseException e) {
  				return null;
  			}
  	}
	public static String formatDate(Date source, String pattern) {
  		SimpleDateFormat format = new SimpleDateFormat(pattern);
  		try {
  				return format.format(source); 
  			} catch (Exception e) {
  				return null;
  			}
  	}
}