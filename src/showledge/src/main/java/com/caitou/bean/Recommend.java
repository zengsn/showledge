package com.caitou.bean;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Table(name="t_rec")
public class Recommend implements Serializable {

	@Id
	@GeneratedValue(generator="JDBC")
	private Integer userId;
	
	@Id
	@GeneratedValue(generator="JDBC")
	private Integer comUserId;

	private Integer grade;
	
	

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getComUserId() {
		return comUserId;
	}

	public void setComUserId(Integer comUserId) {
		this.comUserId = comUserId;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Recommend [userId=" + userId + ", comUserId=" + comUserId + ", grade=" + grade + "]";
	}

	public Recommend(Integer userId, Integer comUserId, Integer grade) {
		super();
		this.userId = userId;
		this.comUserId = comUserId;
		this.grade = grade;
	}

	public Recommend() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}






































