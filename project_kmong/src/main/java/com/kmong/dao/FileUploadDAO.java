package com.kmong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kmong.vo.MemberVO;


public class FileUploadDAO {

private static FileUploadDAO fDAO;
	
	
	private FileUploadDAO() {
		
	}
	
	
	public static FileUploadDAO getInstance() {
		if(fDAO==null) {
			fDAO=new FileUploadDAO();
		}//end if
		return fDAO;
	}//getInstance
	
	
	
	public int updateProfileFile(MemberVO mVO) throws SQLException{
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		int rowCnt=0;
		String insertFileName="update member set user_img=? where member_id=?";
		PreparedStatement pstmt=con.prepareStatement(insertFileName);
		pstmt.setString(1, mVO.getUser_img());
		pstmt.setInt(2, mVO.getMemberId());
		
		try(con;pstmt) {
			rowCnt=pstmt.executeUpdate();
		
		}
		System.out.println(rowCnt);
		return rowCnt;
	}//insertFile


}
