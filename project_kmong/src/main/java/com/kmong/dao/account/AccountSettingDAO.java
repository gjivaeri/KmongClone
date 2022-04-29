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
	
	

	
	
	//�� ���Ḹ ��
public String selectCheckPassword(int memberId, String password)throws SQLException {
	
	String chkpass=null;
	
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
	String selectpass="select password from member where member_id=? and password=?";
	pstmt=con.prepareStatement(selectpass);
	//5. ���ε� ���� �� ����
	pstmt.setInt(1, memberId);
	pstmt.setString(2, password);
	//6. ������ ���� �� ��� ���
	rs=pstmt.executeQuery();
	
	while(rs.next()) {
		chkpass=rs.getString("password");
	}
		

	
	
	}finally {
	//7. �������
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
	pstmt.setString(1, MVO.getWithdrawalStatus());
	pstmt.setString(2, MVO.getWithdrawalReason());
	pstmt.setInt(3, MVO.getMemberId());
	//6. ������ ���� �� ������
	flag=pstmt.executeUpdate();
	}finally {
	//7.�������
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
	//1. JNDI ��밴ü ����
	//2. ������ DBCP ���� DataSource ���
	//3. DataSource���� Connection ���
		con=instance.getConn();
	//4. ������ ������ü ���
	String selectEmail="select Email from member where member_id=?";
	pstmt=con.prepareStatement(selectEmail);
	//5. ���ε� ���� �� ����
	pstmt.setInt(1, memberId);
	
	//6. ������ ���� �� ��� ���
	rs=pstmt.executeQuery();
	
	while(rs.next()) {
		chkEmail=rs.getString("Email");
		//chkpass �� �� �ֱ� return ���� request ���� ������ �������� â ���� �̵��ϰ� ��
	}; 
	
	
	}finally {
	//7. �������
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
	//1. JNDI ��밴ü ����
	//2. ������ DBCP ���� DataSource ���
	//3. DataSource���� Connection ���
		con=instance.getConn();
	//4. ������ ������ü ���
	String selectEmail="select password from member where member_id=?";
	pstmt=con.prepareStatement(selectEmail);
	//5. ���ε� ���� �� ����
	pstmt.setInt(1, memberId);
	
	//6. ������ ���� �� ��� ���
	rs=pstmt.executeQuery();
	
	while(rs.next()) {
		selectpass=rs.getString("password");
		//chkpass �� �� �ֱ� return ���� request ���� ������ �������� â ���� �̵��ϰ� ��
	}; 
	
	
	}finally {
	//7. �������
	instance.dbClose(rs, pstmt, con);
	}//end finally
	
	
	return selectpass;
		
	}//selectCheckPassword

public void deleteinterest(int memberId)throws SQLException {
	
	
	
	Connection con=null;
	PreparedStatement pstmt=null;
	
	
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	
	
	try {
	//1. JNDI ��밴ü ����
	//2. ������ DBCP ���� DataSource ���
	//3. DataSource���� Connection ���
		con=instance.getConn();
	//4. ������ ������ü ���
	String deletecategory="delete from interest where member_id=?";
	pstmt=con.prepareStatement(deletecategory);
	//5. ���ε� ���� �� ����
	pstmt.setInt(1, memberId);
	
	//6. ������ ���� �� ��� ���
	pstmt.executeQuery();
	
	}finally {
	//7. �������
	instance.dbClose(null, pstmt, con);
	}//end finally
	
		
	}//deleteinterest

public void insertinterest(int memberId,int categoryId)throws SQLException {
	Connection con=null;
	PreparedStatement pstmt=null;
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	try {
	//1. JNDI ��밴ü ����
	//2. ������ DBCP ���� DataSource ���
	//3. DataSource���� Connection ���
		con=instance.getConn();
	//4. ������ ������ü ���
		String insertInterest="insert into interest(member_id, category_id) values(?,?)";
	pstmt=con.prepareStatement(insertInterest);
		//5. ���ε� ���� �� ����
	pstmt.setInt(1, memberId);
	pstmt.setInt(2, categoryId );
	//6. �������� �� ��� ���
	pstmt.executeUpdate();
	}finally {
	//7. �������
		instance.dbClose(null, pstmt, con);
	}//end finally
}// insertFile

public void updateFile(String userImg, int memberId)throws SQLException {
	Connection con=null;
	PreparedStatement pstmt=null;
	DbConnectionDBCP instance=DbConnectionDBCP.getInstance();
	
	try {
	//1. JNDI ��밴ü ����
	//2. ������ DBCP ���� DataSource ���
	//3. DataSource���� Connection ���
		con=instance.getConn();
	//4. ������ ������ü ���
		String insertFile="update member set user_img=? where member_id=?";
	pstmt=con.prepareStatement(insertFile);
		//5. ���ε� ���� �� ����
	pstmt.setString(1, userImg);
	pstmt.setInt(2, memberId);

	//6. �������� �� ��� ���
	pstmt.executeUpdate();
	}finally {
	//7. �������
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
		// 1. JNDI ��밴ü ����
		// 2. ������ DBCP ���� DataSource ���
		// 3. DataSource���� Connection ���
		con = instance.getConn();
		// 4. ������ ������ü ���
		String selectCategoryid = "select  category_id from interest where member_id=?";
		pstmt = con.prepareStatement(selectCategoryid);
		// 5.���ε� ���� �� �Ҵ�
		pstmt.setInt(1,memberId );
		// 6. ������ ������ ��� ���
		rs = pstmt.executeQuery();

		InterestVO iVO = null;
		while (rs.next()) {
			iVO = new InterestVO();
			
			iVO.setCategoryId(rs.getInt("category_id"));

			list.add(iVO);
		} // end while

	} finally {
		// 7.�������
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
		// 1. JNDI ��밴ü ����
		// 2. ������ DBCP ���� DataSource ���
		// 3. DataSource���� Connection ���
		con = instance.getConn();
		// 4. ������ ������ü ���
		String selectCategoryid = "select  name, tel, nick, email from member where member_id=?";
		pstmt = con.prepareStatement(selectCategoryid);
		// 5.���ε� ���� �� �Ҵ�
		pstmt.setInt(1,memberId );
		// 6. ������ ������ ��� ���
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
		// 7.�������
		instance.dbClose(rs, pstmt, con);
	} // end finally
	return list;


}
}//class
