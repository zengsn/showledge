package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.PostDao;
import com.opensymphony.xwork2.ActionSupport;
import com.po.Post;

public class PrintPostAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private Post post;

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public String execute() throws Exception {
		PostDao postDao = new PostDao();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setCharacterEncoding("UTF-8");
		List<Post> postsList = postDao.findAllPost();
		request.setAttribute("postsList", postsList);
		Boolean isPrint = true;
		request.setAttribute("isPrint", isPrint);
		String userName = "";
		userName = (String) request.getSession().getAttribute("user");
		if (userName.isEmpty()) {
			return "-";
		} else {
			return "+";
		}
	}
}
