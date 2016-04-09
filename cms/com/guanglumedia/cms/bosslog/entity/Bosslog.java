package com.guanglumedia.cms.bosslog.entity;

public class Bosslog {

	public Bosslog() {

	}

	private Integer id;
	private String smartcardid;//智能卡号
	private Integer evcnid;    //电子券号
	private String amount;	   //金额
	private Integer errcode;   //错误码
	private String msg;		   //返回信息
	private Integer type;	   //0-充入 1-撤回
	private String recordTime;
	private String startTime;
	private String stopTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSmartcardid() {
		return smartcardid;
	}

	public void setSmartcardid(String smartcardid) {
		this.smartcardid = smartcardid;
	}

	public Integer getEvcnid() {
		return evcnid;
	}

	public void setEvcnid(Integer evcnid) {
		this.evcnid = evcnid;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public Integer getErrcode() {
		return errcode;
	}

	public void setErrcode(Integer errcode) {
		this.errcode = errcode;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getStopTime() {
		return stopTime;
	}

	public void setStopTime(String stopTime) {
		this.stopTime = stopTime;
	}

	public String getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(String recordTime) {
		this.recordTime = recordTime;
	}

}
