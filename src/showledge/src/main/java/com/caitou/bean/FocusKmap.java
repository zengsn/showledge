package com.caitou.bean;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;




@Table(name="t_focus_kmap")
public class FocusKmap {

	@Id
	@GeneratedValue(generator="JDBC")
	private int userId;
	@Id
	@GeneratedValue(generator="JDBC")
	private int kmapId;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getKmapId() {
		return kmapId;
	}
	public void setKmapId(int kmapId) {
		this.kmapId = kmapId;
	}
	@Override
	public String toString() {
		return "FocusKmap [userId=" + userId + ", kmapId=" + kmapId + "]";
	}
	public FocusKmap(int userId, int kmapId) {
		super();
		this.userId = userId;
		this.kmapId = kmapId;
	}
	public FocusKmap() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
















