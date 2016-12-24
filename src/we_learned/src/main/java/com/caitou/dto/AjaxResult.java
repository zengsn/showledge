package com.caitou.dto;

public class AjaxResult<T> {

	private boolean success; // 标识请求是否成功
	private T data; // 存放返回给ajax的数据
	private String error; // 存放错误信息

	public AjaxResult(boolean success) {
		super();
		this.success = success;
	}

	public AjaxResult(boolean success, T data) {
		super();
		this.success = success;
		this.data = data;
	}

	public AjaxResult(boolean success, String error) {
		super();
		this.success = success;
		this.error = error;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

}
