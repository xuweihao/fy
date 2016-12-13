package com.spm.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class DBUtil {
	
	private static Connection conn;
	
	public static Connection getConn(){
		
		String url = "jdbc:mysql://localhost:3306/ssq";
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void closeConn(Connection conn, PreparedStatement pstmt,
			ResultSet rs){
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}

		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {			
				e.printStackTrace();
			}
		}

		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
