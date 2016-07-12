package com.action;

import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.po.User;

public class RegisterAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private User user;
	private String message;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String execute() throws Exception {
		UserDao userDao = new UserDao();
		Boolean result = userDao.insertUser(user);
		if (result) {
			message = "注册成功！ (●'◡'●)";
			return "success";
		} else {
			message = "注册失败了~ T T";
			return "error";
		}
	}
}
