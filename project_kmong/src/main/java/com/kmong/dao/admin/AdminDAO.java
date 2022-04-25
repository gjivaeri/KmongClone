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
+ selectDetailPost(int): postVO //�Խñۻ�������
+ updatePost(postVO): boolean
+ updatePost(postVO, char): boolean //�Խñ� ����
+ selectMember(int,char): List<memberVO>// char�� �����/������ ��ȸ
+ selectAllMember(): int //��ȸ����
+ selectTodayMember(int): int //���ð����� ȸ����
+ selectDetailMember(int, char): memberVO // char�� �����/������ ��ȸ
+ updateMember(memberVO): boolean
+ deleteMember(memberVO): boolean
+ selectOrders(): List<ordersVO> //��� ���� ����
+ selectOrders(orderStatusVO): int //���� �Ǽ� ��ȸ
+ selectTodayOrders(orderStatusVO, String): int //���� ���� ����-��¥�� ��ȸ 
+ selectDetailOrders(int): ordersVO
+ updateOrders(oderVO, char): boolean //���
+ selectAllCategory(): List<categoryVO> //��� ī�װ� ��ȸ
+ selectRegisteredCategory(): int //��ϵ� ī�װ� ��
+ selectDetailCategory(int): categoryVO
+ updateCategory(categoryVO): boolean
+ updateCategory(categoryVO, char): boolean //ī�װ� ����
+ insertCategory(String, String): void //ī�װ� �߰�
*/
