package com.guanglumedia.api.utils;

import java.io.UnsupportedEncodingException;

public class EncodingConv {
	public static String conv(String str, String from, String to) throws UnsupportedEncodingException{
		String utf8 = new String(str.getBytes(from));  
		String unicode = new String(utf8.getBytes(),from);   
		String gbk = new String(unicode.getBytes(to));  
		return gbk;
	}
}
