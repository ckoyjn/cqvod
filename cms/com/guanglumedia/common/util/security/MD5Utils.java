package com.guanglumedia.common.util.security;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import org.apache.log4j.Logger;

public final class MD5Utils{
	private static Logger logger = Logger.getLogger(MD5Utils.class);
	private static final char[] HEX_DIGITS = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
	public static final char[] HEXDIG = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
	public static final String[] HEXDIGITS = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };
	public static String getMD5(String input){
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			return byteArrayToHexString(md.digest(input.getBytes()));
		}catch (Exception e) {
			logger.error(e.getMessage());
			return "";
		}   
	}

	public static String getMD5_16(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			return byteArrayToHexString16(md.digest(input.getBytes()));
		} catch (Exception e) {
			logger.error(e.getMessage());
			return "";
		}
		
	}

	public static String getMD5(String input, String code){
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			return byteArrayToHexString(md.digest(input.getBytes(code)));
		} catch (Exception e) {
			logger.error(e.getMessage());
			return "";
		}   
	}

	public static String getMD5File(String filename) {
		InputStream is = null;
		byte[] buffer = new byte[1024];
		int numRead = 0;
		try{
			is = new FileInputStream(filename);
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			while ((numRead = is.read(buffer)) > 0) {
				md5.update(buffer, 0, numRead);
			}
			String str = toHexString(md5.digest());
			return str;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		} finally {
			try {
				if (is != null) is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static String toHexString(byte[] b) {
		StringBuilder sb = new StringBuilder(b.length * 2);
		for (int i = 0; i < b.length; i++) {
			sb.append(HEX_DIGITS[((b[i] & 0xF0) >>> 4)]);
			sb.append(HEX_DIGITS[(b[i] & 0xF)]);
		}
		return sb.toString();
	}

	protected static String byteArrayToHexString(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			resultSb.append(byteToHexString(b[i]));
		}
		return resultSb.toString();
	}

	protected static String byteArrayToHexString16(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			resultSb.append(byteToHexString16(b[i]));
		}
		return resultSb.toString();
	}

	protected static String byteToHexString(byte b) {
		int n = b;
		if (n < 0) n += 256;
		int d1 = n / 16;
		int d2 = n % 16;
		return HEXDIGITS[d1] + HEXDIGITS[d2];
	}

	protected static String byteToHexString16(byte b) {
		int n = b;
		if (n < 0)n += 256;
		int d1 = n / 16;
		return HEXDIGITS[d1];
	}

	public static String getMD51(String s){
		try{
			byte[] strTemp = s.getBytes();
			MessageDigest mdTemp = MessageDigest.getInstance("MD5");
			mdTemp.update(strTemp);
			byte[] md = mdTemp.digest();
			int j = md.length;
			char[] str = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[(k++)] = HEXDIG[(byte0 >>> 4 & 0xF0)];
				str[(k++)] = HEXDIG[(byte0 & 0xF0)];
			}
			return new String(str);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return s;
		}
	}
}