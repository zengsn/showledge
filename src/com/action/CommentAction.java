package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CommentDao;
import com.opensymphony.xwork2.ActionSupport;
import com.po.Comment;
import com.po.Post;

public class CommentAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private Post post;
	private Comment comment;

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public String addComment() throws Exception {
		CommentDao commentDao = new CommentDao();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setCharacterEncoding("UTF-8");
		String discussantName = (String) request.getSession().getAttribute(
				"user");
		comment.setUserName(post.getUserName());
		comment.setPostTime(post.getPostTime());
		comment.setPostTitle(post.getPostTitle());
		comment.setDiscussantName(discussantName);
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		comment.setCommentTime(df.format(new Date()));
		/*
		 * String buildingNumber = ""; buildingNumber =
		 * commentDao.selectBuildingNumberInComment(comment); if
		 * (buildingNumber.isEmpty()) { buildingNumber = "1";
		 * comment.setBuildingNumber(buildingNumber); } else {
		 * comment.setBuildingNumber(String.valueOf((Integer
		 * .parseInt(buildingNumber) + 1))); }
		 */
		comment.setBuildingNumber("1");
		Boolean result = commentDao.insertComment(comment);
		if (result) {
			printComment();
			return "success";
		} else {
			return "error";
		}
	}

	public String addInnerComment() {
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
