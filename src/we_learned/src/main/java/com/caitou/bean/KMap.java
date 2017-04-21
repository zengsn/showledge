package com.caitou.bean;

public class KMap {

	private int id;
	private int userId;
	private String kmapName; // 知识地图名称
	private String kmapFormat; // 知识地图数据格式声明
	private String kmapData; // 知识地图数据内容
	private String kmapDescribe; // 知识地图描述
	private int kmapLikeNumber; // 知识地图喜欢数
	private int kmapLookNumber; // 知识地图浏览数
	private boolean isLike; // 是否已经添加喜欢

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

	public int getKmapLikeNumber() {
		return kmapLikeNumber;
	}

	public void setKmapLikeNumber(int kmapLikeNumber) {
		this.kmapLikeNumber = kmapLikeNumber;
	}

	public int getKmapLookNumber() {
		return kmapLookNumber;
	}

	public void setKmapLookNumber(int kmapLookNumber) {
		this.kmapLookNumber = kmapLookNumber;
	}

	public boolean getIsLike() {
		return isLike;
	}

	public void setIsLike(boolean isLike) {
		this.isLike = isLike;
	}
}
