package com.caitou.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.annotation.Generated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


/**
 * 动态
 * 
 * @author _wind
 *
 */


@Table(name="t_dynamic")
public class Dynamic implements Serializable {

	@Id
	@GeneratedValue(generator="JDBC")
	private Integer id;
	
	private Integer userId;
	private Date time;
	private String mood;
	private String content;
	
	@Transient
	private List<Essay> essayList;
	
	@Transient
	private List<DynData> dynDataList;
	
	@Transient
	private User user;

	@Transient
	private String formatTime;
	

	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public Integer getUserId() {
		return userId;
	}



	public void setUserId(Integer userId) {
		this.userId = userId;
	}



	public Date getTime() {
		return time;
	}



	public void setTime(Date time) {
		this.time = time;
	}



	public String getMood() {
		return mood;
	}



	public void setMood(String mood) {
		this.mood = mood;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public List<Essay> getEssayList() {
		return essayList;
	}



	public void setEssayList(List<Essay> essayList) {
		this.essayList = essayList;
	}



	public List<DynData> getDynDataList() {
		return dynDataList;
	}



	public void setDynDataList(List<DynData> dynDataList) {
		this.dynDataList = dynDataList;
	}


	

	public String getFormatTime() {
		return formatTime;
	}



	public void setFormatTime(String formatTime) {
		this.formatTime = formatTime;
	}



	@Override
	public String toString() {
		return "Dynamic [id=" + id + ", userId=" + userId + ", time=" + time + ", mood=" + mood + ", content=" + content
				+ ", essayList=" + essayList + ", dynDataList=" + dynDataList + ", user=" + user + "]";
	}



	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Dynamic(Integer id, Integer user_id, Date time, String mood, String content, List<Essay> essayList,
			List<DynData> dynDataList) {
		super();
		this.id = id;
		this.userId = user_id;
		this.time = time;
		this.mood = mood;
		this.content = content;
		this.essayList = essayList;
		this.dynDataList = dynDataList;
	}

	public Dynamic(Integer id, Integer user_id, Date time, String mood, String content) {
		super();
		this.id = id;
		this.userId = user_id;
		this.time = time;
		this.mood = mood;
		this.content = content;
	}

	public Dynamic() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}















