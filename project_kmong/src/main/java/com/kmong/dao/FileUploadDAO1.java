package com.kmong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import com.kmong.vo.MemberVO;


public class FileUploadDAO1 {

private static FileUploadDAO1 fDAO;
	
	
	private FileUploadDAO1() {
		
	}
	
	
	public static FileUploadDAO1 getInstance() {
		if(fDAO==null) {
			fDAO=new FileUploadDAO1();
		}//end if
		return fDAO;
	}//getInstance
	
	
	
	public int updateProfileFile(MemberVO mVO) throws SQLException{
		
		System.out.println(mVO.getUser_img()+"Ã·");
		Connection con=DbConnectionDBCP.getInstance().getConn();
		int rowCnt=0;
		String insertFileName="update member set user_img=? where member_id=?";
		PreparedStatement pstmt=con.prepareStatement(insertFileName);
		pstmt.setString(1, mVO.getUser_img());
		pstmt.setInt(2, mVO.getMemberId());
		
		try(con;pstmt) {
			rowCnt=pstmt.executeUpdate();
		
		}
		//System.out.println(mVO.getUser_img());
		//System.out.println("¾÷µ«µÊ¤»¤»"+rowCnt);
		//System.out.println(new Date());
		return rowCnt;
	}//insertFile


}
