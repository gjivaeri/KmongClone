package com.kmong.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConnectionDBCP {
	
	private static DbConnectionDBCP instance;
	
	private DbConnectionDBCP() {
	}
	
	public static DbConnectionDBCP getInstance() {
		if (instance == null) {
			instance = new DbConnectionDBCP();
		}
		return instance;
	}
	
	public Connection getConn()  {
		Connection con = null;
		Context ctx = null;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/kmong");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	@Deprecated
	public void dbClose(ResultSet rs, Statement stmt, Connection con) throws SQLException {
		if (rs != null) {rs.close();}
		if (stmt != null) {stmt.close();}
		if (con != null) {
			System.out.println("con close");
			con.close();}
	}
	
}
