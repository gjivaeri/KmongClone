package com.kmong.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.AdminVO;

public class AdminDAO {

	private static AdminDAO aDAO;
	DbConnectionDBCP dbcp = DbConnectionDBCP.getInstance();
	
	private AdminDAO() {
		
	}
	
	public static AdminDAO getInstance() {
		if(aDAO==null) {
			aDAO=new AdminDAO();
		}//end if
		return aDAO;
	}
	
	public boolean selectAdaminLogin(String admId, String admPw) throws SQLException {
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		boolean loginFlag = false;
		
		try {
			con=dbcp.getConn();
			String query="select count(*) from admin where id=? and pass=?";
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, admId);
			pstmt.setString(2, admPw);
			
			rs=pstmt.executeQuery();
			
			
			if(rs.next()&&rs.getInt(1) > 0) {
				loginFlag=true;
			}
		}finally {
			dbcp.dbClose(rs, pstmt, con);
		}
		return loginFlag;
	}


}
/* Methos to be created later
+ selectAdminLogin(adminVO): boolean
+ updateAdminPass(adminVO): boolean 
+ selectPost(): List<postVO>
+ selectDetailPost(int): postVO //게시글상세페이지
+ updatePost(postVO): boolean
+ updatePost(postVO, char): boolean //게시글 삭제
+ selectMember(int,char): List<memberVO>// char로 사용자/전문가 조회
+ selectAllMember(): int //총회원수
+ selectTodayMember(int): int //오늘가입한 회원수
+ selectDetailMember(int, char): memberVO // char로 사용자/전문가 조회
+ updateMember(memberVO): boolean
+ deleteMember(memberVO): boolean
+ selectOrders(): List<ordersVO> //모든 결제 내역
+ selectOrders(orderStatusVO): int //결제 건수 조회
+ selectTodayOrders(orderStatusVO, String): int //오늘 결제 내역-날짜로 조회 
+ selectDetailOrders(int): ordersVO
+ updateOrders(oderVO, char): boolean //취소
+ selectAllCategory(): List<categoryVO> //모든 카테고리 조회
+ selectRegisteredCategory(): int //등록된 카테고리 수
+ selectDetailCategory(int): categoryVO
+ updateCategory(categoryVO): boolean
+ updateCategory(categoryVO, char): boolean //카테고리 삭제
+ insertCategory(String, String): void //카테고리 추가
*/
