package com.guanglumedia.cms.admin.entity;

public class Right {
	private int id;
	private String RightName;
	private String RightDesc;
	private String RightAction;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRightName() {
		return RightName;
	}
	public void setRightName(String rightName) {
		RightName = rightName;
	}
	public String getRightDesc() {
		return RightDesc;
	}
	public void setRightDesc(String rightDesc) {
		RightDesc = rightDesc;
	}
	public String getRightAction() {
		return RightAction;
	}
	public void setRightAction(String rightAction) {
		RightAction = rightAction;
	}
	
}
