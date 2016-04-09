package com.guanglumedia.cms.movie.entity;

public class Media {
	private String id;
	private String url;
	private String state;
	private String reason;
	
	public void setMedia(String id, String url, String state, String reason){
		this.id = id;
		this.url = url;
		this.state = state;
		this.reason = reason;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}
