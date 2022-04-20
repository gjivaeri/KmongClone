package com.kmong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kmong.vo.MemberVO;


public class MakeAccountDAO {

	private static MakeAccountDAO mDAO;
	
	
	private MakeAccountDAO()  {
		
	}
	
	
	public static MakeAccountDAO getInstance(){
		if(mDAO==null) {
			mDAO=new MakeAccountDAO();
		}//end if
		return mDAO;
	}//getInstance
	
	
	
	public void insertMemberInfo(MemberVO mVO) throws SQLException{
		
		DbConnectionDBCP dbDBCP=DbConnectionDBCP.getInstance()  ;
		
		Connection con=dbDBCP.getConn();
		PreparedStatement pstmt=null;
		StringBuilder insertMemberInfo=new StringBuilder();
		insertMemberInfo
		.append("	insert into member")
		.append("	(member_id,category_id,email,password,name,nick,tel,user_img,expert,withdrawal_status,withdrawal_reason,join_date,ip,agreement)")
		.append("	values(member_seq,)");
		 
		

		
		
		
	}//insertMemberInfo


	
	
	
}//class
