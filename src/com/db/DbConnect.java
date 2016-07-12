package com.db;

import java.sql.*;

public class DbConnect {
	private static String driverName = "com.mysql.jdbc.Driver";
	private static String userName = "root";
	private static String userPwd = "root";
	private static String dbName = "we_learned";

	public static Connection getDBconnection() {
		String url1 = "jdbc:mysql://localhost/" + dbName;
		String url2 = "?user=" + userName + "&password=" + userPwd;
		String url3 = "&useUnicode=true&characterEncoding=UTF-8";
		String url = url1 + url2 + url3;
		try {
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url);
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void closeDB(Connection conn, PreparedStatement pstmt,
			ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

