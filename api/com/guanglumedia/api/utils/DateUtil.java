package com.guanglumedia.api.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

public final class DateUtil
{
  public static String getCurrentmin()
  {
     SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
     return sdf.format(new Date());
  }

  public static String getCurrentH() {
     SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
     return sdf.format(new Date());
  }

  public static String getCurrentYMD() {
     SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
     return sdf.format(new Date());
  }

  public static String getCurrentDateTime()
  {
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     return sdf.format(new Date());
  }

  public static String getCurrentDateTime2()
  {
     return String.valueOf(new Date().getTime());
  }

  public static String getCurrentDate()
  {
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
     return sdf.format(new Date());
  }
			
			public static String getStringDate(Date date){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				return sdf.format(date);
			}
			public static String getCurrentStringDatePremonth(){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar calendar=Calendar.getInstance();
				calendar.add(Calendar.MONTH, -1);
				return sdf.format(calendar.getTime());
			}
			public static Date getCurrentDatePremonth(){
				Calendar calendar=Calendar.getInstance();
				calendar.add(Calendar.MONTH, -1);
				return calendar.getTime();
			}
			public static String getCurrentStringDatePreyear(){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar calendar=Calendar.getInstance();
				calendar.add(Calendar.YEAR, -1);
				return sdf.format(calendar.getTime());
			}
			public static Date getCurrentDatePreyear(){
				Calendar calendar=Calendar.getInstance();
				calendar.add(Calendar.YEAR, -1);
				return calendar.getTime();
			}
			public static String getCurrentStringDatePreweek(){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar calendar=Calendar.getInstance();
				calendar.add(Calendar.WEEK_OF_YEAR, -1);
				return sdf.format(calendar.getTime());
			}
			public static Date getCurrentDatePreweek(){
				Calendar calendar=Calendar.getInstance();
				calendar.add(Calendar.WEEK_OF_YEAR, -1);
				return calendar.getTime();
			}

  public static String parseDate(String date)
  {
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
     Date date2 = null;
    try {
       date2 = sdf.parse(date);
    } catch (ParseException e) {
       return "";
    }
     return sdf.format(date2);
  }

  public static Date parseDate(String source, String pattern) {
     SimpleDateFormat format = new SimpleDateFormat(pattern);
    try {
       return format.parse(source); } catch (ParseException e) {
    }
     return null;
  }

  public static String parseDate(Date date, String pattern)
  {
     SimpleDateFormat format = new SimpleDateFormat(pattern);
    try {
       return format.format(date); } catch (Exception e) {
    }
     return null;
  }

  public static String formatTime(String time)
  {
    try
    {
       Date date = new Date(Long.parseLong(time));
       Date currentTime = new Date();
       SimpleDateFormat sdf = null;
       if (getYear(date) == getYear(currentTime)) {
         if ((getMonth(date) == getMonth(currentTime)) && (getDay(date) == getDay(currentTime))) {
           sdf = new SimpleDateFormat("HH:mm");
           return sdf.format(date);
        }
         sdf = new SimpleDateFormat("M月d日");
         return sdf.format(date);
      }
       sdf = new SimpleDateFormat("yyyy年M月d日");
       return sdf.format(date);
    } catch (Exception e) {
    }
     return "";
  }

  public static String formatTime2(String time)
  {
    try
    {
       Date date = new Date(Long.parseLong(time));
       Date currentTime = new Date();
       SimpleDateFormat sdf = null;
       if (getYear(date) == getYear(currentTime)) {
         sdf = new SimpleDateFormat("M月d日 HH:mm");
         return sdf.format(date);
      }
       sdf = new SimpleDateFormat("yyyy年M月d日 HH:mm");
       return sdf.format(date);
    } catch (Exception e) {
    }
     return "";
  }

  public static int getMonthMaxDay(String date)
    throws ParseException
  {
     return getMonthMaxDay(formatDate(date));
  }

  public static int getMonthMaxDay(Date date)
  {
     Calendar c = setCalendar(date);
     return c.getActualMaximum(5);
  }

  public static int getYear(Date date)
  {
     return setCalendar(date).get(1);
  }

  public static int getMonth(Date date)
  {
     return setCalendar(date).get(2) + 1;
  }

  public static int getDay(Date date)
  {
     return setCalendar(date).get(5);
  }

  public static int getWeek(Date date)
  {
     return setCalendar(date).get(7) - 1;
  }

  public static int getHours(Date date)
  {
     return setCalendar(date).get(11);
  }

  public static int getMinutes(Date date)
  {
     return setCalendar(date).get(12);
  }

  public static int getSeconds(Date date)
  {
     return setCalendar(date).get(13);
  }

  public static Date getWeekByNum(Date date, int num)
  {
     Calendar c = setCalendar(date);
     c.set(7, num);
     return c.getTime();
  }

  public static Calendar setCalendar(Date date)
  {
     Calendar c = Calendar.getInstance(Locale.CHINA);
     c.setTime(date);
     return c;
  }

  public static Date setCalendar(Date date, int day) {
     Calendar c = setCalendar(date);
     c.set(5, day);
     return c.getTime();
  }

  public static Date addDay(Date date, int num)
  {
     Calendar c = setCalendar(date);
     c.add(5, num);
     return c.getTime();
  }

  public static Date addMonth(Date date, int num)
  {
     Calendar c = setCalendar(date);
     c.add(2, num);
     return c.getTime();
  }

  public static Date setTime(Date date, int hour, int minute, int second)
  {
     Calendar c = setCalendar(date);
     c.set(11, hour);
     c.set(12, minute);
     c.set(13, second);
     return c.getTime();
  }

  public static Date set(Date date, int pattern, int param) {
     Calendar c = setCalendar(date);
     c.set(pattern, param);
     return c.getTime();
  }

  public static Date formatDate(String date, String pattern)
    throws ParseException
  {
     if ((pattern == null) || ("".equals(pattern))) {
       return formatDate(date);
    }

     SimpleDateFormat sdf = new SimpleDateFormat(pattern);

     return sdf.parse(date);
  }

  public static Date formatDate(String date)
    throws ParseException
  {
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
     return sdf.parse(date);
  }

  public static Date formatDate(Object obj)
    throws ParseException
  {
     if ((obj instanceof Date)) {
       return (Date)obj;
    }
     throw new ParseException("convert is error", 1);
  }

  public static String toString(Date date, String pattern)
  {
     SimpleDateFormat sdf = new SimpleDateFormat(pattern);

     return sdf.format(date);
  }

  public static String toString(Date date)
  {
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     return sdf.format(date);
  }

  public static Date getTodayDate() {
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    try {
       return sdf.parse(getCurrentDateTime());
    }
    catch (ParseException e) {
       e.printStackTrace();
    }
     return null;
  }

  public static Date add(Date date, int field, int num)
  {
     Calendar c = setCalendar(date);
     c.add(field, num);
     return c.getTime();
  }

  public static int getWeekOfYear(Date date)
  {
     Calendar c = new GregorianCalendar();
     c.setFirstDayOfWeek(2);
     c.setMinimalDaysInFirstWeek(7);
     c.setTime(date);

     return c.get(3);
  }

  public static int getMaxWeekNumOfYear(int year)
  {
     Calendar c = new GregorianCalendar();
     c.set(year, 11, 31, 23, 59, 59);

     return getWeekOfYear(c.getTime());
  }

  public static Date getFirstDayOfWeek(int year, int week)
  {
     Calendar c = new GregorianCalendar();
     c.set(1, year);
     c.set(2, 0);
     c.set(5, 1);

     Calendar cal = (GregorianCalendar)c.clone();
     cal.add(5, week * 7);

     return getFirstDayOfWeek(cal.getTime());
  }

  public static Date getLastDayOfWeek(int year, int week)
  {
     Calendar c = new GregorianCalendar();
     c.set(1, year);
     c.set(2, 0);
     c.set(5, 1);

     Calendar cal = (GregorianCalendar)c.clone();
     cal.add(5, week * 7);

     return getLastDayOfWeek(cal.getTime());
  }

  public static Date getFirstDayOfWeek(Date date)
  {
     Calendar c = new GregorianCalendar();
     c.setFirstDayOfWeek(2);
     c.setTime(date);
     c.set(7, c.getFirstDayOfWeek());
     return c.getTime();
  }

  public static Date getLastDayOfWeek(Date date)
  {
     Calendar c = new GregorianCalendar();
     c.setFirstDayOfWeek(2);
     c.setTime(date);
     c.set(7, c.getFirstDayOfWeek() + 6);
     return c.getTime();
  }

  public static Date getFirstDayOfWeek()
  {
     Calendar c = new GregorianCalendar();
     c.setFirstDayOfWeek(2);
     c.setTime(new Date());
     c.set(7, c.getFirstDayOfWeek());
     return c.getTime();
  }

  public static Date getLastDayOfWeek()
  {
     Calendar c = new GregorianCalendar();
     c.setFirstDayOfWeek(2);
     c.setTime(new Date());
     c.set(7, c.getFirstDayOfWeek() + 6);
     return c.getTime();
  }

  public static Date getFirstDayOfMonth()
  {
     Calendar c = new GregorianCalendar();
     c.setFirstDayOfWeek(2);
     c.setTime(new Date());
     c.set(5, 1);
     return c.getTime();
  }

  public static Date getLastDayOfMonth()
  {
     Calendar c = new GregorianCalendar();
     c.setFirstDayOfWeek(2);
     c.setTime(new Date());
     c.set(5, getMonthMaxDay(new Date()));
     return c.getTime();
  }

  public static Date getFirstDateOfLastMonth()
  {
     Date lastMonth = addMonth(new Date(), -1);
     Date lastDate = setCalendar(lastMonth, 1);
     return setTime(lastDate, 0, 0, 0);
  }

  public static Date getLastDateOfLastMonth()
  {
     Date lastMonth = addMonth(new Date(), -1);
     int max = getMonthMaxDay(lastMonth);
     Date lastDate = setCalendar(lastMonth, max);
     return setTime(lastDate, 23, 59, 59);
  }

  public static Date getFirstDateOfLastDate()
  {
     Date date = addDay(new Date(), -1);
     return setTime(date, 0, 0, 0);
  }

  public static Date getLastDateOfLastDate()
  {
     Date date = addDay(new Date(), -1);
     return setTime(date, 23, 59, 59);
  }

  public static Date getFirstDateOfLastHour()
  {
     Date now = new Date();
     int hour = getHours(now) - 1;
     Date date = null;
     if (hour == -1) {
       date = addDay(now, -1);
       hour = 23;
    } else {
       date = now;
    }
     return setTime(date, hour, 0, 0);
  }

  public static Date getLastDateOfLastHour()
  {
     Date now = new Date();
     int hour = getHours(now) - 1;
     Date date = null;
     if (hour == -1) {
       date = addDay(now, -1);
       hour = 23;
    } else {
       date = now;
    }
     return setTime(date, hour, 59, 59);
  }

  public static long dateDiff(Date dateStart, Date dateEnd) {
     return dateEnd.getTime() - dateStart.getTime();
  }

  public static boolean isDate(String date)
  {
    try
    {
       if ((date == null) || ("".equals(date)) || (!date.matches("[0-9]{8}"))) {
         return false;
      }
       int year = Integer.parseInt(date.substring(0, 4));
       int month = Integer.parseInt(date.substring(4, 6)) - 1;
       int day = Integer.parseInt(date.substring(6));
       Calendar calendar = GregorianCalendar.getInstance();

       calendar.setLenient(false);
       calendar.set(1, year);
       calendar.set(2, month);
       calendar.set(5, day);

       calendar.get(1);
    } catch (IllegalArgumentException e) {
       return false;
    }
     return true;
  }
}

