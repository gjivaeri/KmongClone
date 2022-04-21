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
	
	

	
	
	//다 연결만 함
public String selectCheckPassword(MemberVO MVO)throws SQLException {
	
	String pass=null;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	
	
	try {
	//1. JNDI 사용객체 생성
	//2. 설정된 DBCP 에서 DataSource 얻기
	//3. DataSource에서 Connection 얻기
		con=instance.getConn();
	//4. 쿼리문 생성객체 얻기
	String selectpass="select password from member where memberId=?";
	pstmt=con.prepareStatement(selectpass);
	//5. 바인드 변수 값 설정
	pstmt.setInt(1, MVO.getMemberId());
	//6. 쿼리문 수행 후 결과 얻기
	rs=pstmt.executeQuery();
	
	while(rs.next()) {
		pass=rs.getString("password");	
	}//end while
	
	}finally {
	//7. 연결끊기
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
	//1. JNDI 사용객체 생성
	//2. 설정된 DBCP 에서 DataSource 얻기
	//3. DataSource에서 Connection 얻기
		con=instance.getConn();
	//4.쿼리문 생성객체 얻기
	String updateImg="update member set user_img=? where member_id=?";
	pstmt=con.prepareStatement(updateImg);
	//5.바인드 변수 값 설정
	pstmt.setString(1, MVO.getUser_img());
	pstmt.setInt(2, MVO.getMemberId());
	//6. 쿼리문 실행후 결과 값 얻기
	flag=pstmt.executeUpdate();
	}finally {
	//7. 연결끊기
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
	//1. JNDI 사용객체 생성
	//2. 설정된 DBCP 에서 DataSource 얻기
	//3. DataSource에서 Connection 얻기
		con=instance.getConn();
	//4.쿼리문 생성객체 얻기
		String updateCategoryId="update member set category_id=? where member_id=?";
		pstmt=con.prepareStatement(updateCategoryId);
		//5.바인드 변수 값 설정
		pstmt.setInt(1, MVO.getCategoryId());
		pstmt.setInt(2, MVO.getMemberId());
		//6. 쿼리문 실행후 결과 값 얻기
		flag=pstmt.executeUpdate();
		}finally {
		//7. 연결끊기
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
	//1. JNDI 사용객체 생성
	//2. 설정된 DBCP 에서 DataSource 얻기
	//3. DataSource에서 Connection 얻기
		con=instance.getConn();
	//4.쿼리문 생성객체 얻기
			String updateInsertId="update interest set category_id=? where member_id=?";
			pstmt=con.prepareStatement(updateInsertId);
			//5.바인드 변수 값 설정
			pstmt.setInt(1, IVO.getCategoryId());
			pstmt.setInt(2, IVO.getMemberId());
			//6. 쿼리문 실행후 결과 값 얻기
		flag=	pstmt.executeUpdate();
			}finally {
			//7. 연결끊기
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
	//1. JNDI 사용객체 생성
	//2. 설정된 DBCP 에서 DataSource 얻기
	//3. DataSource에서 Connection 얻기
		con=instance.getConn();
	//4. 쿼리문 생성객체 얻기
	String updatePass="update member set password=? where member_id=?";
	pstmt=con.prepareStatement(updatePass);
	//5. 바인드 변수값 넣기
	pstmt.setString(1, MVO.getPassword());
	pstmt.setInt(2, MVO.getMemberId());
	//6. 쿼리문 수행 후 결과얻기
	flag=pstmt.executeUpdate();
	}finally {
	//7.연결끊기
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
	//1. JNDI 사용객체 생성
	//2. 설정된 DBCP 에서 DataSource 얻기
	//3. DataSource에서 Connection 얻기
		con=instance.getConn();
	//4. 쿼리문 생성객체 얻기
	String updateWithdrwalStatus="update member set withdrawal_status=?, withdrawal_reason=? where member_id=?";
	pstmt=con.prepareStatement(updateWithdrwalStatus);
	//5. 바인드 변수값 넣기
	pstmt.setString(1, MVO.getPassword());
	pstmt.setInt(2, MVO.getMemberId());
	//6. 쿼리문 수행 후 결과얻기
	flag=pstmt.executeUpdate();
	}finally {
	//7.연결끊기
		instance.dbClose(null, pstmt, con);
	}//end finally
	
	
	if(flag>0) return true;
	else return false;	
}// updateMemberWithdrwalStatusReason

}//class
