package com.kmong.dao.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.CategoryVO;
import com.kmong.vo.PostVO;

public class MenuDAO {

	public List<CategoryVO> selectAllCategory() throws SQLException {
		List<CategoryVO> list = new ArrayList<CategoryVO>();
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
			String selectCategoryName = "select category_status,category_name, category_id from category where category_status = 'Y' ";
			pstmt = con.prepareStatement(selectCategoryName);
			// 5.���ε� ���� �� �Ҵ�
			// 6. ������ ������ ��� ���
			rs = pstmt.executeQuery();

			CategoryVO CgVO = null;
			while (rs.next()) {
				CgVO = new CategoryVO();
				CgVO.setCategoryStatus(rs.getString("category_status"));
				CgVO.setCategoryName(rs.getString("category_name"));
				CgVO.setCategoryId(rs.getInt("category_id"));

				list.add(CgVO);
			} // end while

		} finally {
			// 7.�������
			instance.dbClose(rs, pstmt, con);
		} // end finally

		return list;
	}// selectAllCategory

	public List<PostVO> selectCategoryMenu(int categoryId) throws SQLException {
		List<PostVO> list = new ArrayList<PostVO>();
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
			StringBuilder selectMenu = new StringBuilder();
			selectMenu.append("	select post_status,post_id, post_img, title, price, star_avg	").append("	from post	")
					.append("	where category_id=? and post_status='Y'	");

			pstmt = con.prepareStatement(selectMenu.toString());

			// 5. ���ε� ���� �� �Ҵ�
			pstmt.setInt(1, categoryId);
			// 6.������ ���� �� ��� ���
			rs = pstmt.executeQuery();

			PostVO PVO = null;
			while (rs.next()) {
				PVO = new PostVO();
				PVO.setPostStatus(rs.getString("post_status"));
				PVO.setPostId(rs.getInt("post_id"));
				PVO.setPostImg(rs.getString("post_img"));
				PVO.setTitle(rs.getString("title"));
				PVO.setPrice(rs.getInt("price"));
				PVO.setStarAvg(rs.getDouble("star_avg"));

				list.add(PVO);
			} // end while
		} finally {
			// 7.�������
			instance.dbClose(rs, pstmt, con);
		} // end finally
		return list;
	}// selectCategoryMenu

	public List<PostVO> selectSearchMenu(String search) throws SQLException {
	
		List<PostVO> list = new ArrayList<PostVO>();

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
			StringBuilder selectSearchMenu = new StringBuilder();
			selectSearchMenu.append("	select post_status, post_id, post_img, title, price, star_avg	").append("	from post	")
					.append("	where title like ? and  post_status='Y' ");

			pstmt = con.prepareStatement(selectSearchMenu.toString());
			// 5. ���ε� ���� �� �Ҵ�
			pstmt.setString(1, "%" + search + "%");
			// 6. ������ ������ ��� ���
			rs = pstmt.executeQuery();

			PostVO PVO = null;
			while (rs.next()) {
				PVO = new PostVO();

				PVO.setPostStatus(rs.getString("post_status"));
				PVO.setPostId(rs.getInt("post_id"));
				PVO.setPostImg(rs.getString("post_img"));
				PVO.setTitle(rs.getString("title"));
				PVO.setPrice(rs.getInt("price"));
				PVO.setStarAvg(rs.getDouble("star_avg"));

				list.add(PVO);
			} // end while
		} finally {
			// 7. �������
			instance.dbClose(rs, pstmt, con);

		} // end finally
	
		//rs.getString("post_status")
		return list;

	}// selectSearchMenu

	public boolean selectCategoryId(int categoryId) throws SQLException {

		boolean flag = false;

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
			String selectpass = "select category_id from category where category_id = ?";
			pstmt = con.prepareStatement(selectpass);
			// 5. ���ε� ���� �� ����
			pstmt.setInt(1, categoryId);

			// 6. ������ ���� �� ��� ���
			rs = pstmt.executeQuery();

			flag = rs.next();

		} finally {
			// 7. �������
			instance.dbClose(rs, pstmt, con);
		} // end finally

		return flag;

	}// selectCheckPassword


////////////////////(0430 ���ı��� �߰� �ڵ� - Ȯ���ϰ� �� �ּ��� �����ּ���)///////////////////////////////////////
	public List<PostVO> selectDateMenu(int categoryId, String sortIdx) throws SQLException {
		List<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		if(sortIdx==null) {
			sortIdx="post_date";
		}
		
		System.out.println(sortIdx);
		DbConnectionDBCP instance = DbConnectionDBCP.getInstance();

		try {
			// 1. JNDI ��밴ü ����
			// 2. ������ DBCP ���� DataSource ���
			// 3. DataSource���� Connection ���
			con = instance.getConn();
			// 4. ������ ������ü ���
			StringBuilder selectMenu = new StringBuilder();

			selectMenu.append("	select post_id, post_img, title, price, star_avg	").append("	from post	")
					.append("	where category_id=? order by ").append(sortIdx).append(" desc");

			pstmt = con.prepareStatement(selectMenu.toString());

			// 5. ���ε� ���� �� �Ҵ�
			pstmt.setInt(1, categoryId);
			// 6.������ ���� �� ��� ���
			rs = pstmt.executeQuery();

			PostVO PVO = null;
			while (rs.next()) {
				PVO = new PostVO();

				PVO.setPostId(rs.getInt("post_id"));
				PVO.setPostImg(rs.getString("post_img"));
				PVO.setTitle(rs.getString("title"));
				PVO.setPrice(rs.getInt("price"));
				PVO.setStarAvg(rs.getDouble("star_avg"));

				list.add(PVO);
			} // end while
		} finally {
			// 7.�������
			instance.dbClose(rs, pstmt, con);
		} // end finally
		return list;
	}// selectCategoryMenu
	
	public List<PostVO> selectSearchMenu(String search, String sortIdx) throws SQLException {
		
		List<PostVO> list = new ArrayList<PostVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		if(sortIdx == null) {
			sortIdx = "post_date";
		}

		DbConnectionDBCP instance = DbConnectionDBCP.getInstance();

		try {
			// 1. JNDI ��밴ü ����
			// 2. ������ DBCP ���� DataSource ���
			// 3. DataSource���� Connection ���
			con = instance.getConn();
			// 4. ������ ������ü ���
			StringBuilder selectSearchMenu = new StringBuilder();
			selectSearchMenu.append("	select post_id, post_img, title, price, star_avg	").append("	from post	")
					.append("	where title like ? and post_status='Y'	").append(" order by ").append(sortIdx).append(" desc");

			pstmt = con.prepareStatement(selectSearchMenu.toString());
			// 5. ���ε� ���� �� �Ҵ�
			pstmt.setString(1, "%" + search + "%");
			// 6. ������ ������ ��� ���
			rs = pstmt.executeQuery();

			PostVO PVO = null;
			while (rs.next()) {
				PVO = new PostVO();

				PVO.setPostId(rs.getInt("post_id"));
				PVO.setPostImg(rs.getString("post_img"));
				PVO.setTitle(rs.getString("title"));
				PVO.setPrice(rs.getInt("price"));
				PVO.setStarAvg(rs.getDouble("star_avg"));

				list.add(PVO);
			} // end while
		} finally {
			// 7. �������
			instance.dbClose(rs, pstmt, con);

		} // end finally
		return list;

	}// selectSearchMenu
	
public int commentcount(int postId)throws SQLException {
		
		int cnt=0;
		
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
		String selectpass="select count(*) from comments where post_id = ?";
		pstmt=con.prepareStatement(selectpass);
		//5. ���ε� ���� �� ����
		pstmt.setInt(1, postId);
		
		//6. ������ ���� �� ��� ���
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			cnt=rs.getInt(1);
		}
	
		
			

		
		
		}finally {
		//7. �������
		instance.dbClose(rs, pstmt, con);
		}//end finally
		
		
		return cnt;
			
		}// commentcount
	

}// class
