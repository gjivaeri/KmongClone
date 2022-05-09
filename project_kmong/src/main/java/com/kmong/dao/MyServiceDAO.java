package com.kmong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmong.vo.CategoryVO;
import com.kmong.vo.CommentsVO;
import com.kmong.vo.MemberVO;
import com.kmong.vo.PostVO;
import com.kmong.vo.UserIdentifyVO;

public class MyServiceDAO {

	private static MyServiceDAO pDAO;
	DbConnectionDBCP dbcp = DbConnectionDBCP.getInstance();

	private MyServiceDAO() {

	}

	public static MyServiceDAO getInstance() {
		if (pDAO == null) {
			pDAO = new MyServiceDAO();
		}
		return pDAO;
	}// getInstance

	/**
	 * �굹�쓽 �꽌鍮꾩뒪 �벑濡앺븯湲�
	 * 
	 * @param pVO
	 * @throws SQLException
	 */
	public void insertMyService(PostVO pVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			StringBuilder insertMyService = new StringBuilder();
			con = dbcp.getConn();

			insertMyService.append(
					"insert into post(post_id, member_id, title, summary, price, term, description, post_img, category_id)	")
					.append("values(post_seq.nextval,?,?,?,?,?,?,?,?)	");

			pstmt = con.prepareStatement(insertMyService.toString());

			pstmt.setInt(1, pVO.getMemberId());
			pstmt.setString(2, pVO.getTitle());
			pstmt.setString(3, pVO.getSummary());
			pstmt.setInt(4, pVO.getPrice());
			pstmt.setInt(5, pVO.getTerm());
			pstmt.setString(6, pVO.getDescription());
			pstmt.setString(7, pVO.getPostImg());
			pstmt.setInt(8, pVO.getCategoryId());

			pstmt.executeUpdate();

		} finally {
			dbcp.dbClose(null, pstmt, con);
		}
	}// insertMyService

	/**
	 * �쟾臾멸��쓽 �꽌鍮꾩뒪 由ъ뒪�듃(�씠誘몄�, �젣紐�, �궇吏�)議고쉶
	 * 
	 * @param memberId
	 * @return
	 * @throws SQLException
	 */
	public List<PostVO> selectMyServiceList(int memberId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<PostVO> list = new ArrayList<PostVO>();

		try {
			con = dbcp.getConn();
			System.out.println("DB�뿰�룞 �꽦怨�");

			String selectMyServiceList = "select post_id, post_img, title, to_char(post_date,'yyyy-mm-dd') post_date from post where member_id=? and post_status='Y'	";
			pstmt = con.prepareStatement(selectMyServiceList);
			pstmt.setInt(1, memberId);

			rs = pstmt.executeQuery();

			PostVO pVO = null;
			while (rs.next()) {
				pVO = new PostVO();
				pVO.setPostId(rs.getInt("post_id"));
				pVO.setPostImg(rs.getString("post_img"));
				pVO.setTitle(rs.getString("title"));
				pVO.setPostDate(rs.getString("post_date"));

				list.add(pVO);
			}

		} finally {
			dbcp.dbClose(rs, pstmt, con);
		}
		return list;
	}// selectMyServiceList

	public List<PostVO> selectUpdateMyServiceList(int postId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<PostVO> list = new ArrayList<PostVO>();

		try {
			con = dbcp.getConn();
			System.out.println("DB�뿰�룞 �꽦怨�");

			String selectMyServiceList = "select post_id, post_img, title, summary, price, term, description, category_id from post where post_id=?";
			pstmt = con.prepareStatement(selectMyServiceList);
			pstmt.setInt(1, postId);

			rs = pstmt.executeQuery();

			PostVO pVO = null;
			while (rs.next()) {
				pVO = new PostVO();
				pVO.setPostId(rs.getInt("post_id"));
				pVO.setPostImg(rs.getString("post_img"));
				pVO.setTitle(rs.getString("title"));
				pVO.setSummary(rs.getString("summary"));
				pVO.setPrice(rs.getInt("price"));
				pVO.setTerm(rs.getInt("term"));
				pVO.setDescription(rs.getString("description"));
				pVO.setCategoryId(rs.getInt("category_id"));

				list.add(pVO);
			}

		} finally {
			dbcp.dbClose(rs, pstmt, con);
		}
		return list;
	}// selectUpdateMyServiceList

	/**
	 * �꽑�깮�븳 post_id 寃뚯떆湲��쓽 �젙蹂� �닔�젙
	 * 
	 * @param pVO
	 * @return 寃뚯떆湲��쓽 �젙蹂� �닔�젙 �뿬遺�
	 * @throws SQLException
	 */
	public boolean updateMyService(PostVO pVO) throws SQLException {
		boolean flag = false;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			StringBuilder updateMyService = new StringBuilder();
			con = dbcp.getConn();
			System.out.println("DB�뿰�룞 �꽦怨�");

			updateMyService.append("update post	")
					.append("set title=?, summary=?, price=?, term=?, description=?, post_img=?, category_id=?	")
					.append("where post_id=?	");

			pstmt = con.prepareStatement(updateMyService.toString());
			pstmt.setString(1, pVO.getTitle());
			pstmt.setString(2, pVO.getSummary());
			pstmt.setInt(3, pVO.getPrice());
			pstmt.setInt(4, pVO.getTerm());
			pstmt.setString(5, pVO.getDescription());
			pstmt.setString(6, pVO.getPostImg());
			pstmt.setInt(7, pVO.getCategoryId());
			pstmt.setInt(8, pVO.getPostId());

			if (pstmt.executeUpdate() > 0) {
				flag = true;
			}

		} finally {
			dbcp.dbClose(null, pstmt, con);
		}

		return flag;
	}// updateMyService

	/**
	 * �꽑�깮�븳 post_id�쓽 寃뚯떆湲� �궘�젣
	 * 
	 * @param postId
	 * @return 寃뚯떆湲��쓽 �궘�젣 �뿬遺�
	 * @throws SQLException
	 */
	public boolean deleteMyService(int postId) throws SQLException {// comments table怨쇱쓽 愿�怨꾨븣臾몄뿉 delete媛� �릺吏� �븡怨� update濡� 泥섎━
		boolean flag = false;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dbcp.getConn();
			System.out.println("DB�뿰�룞 �꽦怨�");

			String deleteMyService = "update post set post_status='N' where post_id=?";
			pstmt = con.prepareStatement(deleteMyService);
			pstmt.setInt(1, postId);

			if (pstmt.executeUpdate() > 0) {
				flag = true;
			}

		} finally {
			dbcp.dbClose(null, pstmt, con);
		}

		return flag;
	}// updateMyService
}