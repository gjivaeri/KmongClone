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
		if(pDAO == null) {
			pDAO =  new MyServiceDAO();
		}
		return pDAO;
	}//getInstance
	
	/**
	 * 아이디를 비교해서 참/거짓
	 * @param uiVO
	 * @return
	 * @throws SQLException
	 */
	public boolean selectCheckAccount(UserIdentifyVO uiVO)throws SQLException{
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    boolean flag = false;
	    try {
	    	con=dbcp.getConn();
	    	System.out.println("DB연결성공");
	    	
	    	String selectCheckAccount=
	    			"select member_id from member where and email=?"; //전문가인지 사용자인지 체크
	    	pstmt=con.prepareStatement(selectCheckAccount);
	    	pstmt.setString(1, uiVO.getEmail());
	    	
	    	rs=pstmt.executeQuery();
	    	if(rs.next()) {
	    		uiVO.setMemberId(rs.getString("member_id"));
	    		flag = true;
	    	}
	    }finally {
	    	dbcp.dbClose(rs, pstmt, con);
	    }
		
		return flag;
	}//selectCheckAccount

	/**
	 * 해당 member의 user_img 가져오기
	 * @param memberId
	 * @return
	 * @throws SQLException
	 */
	public String selectUserImg(int memberId)throws SQLException{
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    String userImg = "";
	    try {
	    	con=dbcp.getConn();
	    	
	    	String selectUserImg = 
	    			"select user_img from member where member_id=?";
	    	pstmt=con.prepareStatement(selectUserImg);
	    	pstmt.setInt(1, memberId);
	    	
	    	rs=pstmt.executeQuery();
	    	if(rs.next()){
	    		userImg=rs.getString("user_img");
	    	}
	    	
	    }finally {
	    	dbcp.dbClose(rs, pstmt, con);
	    }
		return userImg;
	}//selectUserImge
	
	/**
	 * 나의 서비스 등록하기
	 * @param pVO
	 * @throws SQLException
	 */
	public void insertMyService(PostVO pVO)throws SQLException{
		Connection con = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	    	StringBuilder insertMyService = new StringBuilder();
	    	con = dbcp.getConn();
	    	System.out.println("DB연결 성공");
	    	
	    	insertMyService
	    		.append("insert into post(post_id, title, summary, price, term, description, post_img, category_id)	")
	    		.append("values(post_seq.nextval,?,?,?,?,?,?,?)	");
	    		//.append("where member_id=?	");
	    	
	    	pstmt=con.prepareStatement(insertMyService.toString());
	    	
	    	pstmt.setString(1, pVO.getTitle());
	    	//pstmt.setInt(2, pVO.getMemberId());
	    	pstmt.setString(2, pVO.getSummary());
	    	pstmt.setInt(3, pVO.getPrice());
	    	pstmt.setInt(4, pVO.getTerm());
	    	//pstmt.setString(5, pVO.getPostDate());
	    	pstmt.setString(5, pVO.getDescription());
	    	pstmt.setString(6, pVO.getPostImg());
	    	pstmt.setInt(7, pVO.getCategoryId());
	    	//pstmt.setInt(9, pVO.getMemberId());
	    	
	    	pstmt.executeUpdate();
	    
	    }finally {
	    	dbcp.dbClose(null, pstmt, con);
	    }
	}//insertMyService
	
	/**
	 * 모든 카테고리 불러오기
	 * @return list
	 * @throws SQLException
	 */
	public List<CategoryVO> selectAllCategory()throws SQLException{
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    List<CategoryVO> list = new ArrayList<CategoryVO>();
	    
	    try {
	    	con = dbcp.getConn();
	    	System.out.println("DB연동 성공");
	    	
	    	String selectAllCategory=
	    			"select category_name from category";
	    	
	    	pstmt=con.prepareStatement(selectAllCategory);
	    	rs=pstmt.executeQuery();
	    	
	    	CategoryVO cVO=null;
	    	
	    	while(rs.next()) {
	    		cVO = new CategoryVO();
	    		cVO.setCategoryName(rs.getString("category_name"));
	    		
	    		list.add(cVO);
	    	}
	    	
	    }finally {
	    	dbcp.dbClose(rs, pstmt, con);
	    }
		
		return list;
	}//selectAllCategory
	
	/**
	 * 전문가의 서비스 리스트(이미지, 제목, 날짜)조회
	 * @param memberId
	 * @return
	 * @throws SQLException
	 */
	public List<PostVO> selectMyServiceList(int memberId)throws SQLException{
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		
	    List<PostVO> list = new ArrayList<PostVO>();
		
	    try {
			con = dbcp.getConn();
			System.out.println("DB연동 성공");
			
			String selectMyServiceList=
					"select post_id, post_img, title, to_char(post_date,'yyyy-mm-dd') post_date from post where member_id=?";
			pstmt=con.prepareStatement(selectMyServiceList);
			pstmt.setInt(1, memberId);
			
			rs=pstmt.executeQuery();
			
			PostVO pVO = null;
			while(rs.next()) {
				pVO = new PostVO();
				pVO.setPostId(rs.getInt("post_id"));
				pVO.setPostImg(rs.getString("post_img"));
				pVO.setTitle(rs.getString("title"));
				pVO.setPostDate(rs.getString("post_date"));
				
				list.add(pVO);
			}
			
	    }finally {
	    	dbcp.dbClose(rs, pstmt, con);
	    }
		return list;
	}//selectMyServiceList
	
	public List<PostVO> selectUpdateMyServiceList(int postId)throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<PostVO> list = new ArrayList<PostVO>();
		
		try {
			con = dbcp.getConn();
			System.out.println("DB연동 성공");
			
			String selectMyServiceList=
					"select post_id, post_img, title, summary, price, term, description, category_id from post where post_id=?";
			pstmt=con.prepareStatement(selectMyServiceList);
			pstmt.setInt(1, postId);
			
			rs=pstmt.executeQuery();
			
			PostVO pVO = null;
			while(rs.next()) {
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
			
		}finally {
			dbcp.dbClose(rs, pstmt, con);
		}
		return list;
	}//selectUpdateMyServiceList
	
	/**
	 * 선택한 post_id 게시글의 정보 수정 
	 * @param pVO
	 * @return 게시글의 정보 수정 여부
	 * @throws SQLException
	 */
	public boolean updateMyService(PostVO pVO)throws SQLException{
		boolean flag = false;
		
		Connection con = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	    	StringBuilder updateMyService = new StringBuilder();
	    	con = dbcp.getConn();
	    	System.out.println("DB연동 성공");
	    	
	    	updateMyService
	    		.append("update post	")
	    		.append("set title=?, summary=?, price=?, term=?, description=?, post_img=?, category_id=?	")
	    		.append("where post_id=?	");
	    	
	    	pstmt=con.prepareStatement(updateMyService.toString());
	    	pstmt.setString(1, pVO.getTitle());
	    	pstmt.setString(2, pVO.getSummary());
	    	pstmt.setInt(3, pVO.getPrice());
	    	pstmt.setInt(4, pVO.getTerm());
	    	pstmt.setString(5, pVO.getDescription());
	    	pstmt.setString(6, pVO.getPostImg());
	    	pstmt.setInt(7, pVO.getCategoryId());
	    	pstmt.setInt(8, pVO.getPostId());
	    	
	    	if(pstmt.executeUpdate()>0) {
				flag = true;
			}
	    	
	    }finally {
	    	dbcp.dbClose(null, pstmt, con);
	    }
		
		return flag;
	}//updateMyService
	
	/**
	 * 선택한 post_id의 게시글 삭제
	 * @param postId
	 * @return 게시글의 삭제 여부
	 * @throws SQLException
	 */
	public boolean deleteMyService(int postId)throws SQLException{//comments table과의 관계때문에 delete가 되지 않고 update로 처리
		boolean flag = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dbcp.getConn();
			System.out.println("DB연동 성공");
			
			String deleteMyService=
					"update post set title='삭제된 서비스입니다.', summary='', price='', term='', post_date='', description='', star_avg='', post_img='' where post_id=?";
			pstmt=con.prepareStatement(deleteMyService);
			pstmt.setInt(1, postId);
			
			if(pstmt.executeUpdate()>0) {
				flag = true;
			}
			
		}finally {
			dbcp.dbClose(null,pstmt, con);
		}
		
		return flag;
	}//updateMyService
}