package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.PostDao;
import com.opensymphony.xwork2.ActionSupport;
import com.po.Post;

public class WriterAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private Post post;
	private String message;

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String execute() throws Exception {
		PostDao postDao = new PostDao();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setCharacterEncoding("UTF-8");
		String userName = (String) request.getSession().getAttribute("user");
		post.setUserName(userName);
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		post.setPostTime(df.format(new Date()));
		Boolean result = postDao.insertPost(post);
		if (result) {
			message = post.getPostTitle();
			return "success";
		} else {
			message = "添加笔记失败了~ T T";
			return "error";
		}
	}
}
