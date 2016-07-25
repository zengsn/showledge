package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CommentDao;
import com.dao.PostDao;
import com.opensymphony.xwork2.ActionSupport;
import com.po.Comment;
import com.po.Post;

public class PostDetailAction extends ActionSupport {

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
		Post post2 = postDao.findOnePost(post);
		post = post2;
		printComment();
		return "success";
	}

	public void printComment() throws Exception {
		CommentDao commentDao = new CommentDao();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setCharacterEncoding("UTF-8");
		List<Comment> commentsList = commentDao.findAllComment(post);
		request.setAttribute("commentsList", commentsList);
	}
}
