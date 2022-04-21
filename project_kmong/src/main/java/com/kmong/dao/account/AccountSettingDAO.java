package com.kmong.dao.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.InterestVO;
import com.kmong.vo.MemberVO;






public class AccountSettingDAO {
	
	public static  AccountSettingDAO asd;
	
	private AccountSettingDAO() {
		
	}//AccountSettingDAO
	
	

	
	
	//�� ���Ḹ ��
public String selectCheckPassword(MemberVO MVO)throws SQLException {
	
	String pass=null;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	
	
	try {
	//1. JNDI ��밴ü ����
	//2. ������ DBCP ���� DataSource ���
	//3. DataSource���� Connection ���
		con=instance.getConn();
	//4. ������ ������ü ���
	String selectpass="select password from member where memberId=?";
	pstmt=con.prepareStatement(selectpass);
	//5. ���ε� ���� �� ����
	pstmt.setInt(1, MVO.getMemberId());
	//6. ������ ���� �� ��� ���
	rs=pstmt.executeQuery();
	
	while(rs.next()) {
		pass=rs.getString("password");	
	}//end while
	
	}finally {
	//7. �������
	instance.dbClose(rs, pstmt, con);
	}//end finally
	
	
	return pass;
		
	}//selectCheckPassword


public boolean updateMemberImg(MemberVO MVO)throws SQLException {
	
	int flag=0;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	
	try {
	//1. JNDI ��밴ü ����
	//2. ������ DBCP ���� DataSource ���
	//3. DataSource���� Connection ���
		con=instance.getConn();
	//4.������ ������ü ���
	String updateImg="update member set user_img=? where member_id=?";
	pstmt=con.prepareStatement(updateImg);
	//5.���ε� ���� �� ����
	pstmt.setString(1, MVO.getUser_img());
	pstmt.setInt(2, MVO.getMemberId());
	//6. ������ ������ ��� �� ���
	flag=pstmt.executeUpdate();
	}finally {
	//7. �������
		instance.dbClose(null, pstmt, con);
	}//end finally
	
	
	
	if(flag>0) return true;
	else return false;
}//updateMemberImg


public boolean  updateMemberCategoryId(MemberVO MVO)throws SQLException {
	
	int flag=0;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	
	try {
	//1. JNDI ��밴ü ����
	//2. ������ DBCP ���� DataSource ���
	//3. DataSource���� Connection ���
		con=instance.getConn();
	//4.������ ������ü ���
		String updateCategoryId="update member set category_id=? where member_id=?";
		pstmt=con.prepareStatement(updateCategoryId);
		//5.���ε� ���� �� ����
		pstmt.setInt(1, MVO.getCategoryId());
		pstmt.setInt(2, MVO.getMemberId());
		//6. ������ ������ ��� �� ���
		flag=pstmt.executeUpdate();
		}finally {
		//7. �������
			instance.dbClose(null, pstmt, con);
		}//end finally
	
	if(flag>0) return true;
	else return false;
}//updateMemberCategoryId


public boolean updateMemberInterestId(InterestVO IVO)throws SQLException {
	
	int flag=0;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	
	try {
	//1. JNDI ��밴ü ����
	//2. ������ DBCP ���� DataSource ���
	//3. DataSource���� Connection ���
		con=instance.getConn();
	//4.������ ������ü ���
			String updateInsertId="update interest set category_id=? where member_id=?";
			pstmt=con.prepareStatement(updateInsertId);
			//5.���ε� ���� �� ����
			pstmt.setInt(1, IVO.getCategoryId());
			pstmt.setInt(2, IVO.getMemberId());
			//6. ������ ������ ��� �� ���
		flag=	pstmt.executeUpdate();
			}finally {
			//7. �������
				instance.dbClose(null, pstmt, con);
			}//end finally
	
	
	if(flag>0) return true;
	else return false;
}//updateMemberInterestId


public boolean updateMemberPassword(MemberVO MVO)throws SQLException {
	
	int flag=0;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	
	try {
	//1. JNDI ��밴ü ����
	//2. ������ DBCP ���� DataSource ���
	//3. DataSource���� Connection ���
		con=instance.getConn();
	//4. ������ ������ü ���
	String updatePass="update member set password=? where member_id=?";
	pstmt=con.prepareStatement(updatePass);
	//5. ���ε� ������ �ֱ�
	pstmt.setString(1, MVO.getPassword());
	pstmt.setInt(2, MVO.getMemberId());
	//6. ������ ���� �� ������
	flag=pstmt.executeUpdate();
	}finally {
	//7.�������
		instance.dbClose(null, pstmt, con);
	}//end finally
	if(flag>0) return true;
	else return false;
}//updateMemberPassword


public boolean  updateMemberWithdrwalStatusReason(MemberVO MVO)throws SQLException {
	
	int flag=0;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	
	try {
	//1. JNDI ��밴ü ����
	//2. ������ DBCP ���� DataSource ���
	//3. DataSource���� Connection ���
		con=instance.getConn();
	//4. ������ ������ü ���
	String updateWithdrwalStatus="update member set withdrawal_status=?, withdrawal_reason=? where member_id=?";
	pstmt=con.prepareStatement(updateWithdrwalStatus);
	//5. ���ε� ������ �ֱ�
	pstmt.setString(1, MVO.getPassword());
	pstmt.setInt(2, MVO.getMemberId());
	//6. ������ ���� �� ������
	flag=pstmt.executeUpdate();
	}finally {
	//7.�������
		instance.dbClose(null, pstmt, con);
	}//end finally
	
	
	if(flag>0) return true;
	else return false;	
}// updateMemberWithdrwalStatusReason

}//class
