package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DbConnect;
import com.po.Comment;
import com.po.Post;

public class CommentDao {

	protected static final String INSERT_SQL = "insert into comment(userName,postTitle,postTime,discussantName,commentTime,commentContent,buildingNumber)"
			+ "values (?,?,?,?,?,?,?)";
	protected static final String SELECT_BUILDINGNUMBAER_SQL = "select (buildingNumber) from comment where userName = ? and postTitle = ? and postTime = ?";
	protected static final String SELECT_SQL = "select * from comment where userName = ? and postTitle = ? and postTime = ?";

	public boolean insertComment(Comment comment) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DbConnect.getDBconnection();
			pstmt = conn.prepareStatement(INSERT_SQL);
			pstmt.setString(1, comment.getUserName());
			pstmt.setString(2, comment.getPostTitle());
			pstmt.setString(3, comment.getPostTime());
			pstmt.setString(4, comment.getDiscussantName());
			pstmt.setString(5, comment.getCommentTime());
			pstmt.setString(6, comment.getCommentContent());
			pstmt.setString(7, comment.getBuildingNumber());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DbConnect.closeDB(conn, pstmt, rs);
		}
	}

	public String selectBuildingNumberInComment(Comment comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DbConnect.getDBconnection();
			pstmt = conn.prepareStatement(SELECT_BUILDINGNUMBAER_SQL);
			pstmt.setString(1, comment.getUserName());
			pstmt.setString(2, comment.getPostTitle());
			pstmt.setString(3, comment.getPostTime());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			DbConnect.closeDB(conn, pstmt, rs);
		}
	}

	public List<Comment> findAllComment(Post post) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Comment> commentsList = new ArrayList<Comment>();
		Comment comment = null;
		try {
			conn = DbConnect.getDBconnection();
			pstmt = conn.prepareStatement(SELECT_SQL);
			pstmt.setString(1, post.getUserName());
			pstmt.setString(2, post.getPostTitle());
			pstmt.setString(3, post.getPostTime());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				comment = new Comment();
				comment.setUserName(rs.getString(1));
				comment.setPostTitle(rs.getString(2));
				comment.setPostTime(rs.getString(3));
				comment.setDiscussantName(rs.getString(4));
				comment.setCommentTime(rs.getString(5));
				comment.setCommentContent(rs.getString(6));
				comment.setBuildingNumber(rs.getString(7));
				comment.setReplyName(rs.getString(8));
				comment.setReplyTime(rs.getString(9));
				comment.setReplyContent(rs.getString(10));
				commentsList.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnect.closeDB(conn, pstmt, rs);
		}
		return commentsList;
	}
}
