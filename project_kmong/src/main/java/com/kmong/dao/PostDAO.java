package com.kmong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kmong.vo.CategoryVO;
import com.kmong.vo.CommentsVO;
import com.kmong.vo.MemberVO;
import com.kmong.vo.OrdersVO;
import com.kmong.vo.PostVO;

public class PostDAO {

	private static PostDAO pDAO;
	DbConnectionDBCP dbcp = DbConnectionDBCP.getInstance();
	private PostDAO() {
		
	}
	
	public static PostDAO getInstance() {
		if(pDAO == null) {
			pDAO =  new PostDAO();
		}
		return pDAO;
	}//getInstance
	
	
	/**
	 * post_id에 대한 post정보 불러오기
	 * @param postId
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String, String>> selectPost(int postId)throws SQLException {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		
	    List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			
		try {
			StringBuilder selectPost = new StringBuilder();
			con = dbcp.getConn();
			System.out.println("DB연동 성공");
			selectPost
					.append("select m.nick, m.user_img, p.post_id, p.member_id, p.price, p.term, p.star_avg, p.category_id, p.title, p.summary, p.description, p.post_img, to_char(p.post_date,'yyyy-mm-dd') post_date	")
					.append("from post p, member m	")
					.append("where (p.member_id(+)=m.member_id) and p.post_id=?	");
			
			pstmt=con.prepareStatement(selectPost.toString());
			pstmt.setInt(1, postId);
		
			rs=pstmt.executeQuery();
				
			Map<String, String> map = new HashMap<String, String>();
			
			while(rs.next()) {
				
				map.put("user_img", rs.getString("user_img"));
				map.put("member_id", Integer.toString(rs.getInt("member_id")));
				map.put("post_id", Integer.toString(rs.getInt("post_id")));
				map.put("price", Integer.toString(rs.getInt("price")));
				map.put("term", Integer.toString(rs.getInt("term")));
				map.put("category_id", Integer.toString(rs.getInt("category_id")));
				map.put("title", rs.getString("title"));
				map.put("summary", rs.getString("summary"));
				map.put("post_date", rs.getString("post_date"));
				map.put("description", rs.getString("description"));
				map.put("post_img", rs.getString("post_img"));
				map.put("star_avg", Double.toString(rs.getDouble("star_avg")));
				map.put("nick", rs.getString("nick"));
				list.add(map);
			}
		
		} finally{
			dbcp.dbClose(rs, pstmt, con);
			}
		return list;
	}//selectPost
	
	/**
	 * order__id를 얻기
	 * @param postId
	 * @return
	 * @throws SQLException
	 */
	public OrdersVO selectOrderId(int postId)throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		OrdersVO oVO = new OrdersVO();
		
		try {
			con = dbcp.getConn();
			System.out.println("DB연동 성공");
			String selectOrderId = 
				"select order_id from orders where order_date=(select max(order_date) from orders where post_id=? )	";
			
			pstmt=con.prepareStatement(selectOrderId);
			pstmt.setInt(1, postId);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				oVO.setOrderId(rs.getInt("order_id"));
			}
			
		} finally{
			dbcp.dbClose(rs, pstmt, con);
		}
		return oVO;
	}//selectPost
	
	public void insertOrder(OrdersVO oVO)throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con=dbcp.getConn();
			System.out.println("DB연결 성공");
			
			String insertOrder=
					"insert into orders(order_id, member_id, post_id) values(orders_seq.nextval,?,?)	";
			pstmt=con.prepareStatement(insertOrder);
			
			pstmt.setInt(1, oVO.getMemberId());
			pstmt.setInt(2, oVO.getPostId());
			
			pstmt.executeUpdate();
		}finally {
			dbcp.dbClose(null, pstmt, con);
		}
		
	}//insertConmments 
	
	/**
	 * 주문 성공 페이지에서 나타나는 정보
	 * @param orderId
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String, String>> selectOrders(int orderId)throws SQLException {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		
	    List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			
		try {
			StringBuilder selectOrders = new StringBuilder();
			con = dbcp.getConn();
			System.out.println("DB연동 성공");
			selectOrders
					.append("select o.order_id, p.price, p.title	")
					.append("from post p, orders o	")
					.append("where (p.post_id=o.post_id) and o.order_id=?	");
			
			pstmt=con.prepareStatement(selectOrders.toString());
			pstmt.setInt(1, orderId);
		
			rs=pstmt.executeQuery();
				
			Map<String, String> map = new HashMap<String, String>();
			
			while(rs.next()) {
				
				map.put("order_id", Integer.toString(rs.getInt("order_id")));
				map.put("price", Integer.toString(rs.getInt("price")));
				map.put("title", rs.getString("title"));
				list.add(map);
			}
		
		} finally{
			dbcp.dbClose(rs, pstmt, con);
			}
		return list;
	}//selectPost
	
}