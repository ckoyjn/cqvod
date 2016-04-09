package com.guanglumedia.common.util;
/*     */ 
/*     */ import java.io.BufferedReader;
/*     */ import java.io.DataOutputStream;
/*     */ import java.io.IOException;
/*     */ import java.io.InputStream;
/*     */ import java.io.InputStreamReader;
/*     */ import java.io.UnsupportedEncodingException;
/*     */ import java.net.HttpURLConnection;
/*     */ import java.net.MalformedURLException;
/*     */ import java.net.URL;
/*     */ import java.net.URLDecoder;
/*     */ import java.net.URLEncoder;
/*     */ import java.util.Map;
/*     */ import java.util.Map.Entry;
/*     */ 
/*     */ public class HttpUtils
/*     */ {
/*     */   private static final String API_URL = "http://www.youdao.com/smartresult-xml/search.s?type=ip&q=%s";
/*     */   private static final String CHARSET = "UTF-8";
/*     */ 
/*     */   public static String doGet(String strURL)
/*     */   {
/*  25 */     return doGet(strURL, "UTF-8");
/*     */   }
/*     */ 
/*     */   public static String doPost(String strURL, Map<String, String> map) {
/*  29 */     return doPost(strURL, map, "UTF-8");
/*     */   }
/*     */ 
/*     */   public static String doPost(String strURL, Map<String, String> map, String encoding)
/*     */   {
/*     */     try
/*     */     {
/*  36 */       URL url = new URL(strURL);
/*  37 */       return doPost(url, map, encoding); } catch (MalformedURLException e) {throw new RuntimeException(e);
/*     */     }
/*  39 */     
/*     */   }
/*     */ 
/*     */   public static String getAddressByYouDao(String ip)
/*     */   {
/*  44 */     String url = String.format("http://www.youdao.com/smartresult-xml/search.s?type=ip&q=%s", new Object[] { ip });
/*  45 */     String text = doGet(url, "GBK");
/*  46 */     int start = text.indexOf("<location>");
/*  47 */     int end = text.indexOf("</location>");
/*  48 */     if ((start < 0) || (end < 0)) {
/*  49 */       return "";
/*     */     }
/*  51 */     return text.substring(start + 10, end);
/*     */   }
/*     */ 
/*     */   public static String doGet(URL url, String encoding) {
/*  55 */     InputStream in = null;
/*  56 */     InputStreamReader insr = null;
/*  57 */     BufferedReader reader = null;
/*  58 */     HttpURLConnection conn = null;
/*     */     try
/*     */     {
/*  61 */       conn = (HttpURLConnection)url.openConnection();
/*  62 */       conn.setDoOutput(true);
/*  63 */       conn.setDoInput(true);
/*  64 */       conn.setRequestMethod("GET");
/*  65 */       conn.setRequestProperty("Connection", "Keep-Alive");
/*  66 */       conn.setRequestProperty("accept-language", "zh_CN");
/*  67 */       conn.setRequestProperty("Charset", encoding);
/*  68 */       conn.setUseCaches(false);
/*  69 */       conn.setInstanceFollowRedirects(true);
/*  70 */       conn.setRequestProperty("Content-Type", 
/*  71 */         "application/x-www-form-urlencoded");
/*  72 */       conn.connect();
/*     */ 
/*  75 */       in = conn.getInputStream();
/*  76 */       insr = new InputStreamReader(in, encoding);
/*  77 */       reader = new BufferedReader(insr);
/*  78 */       StringBuffer buff = new StringBuffer();
/*  79 */       String line = reader.readLine();
/*  80 */       while (line != null) {
/*  81 */         buff.append(line);
/*  82 */         line = reader.readLine();
/*     */       }
/*     */ 
/*  85 */       conn.disconnect();
/*  86 */       String str1 = buff.toString();
/*     */       return str1;
/*     */     } catch (IOException e) {
/*  88 */       e.printStackTrace();
/*  89 */       throw new RuntimeException(e);
/*     */     } finally {
/*     */       try {
/*  92 */         if (reader != null)
/*  93 */           reader.close();
/*     */       } catch (IOException localIOException4) {
/*     */       }
/*     */       try {
/*  97 */         if (insr != null)
/*  98 */           insr.close();
/*     */       } catch (IOException localIOException5) {
/*     */       }
/*     */       try {
/* 102 */         if (in != null)
/* 103 */           in.close();
/*     */       } catch (IOException localIOException6) {
/*     */       }
/* 106 */       if (conn != null)
/* 107 */         conn.disconnect(); 
/*     */     }
/*     */   }
/*     */ 
/*     */   public static String buildParams(Map<String, String> map) {
/* 112 */     if ((map == null) || (map.isEmpty()))
/* 113 */       return "";
/* 114 */     StringBuilder sb = new StringBuilder();
/* 115 */     int i = 0;
/* 116 */     for (Map.Entry entry : map.entrySet()) {
/* 117 */       if (i > 0)
/* 118 */         sb.append("&");
/* 119 */       sb.append((String)entry.getKey());
/* 120 */       sb.append("=");
/* 121 */       sb.append((String)entry.getValue());
/* 122 */       i++;
/*     */     }
/*     */ 
/* 125 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public static String doPost(URL url, Map<String, String> map, String encoding)
/*     */   {
/* 130 */     BufferedReader reader = null;
/* 131 */     DataOutputStream out = null;
/* 132 */     HttpURLConnection conn = null;
/*     */     try
/*     */     {
/* 136 */       conn = (HttpURLConnection)url.openConnection();
/* 137 */       conn.setDoOutput(true);
/* 138 */       conn.setDoInput(true);
/* 139 */       conn.setUseCaches(false);
/* 140 */       conn.setInstanceFollowRedirects(true);
/* 141 */       conn.setRequestMethod("POST");
/* 142 */       conn.setRequestProperty("Connection", "Keep-Alive");
/* 143 */       conn.setRequestProperty("Charset", encoding);
/* 144 */       conn.setRequestProperty("Content-Type", 
/* 145 */         "application/x-www-form-urlencoded");
/* 146 */       conn.connect();
/*     */ 
/* 149 */       if ((map != null) && (!map.isEmpty())) {
/* 150 */         out = new DataOutputStream(conn.getOutputStream());
/* 151 */         String params = buildParams(map);
/* 152 */         out.write(params.getBytes());
/* 153 */         out.flush();
/* 154 */         out.close();
/* 155 */         out = null;
/*     */       }
/*     */ 
/* 159 */       reader = new BufferedReader(
/* 160 */         new InputStreamReader(conn
/* 160 */         .getInputStream(), encoding));
/* 161 */       StringBuffer buff = new StringBuffer();
/* 162 */       String line = reader.readLine();
/* 163 */       while (line != null) {
/* 164 */         buff.append("\n" + line);
/* 165 */         line = reader.readLine();
/*     */       }
/*     */ 
/* 168 */       reader.close();
/* 169 */       reader = null;
/* 170 */       conn.disconnect();
/* 171 */       conn = null;
/* 172 */       String str1 = buff.toString();
/*     */       return str1;
/*     */     } catch (Exception e) {
/* 174 */       throw new RuntimeException(e);
/*     */     }
/*     */     finally {
/*     */       try {
/* 178 */         if (reader != null)
/* 179 */           reader.close();
/*     */       } catch (IOException localIOException3) {
/*     */       }
/*     */       try {
/* 183 */         if (out != null)
/* 184 */           out.close();
/*     */       } catch (IOException localIOException4) {
/*     */       }
/* 187 */       if (conn != null)
/* 188 */         conn.disconnect(); 
/*     */     }
/*     */   }
/*     */   public static String doPost(String strURL, String params, String encoding)
/*     */   {
	 
/* 130 */     BufferedReader reader = null;
/* 131 */     DataOutputStream out = null;
/* 132 */     HttpURLConnection conn = null;
/*     */     try
/*     */     {
				URL url = new URL(strURL);
/* 136 */       conn = (HttpURLConnection)url.openConnection();
/* 137 */       conn.setDoOutput(true);
/* 138 */       conn.setDoInput(true);
/* 139 */       conn.setUseCaches(false);
/* 140 */       conn.setInstanceFollowRedirects(true);
/* 141 */       conn.setRequestMethod("POST");
/* 142 */       conn.setRequestProperty("Connection", "Keep-Alive");
/* 143 */       conn.setRequestProperty("Charset", encoding);
/* 144 */       conn.setRequestProperty("Content-Type", 
/* 145 */         "application/x-www-form-urlencoded");
/* 146 */       conn.connect();
/*     */ 
/* 149 */       if ((params != null) && (!params.isEmpty())) {
/* 150 */         out = new DataOutputStream(conn.getOutputStream());

/* 152 */         out.write(params.getBytes());
/* 153 */         out.flush();
/* 154 */         out.close();
/* 155 */         out = null;
/*     */       }
/*     */ 
/* 159 */       reader = new BufferedReader(
/* 160 */         new InputStreamReader(conn
/* 160 */         .getInputStream(), encoding));
/* 161 */       StringBuffer buff = new StringBuffer();
/* 162 */       String line = reader.readLine();
/* 163 */       while (line != null) {
/* 164 */         buff.append("\n" + line);
/* 165 */         line = reader.readLine();
/*     */       }
/*     */ 
/* 168 */       reader.close();
/* 169 */       reader = null;
/* 170 */       conn.disconnect();
/* 171 */       conn = null;
/* 172 */       String str1 = buff.toString();
/*     */       return str1;
/*     */     } catch (Exception e) {
/* 174 */       throw new RuntimeException(e);
/*     */     }
/*     */     finally {
/*     */       try {
/* 178 */         if (reader != null)
/* 179 */           reader.close();
/*     */       } catch (IOException localIOException3) {
/*     */       }
/*     */       try {
/* 183 */         if (out != null)
/* 184 */           out.close();
/*     */       } catch (IOException localIOException4) {
/*     */       }
/* 187 */       if (conn != null)
/* 188 */         conn.disconnect(); 
/*     */     }
/*     */   }
/*     */   public static final String doGet(String strURL, String encoding) {
/*     */     try {
/* 194 */       URL url = new URL(strURL);
/* 195 */       return doGet(url, encoding);
/*     */     } catch (MalformedURLException e) {
/* 197 */       e.printStackTrace();throw new RuntimeException(e);
/* 198 */     }
/*     */   }
/*     */ 
/*     */   public static final String encode(String param)
/*     */   {
/* 204 */     return encode(param, "UTF-8");
/*     */   }
/*     */ 
/*     */   public static final String decode(String param) {
/* 208 */     return decode(param, "UTF-8");
/*     */   }
/*     */ 
/*     */   public static final String encode(String param, String encoding) {
/*     */     try {
/* 213 */       return URLEncoder.encode(param, encoding); } catch (UnsupportedEncodingException e) {throw new RuntimeException(e);
/*     */     }
/* 215 */     
/*     */   }
/*     */ 
/*     */   public static final String decode(String param, String encoding)
/*     */   {
/*     */     try {
/* 221 */       return URLDecoder.decode(param, encoding); } catch (UnsupportedEncodingException e) {throw new RuntimeException(e);
/*     */     }
/* 223 */     
/*     */   }
/*     */ }

/* Location:           C:\Users\wengshaojie\Desktop\com.zip
 * Qualified Name:     com.xs.ott.common.util.ip.HttpUtils
 * JD-Core Version:    0.6.0
 */