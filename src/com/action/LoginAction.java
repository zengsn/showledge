package com.action;

import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.po.User;

public class LoginAction extends ActionSupport{

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
		User user2 = userDao.findUserByName(user);
		if (user2 != null) {
			if (user2.getPassword().equals(user.getPassword())) {
				message = "登录成功！ (●'◡'●)";
				return "success";
			}
			message = "登录失败了~ T T";
			return "error";
		} else {
			message = "登录失败了~ T T";
			return "error";
		}
	}
}
