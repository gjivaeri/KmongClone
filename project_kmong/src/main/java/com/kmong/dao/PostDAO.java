package com.kmong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
					.append("select o.order_id, m.nick, p.post_id, p.member_id, p.price, p.term, p.star_avg, p.category_id, p.title, p.summary, p.description, p.post_img, to_char(p.post_date,'yyyy-mm-dd') post_date	")
					.append("from post p, member m, orders o	")
					.append("where (p.member_id(+)=m.member_id) and (m.member_id(+)=o.member_id) and p.post_id=?	");
					//.append("where (p.member_id(+)=m.member_id) and p.post_id=?	");
			
			pstmt=con.prepareStatement(selectPost.toString());
			pstmt.setInt(1, postId);
		
			rs=pstmt.executeQuery();
				
			Map<String, String> map = new HashMap<String, String>();
			while(rs.next()) {
				
				map.put("order_id", Integer.toString(rs.getInt("order_id")));
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
	 * 별점과 리뷰 추가
	 * @param cVO
	 * @throws SQLException
	 */
	public void insertComments(CommentsVO cVO)throws SQLException {
		Connection con = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	    	con=dbcp.getConn();
	    	
	    	String insertComments=
	    			"insert into comments(comment_id, member_id, review, star, post_id) values(comment_seq.nextval,?,?,?,?)";
	    	pstmt=con.prepareStatement(insertComments);
	    	
	    	pstmt.setInt(1, cVO.getMemberId());
	    	pstmt.setString(2, cVO.getReview());
	    	pstmt.setDouble(3, cVO.getStar());
	    	pstmt.setInt(4, cVO.getPostId());
	    	
	    	pstmt.executeUpdate();
	    }finally {
	    	dbcp.dbClose(null, pstmt, con);
	    }

	}//insertConmments 
	
	public void insertOrder(OrdersVO oVO)throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con=dbcp.getConn();
			System.out.println("DB연결 성공");
			
			String insertOrder=
					"insert into orders(member_id, post_id) values(?,?)	";
			pstmt=con.prepareStatement(insertOrder);
			
			pstmt.setInt(1, oVO.getMemberId());
			pstmt.setInt(2, oVO.getPostId());
			
			pstmt.executeUpdate();
		}finally {
			dbcp.dbClose(null, pstmt, con);
		}
		
	}//insertConmments 

}