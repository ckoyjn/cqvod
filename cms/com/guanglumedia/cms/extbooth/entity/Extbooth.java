package com.guanglumedia.cms.extbooth.entity;

import com.guanglumedia.common.util.BaseEntity;

/**
 * 专题扩展类
 * @author caokai
 */
public class Extbooth extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5147996458326277250L;
	private String title;
	private String sort;
	private String status;
	private String type;
	private String objectid;
	private String objectName;
	private String identify;
	private String imgurl;
	public Extbooth() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getObjectid() {
		return objectid;
	}
	public void setObjectid(String objectid) {
		this.objectid = objectid;
	}
	public String getObjectName() {
		return objectName;
	}
	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}
	public String getIdentify() {
		return identify;
	}
	public void setIdentify(String identify) {
		this.identify = identify;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
}
