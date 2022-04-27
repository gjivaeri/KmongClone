package com.kmong.dao.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kmong.dao.DbConnectionDBCP;

public class LoginDAO {

	private static LoginDAO lDAO;
	
	private LoginDAO()  {
		
	}
	
	
	public static LoginDAO getInstance(){
		if(lDAO==null) {
			lDAO=new LoginDAO();
		}//end if
		return lDAO;
	}//getInstance
	
	
	public boolean selectLoginInfo(String email,String pass) throws SQLException{
		boolean result=false;
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String selectEmail="select email from member where password=? and email=? and withdrawal_status='N'";

		PreparedStatement pstmt=con.prepareStatement(selectEmail);
		pstmt.setString(1, pass);
		pstmt.setString(2, email);
		ResultSet rs=pstmt.executeQuery();
		String id="";
		try(con;pstmt;rs) {
			
			while(rs.next()) {
			id=rs.getString("email");
			
			result=id.equals(email);
			}
		}//
		/*
		 * System.out.println(email); System.out.println(pass); System.out.println(id);
		 * System.out.println(result);
		 */		return result;
	}//selectEmail
	
	
}//class
