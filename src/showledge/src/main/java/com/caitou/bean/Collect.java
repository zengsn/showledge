package com.caitou.bean;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="t_collect")
public class Collect {

	@Id
	@GeneratedValue(generator="JDBC")
	private int essayId;
	@Id
	@GeneratedValue(generator="JDBC")
	private int userId;
	
	public int getEssayId() {
		return essayId;
	}
	public void setEssayId(int essayId) {
		this.essayId = essayId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Collect [essayId=" + essayId + ", userId=" + userId + "]";
	}
	public Collect(int essayId, int userId) {
		super();
		this.essayId = essayId;
		this.userId = userId;
	}
	public Collect() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	
}
