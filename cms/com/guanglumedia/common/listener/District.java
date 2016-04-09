package com.guanglumedia.common.listener;

import java.io.Serializable;

public class District implements Serializable {
	private static final long serialVersionUID = 2379437775267981054L;
	private int id;
	private String name;
	private int level;
	private String areacode;
	private String postcode;
	private int upid;
	private int displayorder;

	public int getDisplayorder(){
		return this.displayorder;
	}
	public void setDisplayorder(int displayorder) {
		this.displayorder = displayorder;
	}
	public int getId() {
		return this.id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
	  this.name = name;
	}
	public int getLevel() {
		return this.level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getAreacode() {
		return this.areacode;
	}
	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}
	public String getPostcode() {
		return this.postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public int getUpid() {
		return this.upid;
	}
	public void setUpid(int upid) {
		this.upid = upid;
	}
}