package com.caitou.bean;

import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.transaction.annotation.EnableTransactionManagement;

@Table(name="t_kmap")
public class KMap {

	@Id
	@GeneratedValue(generator="JDBC")
	private Integer id;
	private Integer userId;
	
	private String kmapName; // 知识地图名称
	private String kmapFormat; // 知识地图数据格式声明
	private String kmapData; // 知识地图数据内容
	private String kmapDescribe; // 知识地图描述
	private Integer kmapLikeNumber; // 知识地图喜欢数
	private Integer kmapLookNumber; // 知识地图浏览数
	
	@Transient
	private boolean isLike; // 是否已经添加喜欢
	
	@Transient
	private User user;
	
	@Transient
	private List<KmapKeyWord> keyWordList;
	
	
	
	

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

	public Integer getKmapLikeNumber() {
		return kmapLikeNumber;
	}

	public void setKmapLikeNumber(Integer kmapLikeNumber) {
		this.kmapLikeNumber = kmapLikeNumber;
	}

	public Integer getKmapLookNumber() {
		return kmapLookNumber;
	}

	public void setKmapLookNumber(Integer kmapLookNumber) {
		this.kmapLookNumber = kmapLookNumber;
	}

	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<KmapKeyWord> getKeyWordList() {
		return keyWordList;
	}

	public void setKeyWordList(List<KmapKeyWord> keyWordList) {
		this.keyWordList = keyWordList;
	}

	@Override
	public String toString() {
		return "KMap [id=" + id + ", userId=" + userId + ", kmapName=" + kmapName + ", kmapFormat=" + kmapFormat
				+ ", kmapData=" + kmapData + ", kmapDescribe=" + kmapDescribe + ", kmapLikeNumber=" + kmapLikeNumber
				+ ", kmapLookNumber=" + kmapLookNumber + ", isLike=" + isLike + "]";
	}

	public KMap(Integer id, Integer userId, String kmapName, String kmapFormat, String kmapData, String kmapDescribe,
			Integer kmapLikeNumber, Integer kmapLookNumber, boolean isLike) {
		super();
		this.id = id;
		this.userId = userId;
		this.kmapName = kmapName;
		this.kmapFormat = kmapFormat;
		this.kmapData = kmapData;
		this.kmapDescribe = kmapDescribe;
		this.kmapLikeNumber = kmapLikeNumber;
		this.kmapLookNumber = kmapLookNumber;
		this.isLike = isLike;
	}

	public KMap() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
