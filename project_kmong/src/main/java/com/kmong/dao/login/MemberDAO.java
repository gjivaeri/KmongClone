package com.kmong.dao.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.MemberVO;

public class MemberDAO {

	private static MemberDAO mDAO;
	
	private MemberDAO()  {
		
	}
	
	
	public static MemberDAO getInstance(){
		if(mDAO==null) {
			mDAO=new MemberDAO();
		}//end if
		return mDAO;
	}//getInstance
	
	
	public String selectID(MemberVO mVO) throws SQLException{
		String foundEmail="";
		boolean flag=false;
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String selectEmail="select email from member where name=? and tel=? and withdrawal_status='N'";
		System.out.println(mVO.getName());
		System.out.println(mVO.getTel());
		
		PreparedStatement pstmt=con.prepareStatement(selectEmail);
		pstmt.setString(1, mVO.getName());
		pstmt.setString(2, mVO.getTel());
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs) {
			
			while(rs.next()) {
				foundEmail=rs.getString("email");
				flag=true;
			}
		}//
		/*
		 * System.out.println(email); System.out.println(pass); System.out.println(id);
		 * System.out.println(result);
		 * 
		 */
		System.out.println(foundEmail);
		System.out.println(flag);
		return foundEmail;
	}//selectID
	
	
	public boolean selectPassword(MemberVO mVO) throws SQLException{
		boolean flag=false;
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String selectEmail="select email from member where name=? and tel=? and email=? and withdrawal_status='N'";
		
		PreparedStatement pstmt=con.prepareStatement(selectEmail);
		pstmt.setString(1, mVO.getName());
		pstmt.setString(2, mVO.getTel());
		pstmt.setString(3, mVO.getEmail());
		ResultSet rs=pstmt.executeQuery();
		try(con;pstmt;rs) {
			flag=rs.next();
		}//
		/*
		 * System.out.println(email); System.out.println(pass); System.out.println(id);
		 * System.out.println(result);
		 */		return flag;
	}//selectPassword
	
	
	
	public boolean updatePassword(String pass, MemberVO mVO) throws SQLException{
		boolean flag=false;
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String updatePass
		="update member set password=? where name=? and tel=? and email=? and withdrawal_status='N'";
		
		PreparedStatement pstmt=con.prepareStatement(updatePass);
		
		pstmt.setString(1, pass);
		pstmt.setString(2, mVO.getName());
		pstmt.setString(3, mVO.getTel());
		pstmt.setString(4, mVO.getEmail());
		int cnt=0;
		try(con;pstmt) {
			cnt=pstmt.executeUpdate();
			flag=true;
		}//
		/*
		 * System.out.println(email); System.out.println(pass); System.out.println(id);
		 * System.out.println(result);
		 */		
		return flag;
	}//selectPassword
	
	
	
}
