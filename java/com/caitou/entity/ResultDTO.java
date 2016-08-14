package com.caitou.entity;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class ResultDTO implements Serializable {

	private boolean success;
	private String message;
	private Essay essay;
	private List<Essay> essayList;
	private List<Corpus> corpusList;
	private List<User> userList;

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

	public List<Corpus> getCorpusList() {
		return corpusList;
	}

	public void setCorpusList(List<Corpus> corpusList) {
		this.corpusList = corpusList;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
}
