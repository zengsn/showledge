package com.caitou.bean;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="t_favourite")
public class Favourite implements Serializable {

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
		return "Favourite [essayId=" + essayId + ", userId=" + userId + "]";
	}

	public Favourite(int essayId, int userId) {
		super();
		this.essayId = essayId;
		this.userId = userId;
	}

	public Favourite() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
