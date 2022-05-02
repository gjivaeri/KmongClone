package com.kmong.dao.register;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kmong.dao.DbConnectionDBCP;
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
	
	
	public int selectMemberSeq() throws SQLException {
		int num=0;
		Connection con=DbConnectionDBCP.getInstance().getConn();
		String selectNum="select member_seq.nextval from dual";
		PreparedStatement pstmt=con.prepareStatement(selectNum);
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs) {
			while(rs.next()) {
				num=rs.getInt("nextval");
			}
		}
		
		return num;
	}
	
	
	public boolean insertMemberInfo(MemberVO mVO) throws SQLException{
		
		boolean flag=false;
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		
		StringBuilder insertMemberInfo=new StringBuilder();
		insertMemberInfo
		.append("	insert into member")
		.append("	(member_id,category_id,email,password,name,nick,tel,expert,join_date,ip,agreement)")
		.append("	values(?,?,?,?,?,?,?,?,sysdate,?,?)");
		
		PreparedStatement pstmt=con.prepareStatement(insertMemberInfo.toString());
		pstmt.setInt(1,mVO.getMemberId());
		pstmt.setInt(2,mVO.getCategoryId());
		pstmt.setString(3,mVO.getEmail());
		pstmt.setString(4,mVO.getPassword() );
		pstmt.setString(5, mVO.getName());
		pstmt.setString(6,mVO.getNick() );
		pstmt.setString(7,mVO.getTel());
		pstmt.setString(8,mVO.getExpert());
		pstmt.setString(9, mVO.getIp());
		pstmt.setString(10, mVO.getAgreement() );
		
		
		try(con;pstmt){
		 pstmt.executeUpdate();
		 flag=true;
		}
		
		System.out.println(flag);
		return flag;
	}//insertMemberInfo

	
	
	public boolean insertInterests(MemberVO mVO, String[] interests) throws SQLException {
		
		boolean flag=false;
		
		for(String i:interests) {
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		StringBuilder insertInterests=new StringBuilder();
		insertInterests
		.append("	insert into interest")
		.append("	(member_id,category_id)")
		.append("	values(?,?)");
			
		PreparedStatement pstmt=con.prepareStatement(insertInterests.toString());
		
		pstmt.setInt(1,mVO.getMemberId());
		pstmt.setInt(2,Integer.parseInt(i));
			
			try(con;pstmt){
			 pstmt.executeUpdate();
			 flag=true;
			}//try
			
		}//end for
		return flag;
	}//insertInterests
	
	
	
	/**
	 * 이메일 중복 체크를 위한 메소드
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public boolean selectEmail(String email) throws SQLException{
		boolean result=false;
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String selectEmail="select email from member where email=?";
		PreparedStatement pstmt=con.prepareStatement(selectEmail);
		pstmt.setString(1, email);
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs) {
			
			result=rs.next();
			
		}//
		
		return result;
	}//selectEmail
	
	
	
	/**
	 * 닉네임 중복 체크
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public boolean selectNick(String nick) throws SQLException{
		boolean result=false;
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String selectNick="select nick from member where nick=?";
		PreparedStatement pstmt=con.prepareStatement(selectNick);
		pstmt.setString(1, nick);
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs) {
			
			result=rs.next();
			
		}//
		
		return result;
	}//selectEmail
	
	
	/**
	 * 닉네임 중복 체크
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public boolean selectTel(String tel) throws SQLException{
		boolean result=false;
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String selectTel="select tel from member where tel=?";
		PreparedStatement pstmt=con.prepareStatement(selectTel);
		pstmt.setString(1, tel);
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs) {
			result=rs.next();
		}//
		
		return result;
	}//selectEmail

	
	
	
}//class
