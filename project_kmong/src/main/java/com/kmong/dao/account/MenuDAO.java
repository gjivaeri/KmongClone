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
			String selectCategoryName = "select category_name, category_id from category";
			pstmt = con.prepareStatement(selectCategoryName);
			// 5.���ε� ���� �� �Ҵ�
			// 6. ������ ������ ��� ���
			rs = pstmt.executeQuery();

			CategoryVO CgVO = null;
			while (rs.next()) {
				CgVO = new CategoryVO();
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
			selectMenu.append("	select post_img, title, price, star_avg	").append("	from post	")
					.append("	where category_id=?	");

			pstmt = con.prepareStatement(selectMenu.toString());

			// 5. ���ε� ���� �� �Ҵ�
			pstmt.setInt(1, categoryId);
			// 6.������ ���� �� ��� ���
			rs = pstmt.executeQuery();

			PostVO PVO = null;
			while (rs.next()) {
				PVO = new PostVO();

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
			selectSearchMenu.append("	select post_img, title, price, star_avg	").append("	from post	")
					.append("	where title like= '%'||?||'%'	");

			pstmt = con.prepareStatement(selectSearchMenu.toString());
			// 5. ���ε� ���� �� �Ҵ�
			pstmt.setString(1, search);
			// 6. ������ ������ ��� ���
			rs = pstmt.executeQuery();

			PostVO PVO = null;
			while (rs.next()) {
				PVO = new PostVO();

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

}// class
