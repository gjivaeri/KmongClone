package com.kmong.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.admin.AdminPostsVO;

public class AdminPostDAO {
	private static AdminPostDAO apDAO;
	DbConnectionDBCP dc;
	
	private AdminPostDAO() {
		dc = DbConnectionDBCP.getInstance();
	}
	
	public static AdminPostDAO getInstance() {
		if(apDAO==null) {
			apDAO = new AdminPostDAO();
		}
		return apDAO;
	}
	
	public AdminPostsVO selectDetailPost(int postId) throws SQLException {
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();
		AdminPostsVO post = new AdminPostsVO();

		sql.append("select p.title, m.email, c.category_name, p.post_date, p.price, p.post_img, p.summary, p.description");
		sql.append(" from post p");
		sql.append(" join member m");
		sql.append(" on m.member_id = p.member_id");
		sql.append(" join category c");
		sql.append(" on c.category_id = p.category_id");
		sql.append(" where post_id = ?");

		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, postId);
		ResultSet rs = pstmt.executeQuery();
		
		try(con; pstmt; rs){
			while(rs.next()) {
				post.setTitle(rs.getString("title"));
				post.setEmail(rs.getString("email"));
				post.setCategoryName(rs.getString("category_name"));
				post.setPostDate(rs.getDate("post_date"));
				post.setPrice(rs.getInt("price"));
				post.setImg(rs.getString("post_img"));
				post.setSummary(rs.getString("summary"));
				post.setDescription(rs.getString("description"));		
			}
		}
		return post;
	}
	
	

}
/*
 * + selectDetailPost(int): postVO //게시글상세페이지 
 * + updatePost(postVO): boolean +
 * updatePost(postVO, char): boolean //게시글 삭제
 */