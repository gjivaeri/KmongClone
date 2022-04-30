package com.kmong.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	public int insertCategory(String name, String image) throws SQLException{
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into category(category_id, category_name, category_image)");
		sql.append(" values((select NVL(MAX(category_id), 0)+1 from category), ?, ?)");
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		
		pstmt.setString(1, name);
		pstmt.setString(2, image);
		
		try(con; pstmt;){
			return pstmt.executeUpdate();
		}
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
		String sql = "update category set category_status = 'N' where category_id = ?";
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
/*
 * + selectAllCategory(): List<categoryVO> //모든 카테고리 조회 +
 * selectRegisteredCategory(): int //등록된 카테고리 수 
 * + selectDetailCategory(int):
 * categoryVO 
 * + insertCategory(String, String): void //카테고리 추가
 */