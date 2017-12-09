package com.caitou.bean;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;



@Table(name="t_dyn_essay")
public class DynEssay implements Serializable {
	
	@Id
	@GeneratedValue(generator="JDBC")
	private Integer dynId;
	@Id
	@GeneratedValue(generator="JDBC")
	private Integer essayId;
	
	
	public Integer getDynId() {
		return dynId;
	}
	public void setDynId(Integer dynId) {
		this.dynId = dynId;
	}
	public Integer getEssayId() {
		return essayId;
	}
	public void setEssayId(Integer essayId) {
		this.essayId = essayId;
	}
	@Override
	public String toString() {
		return "DunEssay [dynId=" + dynId + ", essayId=" + essayId + "]";
	}
	public DynEssay(Integer dynId, Integer essayId) {
		super();
		this.dynId = dynId;
		this.essayId = essayId;
	}
	public DynEssay() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}








