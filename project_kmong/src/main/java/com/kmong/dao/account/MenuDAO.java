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
			// 1. JNDI 사용객체 생성
			// 2. 설정된 DBCP 에서 DataSource 얻기
			// 3. DataSource에서 Connection 얻기
			con = instance.getConn();
			// 4. 쿼리문 생성객체 얻기
			String selectCategoryName = "select category_name, category_id from category";
			pstmt = con.prepareStatement(selectCategoryName);
			// 5.바인드 변수 값 할당
			// 6. 쿼리문 수행후 결과 얻기
			rs = pstmt.executeQuery();

			CategoryVO CgVO = null;
			while (rs.next()) {
				CgVO = new CategoryVO();
				CgVO.setCategoryName(rs.getString("category_name"));
				CgVO.setCategoryId(rs.getInt("category_id"));

				list.add(CgVO);
			} // end while

		} finally {
			// 7.연결끊기
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
			// 1. JNDI 사용객체 생성
			// 2. 설정된 DBCP 에서 DataSource 얻기
			// 3. DataSource에서 Connection 얻기
			con = instance.getConn();
			// 4. 쿼리문 생성객체 얻기
			StringBuilder selectMenu = new StringBuilder();
			selectMenu.append("	select post_img, title, price, star_avg	").append("	from post	")
					.append("	where category_id=?	");

			pstmt = con.prepareStatement(selectMenu.toString());

			// 5. 바인드 변수 값 할당
			pstmt.setInt(1, categoryId);
			// 6.쿼리문 수행 후 결과 얻기
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
			// 7.연결끊기
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
			// 1. JNDI 사용객체 생성
			// 2. 설정된 DBCP 에서 DataSource 얻기
			// 3. DataSource에서 Connection 얻기
			con = instance.getConn();
			// 4. 쿼리문 생성객체 얻기
			StringBuilder selectSearchMenu = new StringBuilder();
			selectSearchMenu.append("	select post_img, title, price, star_avg	").append("	from post	")
					.append("	where title like= '%'||?||'%'	");

			pstmt = con.prepareStatement(selectSearchMenu.toString());
			// 5. 바인드 변수 값 할당
			pstmt.setString(1, search);
			// 6. 쿼리문 수행후 결과 얻기
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
			// 7. 연결끊기
			instance.dbClose(rs, pstmt, con);

		} // end finally
		return list;

	}// selectSearchMenu

}// class
