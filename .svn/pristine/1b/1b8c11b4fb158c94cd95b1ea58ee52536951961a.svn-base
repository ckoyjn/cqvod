package com.guanglumedia.util;

public class VideoFormatUtils {
	
	
	
	public static String Format2Encode(String format){
		String[] mpeg2 = {".mpg",".mpe",".mpeg",".m2v",".vob",".tp",".ts"};
		String[] h264 = {".3gp",".avi",".mkv",".flv"};
		for(String str : mpeg2){
			if(str.equalsIgnoreCase(format.trim())){
				return "MPEG-2";
			}
		}
		for(String str : h264){
			if(str.equalsIgnoreCase(format.trim())){
				return "H.264";
			}
		}
		return "NoSupport";
	}
	
//	public static void main(String[] args) {
//		String format = ".MpE";
//		System.out.println(VideoFormatUtils.Format2Encode(format));
//	}

}
