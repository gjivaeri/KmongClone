package com.kmong.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.admin.AdminOrdersVO;

public class AdminOrderDAO {
	private static AdminOrderDAO aoDAO;
	DbConnectionDBCP dc;

	private AdminOrderDAO() {
		dc = DbConnectionDBCP.getInstance();
	}

	public static AdminOrderDAO getInstance() {
		if (aoDAO == null) {
			aoDAO = new AdminOrderDAO();
		}
		return aoDAO;
	}

	public AdminOrdersVO selectDetailOrder(int orderId) throws SQLException {
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();

		sql.append(
				"select o.order_id, o.post_id, p.title, p.nick exp, m.nick nonexp, p.price, o.order_date, o.order_status");
		sql.append(" from orders o");
		sql.append(" join (select exp.nick, p.title, p.post_id, p.price");
		sql.append(" from post p");
		sql.append(" join member exp");
		sql.append(" on exp.member_id = p.member_id) p");
		sql.append(" on p.post_id = o.post_id");
		sql.append(" join member m");
		sql.append(" on m.member_id = o.member_id");
		sql.append(" where o.order_id = ?");

		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, orderId);
		ResultSet rs = pstmt.executeQuery();
		AdminOrdersVO aOVO = null;

		try (con; pstmt; rs;) {
			while (rs.next()) {
				aOVO = new AdminOrdersVO();
				aOVO.setOrderId(rs.getInt("order_id"));
				aOVO.setPostId(rs.getInt("post_id"));
				aOVO.setTitle(rs.getString("title"));
				aOVO.setExpert(rs.getString("exp"));
				aOVO.setUser(rs.getString("nonexp"));
				aOVO.setPrice(rs.getInt("price"));
				aOVO.setOrderDate(rs.getDate("order_date"));
				aOVO.setStatus(rs.getString("order_status"));
			}
		}
		return aOVO;
	}

	public boolean deleteOrder(int orderId) throws SQLException {
		boolean result = false;
		Connection con = dc.getConn();
		String sql = "update orders set order_status = 'N' where order_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, orderId);
		int rowCount = pstmt.executeUpdate();

		try (con; pstmt;) {
			if (rowCount > 0) {
				result = true;
			}
		}
		return result;
	}
}// class
