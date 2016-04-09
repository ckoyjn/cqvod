package com.guanglumedia.cms.analysis.entity;
public class AccessCategory{
	private String action;
	private String name;
	private String starttime;
	private String endtime;
	private String counter;
	private String maxtime;
	
	private String userId;
	private String mediaId;
	private String recordTime;
	private String type;
	private String medianame;
	
	public String getMedianame() {
		return medianame;
	}
	public void setMedianame(String medianame) {
		this.medianame = medianame;
	}
	private String showtype;
	
	public String getShowtype() {
		return showtype;
	}
	public void setShowtype(String showtype) {
		this.showtype = showtype;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getCounter() {
		return counter;
	}
	public void setCounter(String counter) {
		this.counter = counter;
	}
	public String getMaxtime() {
		return maxtime;
	}
	public void setMaxtime(String maxtime) {
		this.maxtime = maxtime;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMediaId() {
		return this.mediaId;
	}
	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
	}
	public String getRecordTime() {
		return recordTime;
	}
	public void setRecordTime(String recordTime) {
		this.recordTime = recordTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
