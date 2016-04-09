package com.guanglumedia.cms.admin.entity;

import java.io.Serializable;

import com.guanglumedia.common.listener.District;
import com.guanglumedia.common.listener.DistrictCache;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String ID;
	private String LoginName;
	private String Password;
	private String Sex;
	private String NickName;
	private String Status;
	private String City;
	private String GroupID;
	private String GroupName;
	private String Phone;
	private String CreateTime;
	private String userID;
	
	public String getUserID() {
        return userID;
    }
    public void setUserID(String userID) {
        this.userID = userID;
    }
    public String getGroupName() {
		return GroupName;
	}
	public void setGroupName(String groupName) {
		GroupName = groupName;
	}
	public String getID() {
		return this.ID;
	}
	public void setID(String userID) {
		this.ID = userID;
	}
	public String getLoginName() {
		return this.LoginName;
	}
	public void setLoginName(String loginName) {
		LoginName = loginName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getGroupID() {
		return GroupID;
	}
	public void setGroupID(String groupID) {
		GroupID = groupID;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public String getNickName() {
		return NickName;
	}
	public void setNickName(String nickName) {
		NickName = nickName;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getCityName(){
		District dic = DistrictCache.getCityByAreaCode(this.City);
		if (dic != null) {
			return dic.getName();
		}
		return "未知";
	}
	public int getProvinID(){
		District dic = DistrictCache.getCityByAreaCode(this.City);
		if (dic != null) {
			return dic.getUpid();
		}
		return 0;
	}
}
