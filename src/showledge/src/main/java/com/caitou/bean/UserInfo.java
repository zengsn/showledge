package com.caitou.bean;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用户信息表
 * 
 * @author _wind
 *
 */

@Table(name="t_user_info")
public class UserInfo implements Serializable {
	
	@Id
	@GeneratedValue(generator="JDBC")
	private int id;
	private int sex;
	private String introduction;
	private String location;
	private String academy;
	private String site;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAcademy() {
		return academy;
	}
	public void setAcademy(String academy) {
		this.academy = academy;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", sex=" + sex + ", introduction=" + introduction + ", location=" + location
				+ ", academy=" + academy + ", site=" + site + "]";
	}
	public UserInfo(int id, int sex, String introduction, String location, String academy, String site) {
		super();
		this.id = id;
		this.sex = sex;
		this.introduction = introduction;
		this.location = location;
		this.academy = academy;
		this.site = site;
	}
	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	

}














