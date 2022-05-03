package com.kmong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmong.vo.CommentsVO;

public class CommentsDAO {
	DbConnectionDBCP dc ;
	private static CommentsDAO instance;
	private CommentsDAO() {
		dc = DbConnectionDBCP.getInstance();
	}
	public static CommentsDAO getInstance() {
		if (instance == null) {
			instance  = new CommentsDAO();
		}
		return instance;
	}
	
	public void insertComments(CommentsVO cvo) throws SQLException {
		String sql = "insert into comments(member_id,review,star,post_id) values(?,?,?,?)";
		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		try(con;pstmt;) {
			pstmt.setInt(1, cvo.getMemberId());
			pstmt.setString(2, cvo.getReview());
			pstmt.setDouble(3, cvo.getStar());
			pstmt.setInt(4, cvo.getPostId());
			pstmt.execute();
			updateAvgStar(cvo.getPostId());

		}
	}
	
	public List<CommentsVO> selectCommentsAll(int postId) throws SQLException {
		String sql = "select nick, star, review, to_char( input_date,'YY.MM.DD HH24:mm')input_date from member, comments where (member.member_id = comments.member_id) and post_id= ? ";
		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, postId);
		ResultSet rs = pstmt.executeQuery();
		try(con;pstmt;rs;) {
			ArrayList<CommentsVO> list = new ArrayList<CommentsVO>();
			CommentsVO cVO= null;
			while(rs.next()) {
				cVO = new CommentsVO();
				cVO.setNick(rs.getString("nick"));
				cVO.setStar(rs.getDouble("star"));
				cVO.setReview(rs.getString("review"));
				cVO.setInputDate(rs.getString("input_date"));
				list.add(cVO);
			}
			return list;
		}
	}
	
	public String selectNickByMemberId(int memberId) throws SQLException {
		String nick = null;
		String sql = "select nick from member where member_id = ?";
		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, memberId);
		ResultSet rs = pstmt.executeQuery();
		try(con;pstmt;rs;) {
			while (rs.next()) {
				nick = rs.getString("nick");
				
			}
			return nick;
		}
	}
	
	public boolean isWriteComment(int memberId, int postId) throws SQLException{
		String sql1 = "select count(comment_id) from comments,orders where (comments.post_id = orders.post_id) and comments.member_id=? and comments.post_id=?";
				
		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql1);
		pstmt.setInt(1, memberId);
		pstmt.setInt(2, postId);
		ResultSet rs = pstmt.executeQuery();
		int countComment = 0;
		int countOrder = getCountOrder(memberId,postId);
		boolean flag = false;
	
		try(con;pstmt;rs;) {
			while(rs.next()) {
				countComment = rs.getInt(1);
			}	

		}
		if(countOrder > countComment) {
			flag = true;
		}
		return flag;
		
	}
	
	private void updateAvgStar(int postId) throws SQLException {
		String sql = "update post set star_avg = (select avg(star) from comments where post_id= ?) where post_id = ?";
		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, postId);
		pstmt.setInt(2, postId);
		try(con;pstmt;) {
			pstmt.executeUpdate();
		}
	}
	
	public double selectAvgStar(int postId) throws SQLException {
		String sql = "select star_avg from post where post_id = ?";
		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, postId);
		ResultSet rs = pstmt.executeQuery();
		double result = 0;
		try(con;pstmt;rs;) {
			if (rs.next()) {
				result = rs.getDouble(1);
			}
			return result;
		}
	}
	
	private int getCountOrder(int memberId,int postId) throws SQLException {
		String sql = "select count(order_id) from orders where member_id = ? and post_id=?";
		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, memberId);
		pstmt.setInt(2, postId);
		ResultSet rs = pstmt.executeQuery();
		int countOrder = 0;
		try(con;pstmt;rs;) {
	
			while(rs.next()) {
				countOrder = rs.getInt(1);
			}
			return countOrder;
		}
	}
	
	

	

	

}
