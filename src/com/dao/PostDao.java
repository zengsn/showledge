package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DbConnect;
import com.po.Post;

public class PostDao {
	protected static final String FIELDS_INSERT = "userName,postTitle,postContent,postTime,wordsNumber";
	protected static final String INSERT_SQL = "insert into post("
			+ FIELDS_INSERT + ")" + "values (?,?,?,?,?)";
	protected static final String SELECT_SQL = "select * from post";
	protected static final String SELECT_PASSAGE_BY_USERNAME_SQL = "select * from post where userName = ?";
	protected static final String SELECT_PASSAGE_BY_POSTNAME_AND_POSTTIME_SQL = "select * from post where postTitle = ? and postTime = ?";

	public boolean insertPost(Post post) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DbConnect.getDBconnection();
			pstmt = conn.prepareStatement(INSERT_SQL);
			pstmt.setString(1, post.getUserName());
			pstmt.setString(2, post.getPostTitle());
			pstmt.setString(3, post.getPostContent());
			pstmt.setString(4, post.getPostTime());
			char[] t1 = post.getPostContent().toCharArray();
			int t0 = t1.length;
			int count = 0;
			for (int i = 0; i < t0; i++) {
				if (Character.toString(t1[i]).matches("[\\u4E00-\\u9FA5]+")) {
					count++;
				}
			}
			pstmt.setString(5, String.valueOf(count));
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DbConnect.closeDB(conn, pstmt, rs);
		}
	}

	public List<Post> findAllPost() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Post> postsList = new ArrayList<Post>();
		Post post = null;
		try {
			conn = DbConnect.getDBconnection();
			pstmt = conn.prepareStatement(SELECT_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				post = new Post();
				post.setUserName(rs.getString(1));
				post.setPostTitle(rs.getString(2));
				post.setPostContent(rs.getString(3));
				post.setPostTime(rs.getString(4));
				post.setReadingsNumber(rs.getString(5));
				post.setCommentsNumber(rs.getString(6));
				post.setGoodsNumber(rs.getString(7));
				post.setWordsNumber(rs.getString(8));
				postsList.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnect.closeDB(conn, pstmt, rs);
		}
		return postsList;
	}

	public List<Post> findPostByUserName(Post post) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Post> postsList = new ArrayList<Post>();
		Post post2 = null;
		try {
			conn = DbConnect.getDBconnection();
			pstmt = conn.prepareStatement(SELECT_PASSAGE_BY_USERNAME_SQL);
			pstmt.setString(1, post.getUserName());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				post2 = new Post();
				post2.setUserName(rs.getString(1));
				post2.setPostTitle(rs.getString(2));
				post2.setPostContent(rs.getString(3));
				post2.setPostTime(rs.getString(4));
				post2.setReadingsNumber(rs.getString(5));
				post2.setCommentsNumber(rs.getString(6));
				post2.setGoodsNumber(rs.getString(7));
				post2.setWordsNumber(rs.getString(8));
				postsList.add(post2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnect.closeDB(conn, pstmt, rs);
		}
		return postsList;
	}

	public Post findOnePost(Post post) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Post post2 = null;
		try {
			conn = DbConnect.getDBconnection();
			pstmt = conn
					.prepareStatement(SELECT_PASSAGE_BY_POSTNAME_AND_POSTTIME_SQL);
			pstmt.setString(1, post.getPostTitle());
			pstmt.setString(2, post.getPostTime());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				post2 = new Post();
				post2.setUserName(rs.getString(1));
				post2.setPostTitle(rs.getString(2));
				post2.setPostContent(rs.getString(3));
				post2.setPostTime(rs.getString(4));
				post2.setReadingsNumber(rs.getString(5));
				post2.setCommentsNumber(rs.getString(6));
				post2.setGoodsNumber(rs.getString(7));
				post2.setWordsNumber(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnect.closeDB(conn, pstmt, rs);
		}
		return post2;
	}
}
