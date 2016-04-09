package com.guanglumedia.cms.common;

/**
 * 华为VOD通知媒资系统后的返回信息
 * success - 通知消息的结果：true-成功；false-失败。
 * description - 如果操作结果不为true，则媒资需要填充原因后返回。
 *
 */
public class ParaOut {
	
	private boolean success;
	private String description;
	
	
	public ParaOut(boolean success, String description) {
		this.success = success;
		this.description = description;
	}
	
	public ParaOut(boolean success) {
		this.success = success;
	}

	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public static ParaOut success() {
		return new ParaOut(true);
	}

	public static ParaOut fail(String description) {
		return new ParaOut(false, description);
	}

}
