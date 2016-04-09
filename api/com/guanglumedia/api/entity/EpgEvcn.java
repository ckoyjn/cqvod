package com.guanglumedia.api.entity;

public class EpgEvcn {
	private String evcnid;
	private String programeid;
	private String userid;
	private String operateStatus;
	private String evcnGettime;
	private String evcnOrderId;
	private String evcnOrderStatus;
	private String epkDateStart;
	private String epkDateEnd;
	private String epkPerval;
	public String getEvcnid() {
		return evcnid;
	}
	public void setEvcnid(String evcnid) {
		this.evcnid = evcnid;
	}
	public String getProgrameid() {
		return programeid;
	}
	public void setProgrameid(String programeid) {
		this.programeid = programeid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getEvcnGettime() {
		return evcnGettime;
	}
	public void setEvcnGettime(String evcnGettime) {
		this.evcnGettime = evcnGettime;
	}
	public String getEvcnOrderId() {
		return evcnOrderId;
	}
	public void setEvcnOrderId(String evcnOrderId) {
		this.evcnOrderId = evcnOrderId;
	}
	public String getEpkDateStart() {
		return epkDateStart;
	}
	public void setEpkDateStart(String epkDateStart) {
		this.epkDateStart = epkDateStart;
	}
	public String getEpkDateEnd() {
		return epkDateEnd;
	}
	public void setEpkDateEnd(String epkDateEnd) {
		this.epkDateEnd = epkDateEnd;
	}
	public String getEpkPerval() {
		return epkPerval;
	}
	public void setEpkPerval(String epkPerval) {
		this.epkPerval = epkPerval;
	}
	public String getOperateStatus() {
		return operateStatus;
	}
	public void setOperateStatus(String operateStatus) {
		this.operateStatus = operateStatus;
	}
	public String getEvcnOrderStatus() {
		return evcnOrderStatus;
	}
	public void setEvcnOrderStatus(String evcnOrderStatus) {
		this.evcnOrderStatus = evcnOrderStatus;
	}
}
