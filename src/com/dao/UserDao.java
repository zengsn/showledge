package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DbConnect;
import com.po.User;

public class UserDao {

	protected static final String FIELDS_INSERT = "name,password,email";
	protected static final String INSERT_SQL = "insert into user_info("
			+ FIELDS_INSERT + ")" + "values (?,?,?)";
	protected static final String SELECT_SQL = "select " + FIELDS_INSERT
			+ " from user_info where name = ?";

	public boolean insertUser(User user) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DbConnect.getDBconnection();
			pstmt = conn.prepareStatement(INSERT_SQL);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DbConnect.closeDB(conn, pstmt, rs);
		}
	}

	public User findUserByName(User user) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user2 = null;
		try {
			conn = DbConnect.getDBconnection();
			pstmt = conn.prepareStatement(SELECT_SQL);
			pstmt.setString(1, user.getName());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user2 = new User();
				user2.setName(rs.getString(1));
				user2.setPassword(rs.getString(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbConnect.closeDB(conn, pstmt, rs);
		}
		return user2;
	}
}
