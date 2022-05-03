package com.kmong.dao.orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.ExpertOrderVO;
import com.kmong.vo.MemberVO;
import com.kmong.vo.OrdersVO;

public class OrdersDAO {
	
	DbConnectionDBCP dc;
	
	
	private OrdersDAO() {
		dc = DbConnectionDBCP.getInstance();
	}
	
	private static OrdersDAO instance;
	public static OrdersDAO getInstance() {
		if(instance == null) {
			instance = new OrdersDAO();
		}
		return instance;
	}
	
	public void insertOrders(OrdersVO ovo) throws SQLException {
		
		Connection con =  dc.getConn();
		String sql = "insert into orders(order_finish_date,member_id,post_id) values(?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, ovo.getOrderFinishDate());
		pstmt.setInt(2, ovo.getMemberId());
		pstmt.setInt(3, ovo.getPostId());
	
		try(con;pstmt;) {
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				System.out.println("InsertOrders success");
			}
		}	
	}
	
	public void updateOrdersCancel(OrdersVO ovo) throws SQLException {
		
		Connection con =  dc.getConn();
		String sql = "update orders set order_status=?, order_finish_date = sysdate where order_id = ? ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, ovo.getOrderStatus());
		pstmt.setInt(2, ovo.getOrderId());
		
		try(con;pstmt;) {
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				System.out.println("updateOrdersCancel success");
			}
		}	
	}
	
	public void updateOrderStatus(ExpertOrderVO eov) throws SQLException {
		
		Connection con =  dc.getConn();
		String sql = "update orders set order_status=?, order_finish_date = sysdate where order_id = ? ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, eov.getOrderStatus());
		pstmt.setInt(2, eov.getOrderId());
		
		try(con;pstmt;) {
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				System.out.println("updateOrdersStatus success");
			}
		}
	}
	
	public List<OrdersVO> selectRequestedOrdersRange(String startDate,String endDate, String keyword, String orderStatus,int memberId) throws SQLException {
		Connection con = dc.getConn();
		String sql = "select orders.post_id post_id,order_id,post_img from orders, post where (orders.post_id = post.post_id) "
				+ "and order_date between to_date( ? ,'MM-DD-YYYY')and to_date( ? ,'MM-DD-YYYY')+1 and post.title like '%'||?||'%'  and order_status = ? "
				+ "and orders.member_id= ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, startDate);
		pstmt.setString(2, endDate);
		pstmt.setString(3, keyword);
		pstmt.setString(4, orderStatus);
		pstmt.setInt(5, memberId);
		
		ResultSet rs = pstmt.executeQuery();
		try (con;pstmt;rs;) {
			List<OrdersVO> list = new ArrayList<OrdersVO>();
			OrdersVO ovo = null;
			while (rs.next()) {
				ovo = new OrdersVO();
				ovo.setPostId(rs.getInt("post_id"));
				ovo.setOrderId(rs.getInt("order_id"));
				ovo.setOrderImg(rs.getString("post_img"));
				
				list.add(ovo);
			}
			return list;
		}
	}
		
		public List<ExpertOrderVO> selectExpertRequestedOrdersRange(String startDate,String endDate, String keyword, String orderStatus,int memberId) throws SQLException {
			Connection con = dc.getConn();
			String sql = "select orders.post_id post_id, order_id, post_img, nick, order_date from orders,post,member "
					+ "where (orders.post_id = post.post_id and  member.member_id = orders.member_id) "
					+ "and order_status = ? and post.member_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, orderStatus);
			pstmt.setInt(2, memberId);
			
			ResultSet rs = pstmt.executeQuery();
			try (con;pstmt;rs;) {
				List<ExpertOrderVO> list = new ArrayList<ExpertOrderVO>();
				ExpertOrderVO eov = null;
				while (rs.next()) {
					eov = new ExpertOrderVO();
					
					eov.setPostId(rs.getInt("post_id"));
					
					eov.setOrderId(rs.getInt("order_id"));
					eov.setPostImg(rs.getString("post_img"));
					eov.setMemberNick(rs.getString("nick"));
					eov.setOrderDate(rs.getString("order_date"));
					
					list.add(eov);
				}
				return list;
			}
		}
		
		public boolean selectMemberExpert(int memberId) throws SQLException {
			boolean flag = false;
			String sql = "select expert from member where member_id = ?";
			Connection con = dc.getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberId);
			ResultSet rs = pstmt.executeQuery();
			try(con;pstmt;rs;) {
				String expert = "";
				while(rs.next()) {
					expert = rs.getString("expert");
					if (expert.equals("Y")) {
						flag = true;
					}
				}
				return flag;
			}
		}
		
		public MemberVO selectMemberById(int memberId) throws SQLException {
			String sql = " select nick,user_img from member where member_id = ?";
			Connection con = dc.getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberId);
			ResultSet rs = pstmt.executeQuery();
			try(con;pstmt;rs;) {
				MemberVO mVO = null;
				while(rs.next()) {
					mVO = new MemberVO();
					mVO.setNick(rs.getString("nick"));
					mVO.setUser_img(rs.getString("user_img"));			
				}
				return mVO;
			}
		}

}
