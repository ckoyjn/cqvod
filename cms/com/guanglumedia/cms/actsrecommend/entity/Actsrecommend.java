package com.guanglumedia.cms.actsrecommend.entity;

import com.guanglumedia.common.util.BaseEntity;

/**
 * 活动推荐类
 * @author caokai
 */
public class Actsrecommend extends BaseEntity{
	private static final long serialVersionUID = -8129027861587238515L;
	private String title;//标题
	private String identify;//图片标识
	private String imgUrl;//图片地址
	private String moduleCount;//标题模块数（1-5）
	private String contentCount;//模块内容数（1-5）
	private String moduleTitles;//模块标题集合
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Actsrecommend() {
		super();
	}
	public String getModuleCount() {
		return moduleCount;
	}
	public void setModuleCount(String moduleCount) {
		this.moduleCount = moduleCount;
	}
	public String getContentCount() {
		return contentCount;
	}
	public void setContentCount(String contentCount) {
		this.contentCount = contentCount;
	}

	public String getModuleTitles() {
		return moduleTitles;
	}

	public void setModuleTitles(String moduleTitles) {
		this.moduleTitles = moduleTitles;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getIdentify() {
		return identify;
	}
	public void setIdentify(String identify) {
		this.identify = identify;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
}
