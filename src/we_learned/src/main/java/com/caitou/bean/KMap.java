package com.caitou.bean;

public class KMap {

	private int id;
	private int userId;
	private String kmapName; // 知识地图名称
	private String kmapFormat; // 知识地图数据格式声明
	private String kmapData; // 知识地图数据内容
	private String kmapDescribe; // 知识地图描述

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getKmapName() {
		return kmapName;
	}

	public void setKmapName(String kmapName) {
		this.kmapName = kmapName;
	}

	public String getKmapFormat() {
		return kmapFormat;
	}

	public void setKmapFormat(String kmapFormat) {
		this.kmapFormat = kmapFormat;
	}

	public String getKmapData() {
		return kmapData;
	}

	public void setKmapData(String kmapData) {
		this.kmapData = kmapData;
	}

	public String getKmapDescribe() {
		return kmapDescribe;
	}

	public void setKmapDescribe(String kmapDescribe) {
		this.kmapDescribe = kmapDescribe;
	}
}
