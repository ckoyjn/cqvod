package com.guanglumedia.util;

public class SequenceUtil {
	private static SequenceUtil sequenceUtil = null;

	private SequenceUtil() {

	}

	public static SequenceUtil getInstance() {
		if (sequenceUtil == null) {
			sequenceUtil = new SequenceUtil();
		}
		return sequenceUtil;
	}

	public String getKey(long oldKey, int unit) {
		String returnval = "";
		String oldStr = String.valueOf(oldKey) == null ? "" : String
				.valueOf(oldKey);
		if (oldStr.length() >= unit) {
			returnval = oldStr;
		} else {
			String fillStr = "10000000000000000000000000000000";// 最多填充32位
			returnval = fillStr.substring(0, unit - oldStr.length()) + oldStr;
		}
		return returnval;
	}

	/**
	 * 
	 * @param sn 序列号
	 * @param flag 10^flag 张数
	 * @return
	 */
	public long get8BKey(long sn,int flag)
	{
		String snStr=String.valueOf(sn);
		long key=500;
		//除了第一位以外所有的位反转
		long snTail=Long.parseLong(new StringBuffer(snStr.substring(1)).reverse().toString());
		long snHead=Long.parseLong(snStr.substring(0,1))*((int)Math.pow(10,snStr.length()-1));
		long sb=snHead+(key^snTail);
		return sb;
	}
	public long get10BKey(long sn,int flag)
    {
        String snStr=String.valueOf(sn);
        long key=500;
        //除了第一位以外所有的位反转
        long snTail=Long.parseLong(new StringBuffer(snStr.substring(1)).reverse().toString());
        long snHead=Long.parseLong(snStr.substring(0,1))*((int)Math.pow(10,snStr.length()-1))*100;
        long sb=snHead+(key^snTail);
        return sb;
    }
}
