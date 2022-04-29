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
	
	
	public int selectLoginInfo(String email,String pass) throws SQLException{
		int memberId=0;
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String selectEmail="select member_id from member where password=? and email=? and withdrawal_status='N'";

		PreparedStatement pstmt=con.prepareStatement(selectEmail);
		pstmt.setString(1, pass);
		pstmt.setString(2, email);
		ResultSet rs=pstmt.executeQuery();
		try(con;pstmt;rs) {
			
			while(rs.next()) {
			memberId=rs.getInt("member_id");
			}
		}//
		/*
		 * System.out.println(email); System.out.println(pass); System.out.println(id);
		 * System.out.println(result);
		 */		
		System.out.println(memberId);
		return memberId;
	}//selectEmail
	
	
}//class
