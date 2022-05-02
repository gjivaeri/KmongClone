package com.kmong.dao.admin;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.AdminVO;
import com.kmong.vo.CategoryVO;
import com.kmong.vo.MemberVO;
import com.kmong.vo.PostVO;
import com.kmong.vo.admin.AdminMemberVO;
import com.kmong.vo.admin.AdminOrdersVO;
import com.kmong.vo.admin.AdminPostsVO;

import oracle.jdbc.proxy.annotation.Post;

public class AdminDAO {

	DbConnectionDBCP dc;
	private static AdminDAO aDAO;

	private AdminDAO() {
		dc = DbConnectionDBCP.getInstance();
	}

	public static AdminDAO getInstance() {
		if (aDAO == null) {
			aDAO = new AdminDAO();
		} // end if
		return aDAO;
	}

	/**
	 * 관리자 로그인 구현을 위한 계정조회
	 * 
	 * @param admId
	 * @param admPw
	 * @return
	 * @throws SQLException
	 */
	public boolean selectAdminLogin(String admId, String admPw) throws SQLException {

		boolean loginFlag = false;
		String query = "select count(*) from admin where id=? and pass=?";
		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, admId);
		pstmt.setString(2, admPw);

		ResultSet rs = pstmt.executeQuery();

		try (con; pstmt; rs;) {
			if (rs.next() && rs.getInt(1) > 0) {
				loginFlag = true;
			}
		}
		return loginFlag;
	}

	/**
	 * 관리자 계정 비밀번호 업데이트
	 * 
	 * @param avo
	 * @return
	 * @throws SQLException
	 */
	public boolean updateAdminPass(AdminVO avo) throws SQLException {
		int cnt = 0;
		boolean flag = false;

		String sql = "update admin set pass=? where id=?";
		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, avo.getPass());
		pstmt.setString(2, avo.getId());
		cnt = pstmt.executeUpdate();

		try (con; pstmt;) {
			if (cnt > 0) {
				flag = true;
			}
		}
		return flag;
	}

	/**
	 * 전체 개수 조회 - post
	 * 
	 * @param table
	 * @return
	 * @throws SQLException
	 */
	public int getAllCount(String table) throws SQLException {
		int cnt = 0;
		StringBuilder sql = new StringBuilder();

		Connection con = dc.getConn();
		sql.append("select count(*) from ");
		sql.append(table);
		if (!table.toLowerCase().equals("orders")) {
			sql.append(" where ");
			sql.append(table);
			sql.append("_status <> 'N' ");
		}
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		ResultSet rs = pstmt.executeQuery();

		try (con; pstmt; rs;) {
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		}
		return cnt;
	};

	/**
	 * 전체 개수 조회 - member, orders
	 * 
	 * @param table
	 * @param val
	 * @return
	 * @throws SQLException
	 */
	public int getAllCount(String table, String val) throws SQLException {
		int cnt = 0;
		String condition = "";
		String deletedStatus = "";
		String flag = "";

		switch (table.toLowerCase()) {
		case "member":
			condition = "expert";
			deletedStatus = "withdrawal_status";
			flag = " 'Y' ";
			break;
		case "orders":
			condition = "order_status";
			break;
		}

		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from ");
		sql.append(table);
		sql.append(" where ");
		sql.append(condition);
		sql.append("=? ");
		if (!table.toLowerCase().equals("orders")) {
			sql.append(" and ");
			sql.append(deletedStatus);
			sql.append(" <> ");
			sql.append(flag);
		}

		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, val);
		ResultSet rs = pstmt.executeQuery();

		try (con; pstmt; rs;) {
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		}
		return cnt;
	};

	/**
	 * 오늘 개수 조회 - post
	 * 
	 * @param table
	 * @return
	 * @throws SQLException
	 */
	public int getTodayCount(String table) throws SQLException {
		int cnt = 0;
		String dateCol = table.toLowerCase().equals("orders") ? "order" : table;

		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from ");
		sql.append(table);
		sql.append(" where to_char(");
		sql.append(dateCol);
		sql.append("_date, 'YYYY-MM-DD') = to_char(sysdate, 'YYYY-MM-DD') ");
		if (!table.toLowerCase().equals("orders")) {
			sql.append(" and ");
			sql.append(table);
			sql.append("_status <> 'N'");
		}

		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		ResultSet rs = pstmt.executeQuery();

		try (con; pstmt; rs;) {
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		}
		return cnt;
	};

	/**
	 * 오늘 개수 조회 - orders, member
	 * 
	 * @param table
	 * @param val
	 * @return
	 * @throws SQLException
	 */

	public int getTodayCount(String table, String val) throws SQLException {
		int cnt = 0;
		String dateCol = "";
		String condition = "";
		String deleteStatus = "";

		switch (table.toLowerCase()) {
		case "member":
			condition = "expert";
			dateCol = "join_date";
			deleteStatus = "withdrawal_status";
			break;
		case "orders":
			condition = "order_status";
			dateCol = "order_date";
			break;
		}

		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from ");
		sql.append(table);
		sql.append(" where to_char(");
		sql.append(dateCol);
		sql.append(", 'YYYY-MM-DD') = to_char(sysdate, 'YYYY-MM-DD') and ");
		sql.append(condition);
		sql.append("=? ");
		if (!table.toLowerCase().equals("orders")) {
			sql.append(" and ");
			sql.append(deleteStatus);
			sql.append("<>'N'");
		}

		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, val);
		ResultSet rs = pstmt.executeQuery();

		try (con; pstmt; rs;) {
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		}
		return cnt;
	};

	/**
	 * 전체 게시글 조회
	 * 
	 * @param opt
	 * @return
	 * @throws SQLException
	 */
	public List<AdminPostsVO> selectAllPost(String opt) throws SQLException {

		List<AdminPostsVO> list = new ArrayList<AdminPostsVO>();
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();

		sql.append("select * ");
		sql.append(" from(select rownum rnum, p.post_id, c.category_name, p.title, m.email, p.post_date");
		sql.append(" from(select * from post where post_status <> 'N' order by post_date desc, post_id desc) p");
		sql.append(" join member m");
		sql.append(" on m.member_id = p.member_id");
		sql.append(" join category c");
		sql.append(" on c.category_id = p.category_id)");
		if (opt != null) {
			sql.append(" where title like ? or category_name like ? or email like ? ");
			sql.append(" or to_char(post_id) like ? or to_char(rnum) like ? ");
		}

		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		if (opt != null) {
			pstmt.setString(1, '%' + opt + '%');
			pstmt.setString(2, '%' + opt + '%');
			pstmt.setString(3, '%' + opt + '%');
			pstmt.setString(4, opt);
			pstmt.setString(5, opt);
		}

		ResultSet rs = pstmt.executeQuery();

		try (con; pstmt; rs;) {
			while (rs.next()) {
				AdminPostsVO adPosts = new AdminPostsVO();
				adPosts.setRnum(rs.getInt("rnum"));
				adPosts.setPostId(rs.getInt("post_id"));
				adPosts.setCategoryName(rs.getString("category_name"));
				adPosts.setTitle(rs.getString("title"));
				adPosts.setEmail(rs.getString("email"));
				adPosts.setPostDate(rs.getDate("post_date"));
				list.add(adPosts);
			} // while
		}
		return list;
	}// selectAllPost;

	/**
	 * 전체 멤버 조회
	 * 
	 * @param opt
	 * @param exp
	 * @return
	 * @throws SQLException
	 */
	public List<AdminMemberVO> selectAllMember(String opt, String exp) throws SQLException {
		List<AdminMemberVO> list = new ArrayList<AdminMemberVO>();
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();

		sql.append("select m.member_id, m.email, m.nick, c.category_name, m.join_date");
		sql.append(" from member m");
		sql.append(" join category c");
		sql.append(" on c.category_id = m.category_id");
		sql.append(" where expert = ? and withdrawal_status <> 'Y'");
		if (opt != null) {
			sql.append(" and nick like ? or m.email like ? or c.category_name like ? or to_char(member_id) like ?");
		}
		sql.append(" order by join_date desc, member_id");

		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, exp);

		if (opt != null) {
			pstmt.setString(2, '%' + opt + '%');
			pstmt.setString(3, '%' + opt + '%');
			pstmt.setString(4, '%' + opt + '%');
			pstmt.setString(5, opt);
		}

		ResultSet rs = pstmt.executeQuery();

		try (con; pstmt; rs;) {
			while (rs.next()) {
				AdminMemberVO aMVO = new AdminMemberVO();
				aMVO.setMemberId(rs.getInt("member_id"));
				aMVO.setEmail(rs.getString("email"));
				aMVO.setNick(rs.getString("nick"));
				aMVO.setCategoryName(rs.getString("category_name"));
				aMVO.setJoinDate(rs.getDate("join_date"));

				list.add(aMVO);
			}
		}
		return list;
	}

	/**
	 * 전체 주문 조회
	 * 
	 * @param opt
	 * @return
	 * @throws SQLException
	 */
	public List<AdminOrdersVO> selectAllOrder(String opt) throws SQLException {
		List<AdminOrdersVO> list = new ArrayList<AdminOrdersVO>();
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;

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
		if (opt != null) {
			sql.append(" where title like ? or p.nick like ? or m.nick like ? or order_status like ?");
			sql.append(" or to_char(o.order_id) like ? or to_char(o.post_id) like ?");
		}
		sql.append(" order by order_date desc, order_status");

		pstmt = con.prepareStatement(sql.toString());

		if (opt != null) {
			pstmt.setString(1, '%' + opt + '%');
			pstmt.setString(2, '%' + opt + '%');
			pstmt.setString(3, '%' + opt + '%');
			pstmt.setString(4, '%' + opt + '%');
			pstmt.setString(5, opt);
			pstmt.setString(6, opt);
		}

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			AdminOrdersVO aOVO = new AdminOrdersVO();
			aOVO.setOrderId(rs.getInt("order_id"));
			aOVO.setPostId(rs.getInt("post_id"));
			aOVO.setTitle(rs.getString("title"));
			aOVO.setExpert(rs.getString("exp"));
			aOVO.setUser(rs.getString("nonexp"));
			aOVO.setPrice(rs.getInt("price"));
			aOVO.setOrderDate(rs.getDate("order_date"));
			aOVO.setStatus(rs.getString("order_status"));

			list.add(aOVO);
		}

		return list;
	}

	/**
	 * 전체 카테고리 조회
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<CategoryVO> selectAllCategory() throws SQLException {
		Connection con = dc.getConn();
		String sql = "select * from category where category_status <> 'N'";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<CategoryVO> list = new ArrayList<CategoryVO>();
		CategoryVO cVO = null;

		try (con; pstmt; rs;) {
			while (rs.next()) {
				cVO = new CategoryVO();
				cVO.setCategoryId(rs.getInt("category_id"));
				cVO.setCategoryName(rs.getString("category_name"));
				cVO.setCategoryImage(rs.getString("category_image"));
				cVO.setCategoryStatus(rs.getString("category_status"));

				list.add(cVO);
			}
		}
		return list;
	}

	public String encryptPassword(String pw) {
			String base = pw;
			StringBuffer hexString = new StringBuffer();
	        try{
	            MessageDigest digest = MessageDigest.getInstance("SHA-256");
	            byte[] hash = digest.digest(base.getBytes("UTF-8"));
	            for (int i = 0; i < hash.length; i++) {
	                String hex = Integer.toHexString(0xff & hash[i]);
	                if(hex.length() == 1) hexString.append('0');
	                hexString.append(hex);
	            }
	        } catch(Exception ex){
	            throw new RuntimeException(ex);
	        }
	        System.out.println(hexString.toString());
	        return hexString.toString();
	}


};// class
