package com.caitou.entity;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class ResultDTO implements Serializable {

	private boolean success;
	private String message;
	private Essay essay;
	private List<Essay> essayList;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Essay getEssay() {
		return essay;
	}

	public void setEssay(Essay essay) {
		this.essay = essay;
	}

	public List<Essay> getEssayList() {
		return essayList;
	}

	public void setEssayList(List<Essay> essayList) {
		this.essayList = essayList;
	}
}
