package com.caitou.dto;

import java.io.Serializable;
import java.util.List;


public class DataBean<T,E> implements Serializable{
	
	private T t;
	private E e;
	public T getT() {
		return t;
	}
	public void setT(T t) {
		this.t = t;
	}
	public E getE() {
		return e;
	}
	public void setE(E e) {
		this.e = e;
	}
	@Override
	public String toString() {
		return "DataBean [t=" + t + ", e=" + e + "]";
	}
	public DataBean(T t, E e) {
		super();
		this.t = t;
		this.e = e;
	}
	public DataBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}























