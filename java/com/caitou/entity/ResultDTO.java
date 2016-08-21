package com.caitou.entity;

import java.io.Serializable;
import java.util.List;

import com.caitou.bean.Comment;
import com.caitou.bean.Corpus;
import com.caitou.bean.Essay;
import com.caitou.bean.Reply;
import com.caitou.bean.User;

/**
 * 用于使用ajax时返回json对象的实体类
 * 
 * @author caitou
 *
 */
@SuppressWarnings("serial")
public class ResultDTO implements Serializable {

	private boolean success;
	private String message;
	private Essay essay;
	private Comment comment;
	private Reply reply;
	private User user;
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

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
