package com.caitou.bean;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;




@Table(name="t_kmap_kword")
public class KmapKeyWord implements Serializable {
	
	@Id
	@GeneratedValue(generator="JDBC")
	private Integer id;
	
	private Integer kmapId;
	
	private String keyWord;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getKmapId() {
		return kmapId;
	}

	public void setKmapId(Integer kmapId) {
		this.kmapId = kmapId;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	@Override
	public String toString() {
		return "KmapKeyWord [id=" + id + ", kmapId=" + kmapId + ", keyWord=" + keyWord + "]";
	}

	public KmapKeyWord(Integer id, Integer kmapId, String keyWord) {
		super();
		this.id = id;
		this.kmapId = kmapId;
		this.keyWord = keyWord;
	}

	public KmapKeyWord() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
