package com.kmong.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.CategoryVO;

public class AdminCategoryDAO {
	private static AdminCategoryDAO acDAO;
	DbConnectionDBCP dc;
	
	private AdminCategoryDAO() {
		dc = DbConnectionDBCP.getInstance();
	}
	
	public static AdminCategoryDAO getInstance() {
		if(acDAO==null) {
			acDAO=new AdminCategoryDAO();
		}
		return acDAO;
	}
	
	public CategoryVO selectDetailCategory(int categoryId) throws SQLException{
		Connection con = dc.getConn();
		String sql = "select * from category where category_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, categoryId);
		ResultSet rs = pstmt.executeQuery();
		CategoryVO cVO = null;
		
		try(con; pstmt; rs;){
			while(rs.next()) {
				cVO = new CategoryVO();
				cVO.setCategoryId(rs.getInt("category_id"));
				cVO.setCategoryName(rs.getString("category_name"));
				cVO.setCategoryImage(rs.getString("category_image"));
				cVO.setCategoryStatus(rs.getString("category_status"));
			}
		}
		return cVO;
	}
	
	
	public int insertCategory(String name, String image) throws SQLException{
		int result = -1;
		
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();
		
		/* to avoid empty number of category_id 
		sql.append(" insert into category(category_id, category_name, category_image)");
		sql.append(" values((select NVL(MAX(category_id), 0)+1 from category), ?, ?)");
		*/
		sql.append(" insert into category(category_name, category_image)");
		sql.append(" values(?, ?)");
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		
		pstmt.setString(1, name);
		pstmt.setString(2, image);
		result =  pstmt.executeUpdate();
		
		try(con; pstmt;){
			if(result > 0) {
				return result;
			}
		}
		return result; //error;
	}
	
	public boolean updateCategory(int categoryId, String name, String image) throws SQLException{
		boolean result = false;
		
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();
		sql.append(" update category");
		sql.append(" set category_name = ?, category_image = ?");
		sql.append(" where category_id = ?");
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, name);
		pstmt.setString(2, image);
		pstmt.setInt(3, categoryId);
		int rowCount = pstmt.executeUpdate();
		
		try(con; pstmt;){
			if(rowCount > 0) {
				result = true;
			}
		}
		return result;
	}


	public boolean deleteCategory(int categoryId) throws SQLException {
		boolean result = false;
		Connection con = dc.getConn();
		String sql = "update category set category_status = 'N',"
				+ " category_image = null, input_date = null "
				+ "where category_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, categoryId);
		int rowCount = pstmt.executeUpdate();
		
		try(con; pstmt;){
			if(rowCount > 0) {
				result = true;
			}
		}
		return result;
	}

}