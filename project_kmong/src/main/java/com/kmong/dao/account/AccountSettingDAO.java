package com.kmong.dao.account;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.CategoryVO;
import com.kmong.vo.InterestVO;
import com.kmong.vo.MemberVO;










public class AccountSettingDAO {
	
	public static  AccountSettingDAO asd;
	
	
public AccountSettingDAO() {
	
}
public static AccountSettingDAO getInstance(){
	if(asd==null) {
		asd=new AccountSettingDAO();
	}//end if
	return asd;
	
}//getInstance
	
	

	
	
	//다 연결만 함
public String selectCheckPassword(int memberId, String password)throws SQLException {
	
	String chkpass=null;
	
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
	String selectpass="select password from member where member_id=? and password=?";
	pstmt=con.prepareStatement(selectpass);
	//5. 바인드 변수 값 설정
	pstmt.setInt(1, memberId);
	pstmt.setString(2, password);
	//6. 쿼리문 수행 후 결과 얻기
	rs=pstmt.executeQuery();
	
	while(rs.next()) {
		chkpass=rs.getString("password");
	}
		

	
	
	}finally {
	//7. 연결끊기
	instance.dbClose(rs, pstmt, con);
	}//end finally
	
	
	return chkpass;
		
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
	pstmt.setString(1, MVO.getWithdrawalStatus());
	pstmt.setString(2, MVO.getWithdrawalReason());
	pstmt.setInt(3, MVO.getMemberId());
	//6. 쿼리문 수행 후 결과얻기
	flag=pstmt.executeUpdate();
	}finally {
	//7.연결끊기
		instance.dbClose(null, pstmt, con);
	}//end finally
	
	
	if(flag>0) return true;
	else return false;	
}// updateMemberWithdrwalStatusReason


public String selectEmail(int memberId)throws SQLException {
	
	String chkEmail=null;
	
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
	String selectEmail="select Email from member where member_id=?";
	pstmt=con.prepareStatement(selectEmail);
	//5. 바인드 변수 값 설정
	pstmt.setInt(1, memberId);
	
	//6. 쿼리문 수행 후 결과 얻기
	rs=pstmt.executeQuery();
	
	while(rs.next()) {
		chkEmail=rs.getString("Email");
		//chkpass 에 값 넣기 return 값과 request 값이 같으면 정보변경 창 으로 이동하게 함
	}; 
	
	
	}finally {
	//7. 연결끊기
	instance.dbClose(rs, pstmt, con);
	}//end finally
	
	
	return chkEmail;
		
	}//selectCheckPassword


public String selectapss(int memberId)throws SQLException {
	
	String selectpass=null;
	
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
	String selectEmail="select password from member where member_id=?";
	pstmt=con.prepareStatement(selectEmail);
	//5. 바인드 변수 값 설정
	pstmt.setInt(1, memberId);
	
	//6. 쿼리문 수행 후 결과 얻기
	rs=pstmt.executeQuery();
	
	while(rs.next()) {
		selectpass=rs.getString("password");
		//chkpass 에 값 넣기 return 값과 request 값이 같으면 정보변경 창 으로 이동하게 함
	}; 
	
	
	}finally {
	//7. 연결끊기
	instance.dbClose(rs, pstmt, con);
	}//end finally
	
	
	return selectpass;
		
	}//selectCheckPassword

public void deleteinterest(int memberId)throws SQLException {
	
	
	
	Connection con=null;
	PreparedStatement pstmt=null;
	
	
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	
	
	try {
	//1. JNDI 사용객체 생성
	//2. 설정된 DBCP 에서 DataSource 얻기
	//3. DataSource에서 Connection 얻기
		con=instance.getConn();
	//4. 쿼리문 생성객체 얻기
	String deletecategory="delete from interest where member_id=?";
	pstmt=con.prepareStatement(deletecategory);
	//5. 바인드 변수 값 설정
	pstmt.setInt(1, memberId);
	
	//6. 쿼리문 수행 후 결과 얻기
	pstmt.executeQuery();
	
	}finally {
	//7. 연결끊기
	instance.dbClose(null, pstmt, con);
	}//end finally
	
		
	}//deleteinterest

public void insertinterest(int memberId,int categoryId)throws SQLException {
	Connection con=null;
	PreparedStatement pstmt=null;
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	try {
	//1. JNDI 사용객체 생성
	//2. 설정된 DBCP 에서 DataSource 얻기
	//3. DataSource에서 Connection 얻기
		con=instance.getConn();
	//4. 쿼리문 생성객체 얻기
		String insertInterest="insert into interest(member_id, category_id) values(?,?)";
	pstmt=con.prepareStatement(insertInterest);
		//5. 바인드 변수 값 설정
	pstmt.setInt(1, memberId);
	pstmt.setInt(2, categoryId );
	//6. 쿼리수행 후 결고 얻기
	pstmt.executeUpdate();
	}finally {
	//7. 연결끊기
		instance.dbClose(null, pstmt, con);
	}//end finally
}// insertFile

public void updateFile(String userImg, int memberId)throws SQLException {
	Connection con=null;
	PreparedStatement pstmt=null;
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	
	try {
	//1. JNDI 사용객체 생성
	//2. 설정된 DBCP 에서 DataSource 얻기
	//3. DataSource에서 Connection 얻기
		con=instance.getConn();
	//4. 쿼리문 생성객체 얻기
		String insertFile="update member set user_img=? where member_id=?";
	pstmt=con.prepareStatement(insertFile);
		//5. 바인드 변수 값 설정
	pstmt.setString(1, userImg);
	pstmt.setInt(2, memberId);

	//6. 쿼리수행 후 결고 얻기
	pstmt.executeUpdate();
	}finally {
	//7. 연결끊기
		instance.dbClose(null, pstmt, con);
	}//end finally
}// updateFile

public List<InterestVO> findinterest(int memberId) throws SQLException {
	List<InterestVO> list = new ArrayList<InterestVO>();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	DbConnectionDBCP instance = DbConnectionDBCP.getInstance();

	try {
		// 1. JNDI 사용객체 생성
		// 2. 설정된 DBCP 에서 DataSource 얻기
		// 3. DataSource에서 Connection 얻기
		con = instance.getConn();
		// 4. 쿼리문 생성객체 얻기
		String selectCategoryid = "select  category_id from interest where member_id=?";
		pstmt = con.prepareStatement(selectCategoryid);
		// 5.바인드 변수 값 할당
		pstmt.setInt(1,memberId );
		// 6. 쿼리문 수행후 결과 얻기
		rs = pstmt.executeQuery();

		InterestVO iVO = null;
		while (rs.next()) {
			iVO = new InterestVO();
			
			iVO.setCategoryId(rs.getInt("category_id"));

			list.add(iVO);
		} // end while

	} finally {
		// 7.연결끊기
		instance.dbClose(rs, pstmt, con);
	} // end finally

	return list;
}// selectAllCategory

public List<MemberVO> selectinformation(int memberId) throws SQLException {
	List<MemberVO> list = new ArrayList<MemberVO>();


	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	DbConnectionDBCP instance = DbConnectionDBCP.getInstance();

	try {
		// 1. JNDI 사용객체 생성
		// 2. 설정된 DBCP 에서 DataSource 얻기
		// 3. DataSource에서 Connection 얻기
		con = instance.getConn();
		// 4. 쿼리문 생성객체 얻기
		String selectCategoryid = "select  name, tel, nick, email from member where member_id=?";
		pstmt = con.prepareStatement(selectCategoryid);
		// 5.바인드 변수 값 할당
		pstmt.setInt(1,memberId );
		// 6. 쿼리문 수행후 결과 얻기
		rs = pstmt.executeQuery();
		MemberVO mVO = null;
		while (rs.next()) {
			mVO = new MemberVO();
			
			mVO.setName(rs.getString("name"));
			mVO.setTel(rs.getString("tel"));
			mVO.setNick(rs.getString("nick"));
			mVO.setEmail(rs.getString("email"));

			list.add(mVO);
		} // end while

	} finally {
		// 7.연결끊기
		instance.dbClose(rs, pstmt, con);
	} // end finally
	return list;


}
}//class
