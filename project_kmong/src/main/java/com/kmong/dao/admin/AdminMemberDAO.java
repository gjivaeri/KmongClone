package com.kmong.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.AdminVO;
import com.kmong.vo.admin.AdminMemberVO;

public class AdminMemberDAO {
	private static AdminMemberDAO amDAO;
	DbConnectionDBCP dc;

	private AdminMemberDAO() {
		dc = DbConnectionDBCP.getInstance();
	}

	public static AdminMemberDAO getInstance() {
		if (amDAO == null) {
			amDAO = new AdminMemberDAO();
		}
		return amDAO;
	}

	public AdminMemberVO selectMember(int id, String exp) throws SQLException {
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();
		sql.append("select member_id, email, nick, join_date, c.category_name");
		sql.append(" from member m");
		sql.append(" join category c");
		sql.append(" on c.category_id = m.category_id");
		sql.append(" where member_id = ? and expert=?");

		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, id);
		pstmt.setString(2, exp);
		ResultSet rs = pstmt.executeQuery();
		AdminMemberVO amVO = null;

		try (con; pstmt; rs;) {
			while (rs.next()) {
				amVO = new AdminMemberVO();
				amVO.setMemberId(rs.getInt("member_id"));
				amVO.setEmail(rs.getString("email"));
				amVO.setCategoryName(rs.getString("category_name"));
				amVO.setNick(rs.getString("nick"));
				amVO.setJoinDate(rs.getDate("join_date"));
			}
		}
		return amVO;
	}

	public List<String> selectInterests(int memberId) throws SQLException {
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();
		sql.append("select c.category_name");
		sql.append(" from interest i");
		sql.append(" join category c");
		sql.append(" on i.category_id = c.category_id");
		sql.append(" where member_id = ?");

		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, memberId);
		ResultSet rs = pstmt.executeQuery();
		List<String> interests = new ArrayList<String>();

		try (con; pstmt; rs;) {
			while (rs.next()) {
				interests.add(rs.getString("category_name"));
			}
			;
		}
		return interests;
	}

	public boolean deleteMember(int memberId) throws SQLException {
		boolean result = false;
		Connection con = dc.getConn();
		String sql = "update member set withdrawal_status = 'Y' where member_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, memberId);
		int rowCount = pstmt.executeUpdate();

		try (con; pstmt;) {
			if (rowCount > 0) {
				result = true;
			}
		}
		return result;
	}
}
