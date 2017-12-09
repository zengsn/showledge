package com.caitou.bean;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;



@Table(name="t_dyndata")
public class DynData {
	
	@Id
	@GeneratedValue(generator="JDBC")
	private Integer id;
	private String url;
	private String title;
	private Integer dynId;
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getDynId() {
		return dynId;
	}
	public void setDynId(Integer dynId) {
		this.dynId = dynId;
	}
	@Override
	public String toString() {
		return "DynData [id=" + id + ", url=" + url + ", title=" + title + ", dynId=" + dynId + "]";
	}
	public DynData(Integer id, String url, String title, Integer dynId) {
		super();
		this.id = id;
		this.url = url;
		this.title = title;
		this.dynId = dynId;
	}
	public DynData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}























