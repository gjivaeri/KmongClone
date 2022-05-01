package com.kmong.dao.home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.CategoryVO;
import com.kmong.vo.InterestVO;
import com.kmong.vo.PostVO;


public class MainPageDAO {

	
	private static MainPageDAO mpDAO;
	
	
	private MainPageDAO()  {
		
	}
	
	
	public static MainPageDAO getInstance(){
		if(mpDAO==null) {
			mpDAO=new MainPageDAO();
		}//end if
		return mpDAO;
	}//getInstance
	
	

	
	/**
	 * Çì´õÀÇ ÀüÃ¼ Ä«Å×°í¸® ÀÌ¸§ °¡Á®¿À±â
	 * @return
	 * @throws SQLException
	 */
	public List<String> selectAllCategoryName() throws SQLException{
		
		List<String> categoryList=new ArrayList<String>();
		
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String selectCategoryName
		="select category_name from category where category_status='Y'";
		
		PreparedStatement pstmt=con.prepareStatement(selectCategoryName);
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs){
			
			while(rs.next()) {
				String catagoryName=rs.getString("category_name");
				categoryList.add(catagoryName);
					
			}//end while
			
		}//try
//		if(con.isClosed()) {System.out.println("Àß´ÝÈû");}
//		if(pstmt.isClosed()) {System.out.println("Àß´ÝÈû");}
//		if(rs.isClosed()) {System.out.println("Àß´ÝÈû");}
		return categoryList;
		
	}//selectAllCategoryName
	
	
	
	
	public List<CategoryVO> selectAllCategory() throws SQLException{
		
		List<CategoryVO> cVOlist=new ArrayList<CategoryVO>();
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String selectCategoryName
		="select category_id,category_name,category_image,input_date,category_status from category where category_status='Y'";
		

		PreparedStatement pstmt=con.prepareStatement(selectCategoryName);
		ResultSet rs=pstmt.executeQuery();
		
		CategoryVO cVO=null;
		
		try(con;pstmt;rs){
			
			while(rs.next()) {
				cVO=new CategoryVO();
				cVO.setCategoryName(rs.getString("category_name"));
				cVO.setCategoryImage(rs.getString("category_image"));
				cVO.setCategoryId(rs.getInt("category_id"));
					
				cVOlist.add(cVO);
			}//end while
			
		}//try
		
		return cVOlist;
	}//selectAllCategory
	
	
	
	public String selectUserImg(int id) throws SQLException{
		
		String fileName="";
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String selectUserImage
		="select user_img from member where member_id=?";
		
		
		PreparedStatement pstmt=con.prepareStatement(selectUserImage);
		pstmt.setInt(1, id);
		
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs){
			
			while(rs.next()) {
				fileName=rs.getString("user_img");
			}//end while
			
		}//try
		System.out.println(id);
		System.out.println("ÆÄÀÏ¸í"+fileName);
		return fileName;
	}//selectUserImg
	
	
	
	public List<Integer> selectInterests(int memberId) throws SQLException{
		
		List<Integer> iVOList=new ArrayList<Integer>();
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		
		String selectcategoryId
		="select category_id from interest where member_id=?";
		
		
		PreparedStatement pstmt=con.prepareStatement(selectcategoryId);
		pstmt.setInt(1, memberId);
		
		ResultSet rs=pstmt.executeQuery();
		//InterestVO iVO=null;
		try(con;pstmt;rs){
			
			while(rs.next()) {
				//iVO=new InterestVO();
				//iVO.setCategoryId(rs.getInt("category_id"));
				iVOList.add(rs.getInt("category_id"));
				
				//iVOList.add(iVO);
			}//end while
			
		}//try
		//System.out.println("°ü½É»ç"+memberId);
//		for(int i:iVOList) {
//			System.out.println(i);
//		}
		return iVOList;
	}//selectAllCategory
	
	
	
	
	public List<PostVO> selectPosts(int categoryId) throws SQLException{
		List<PostVO> pVOList=new ArrayList<PostVO>();
		
		Connection con=DbConnectionDBCP.getInstance().getConn();
		//StringBuilder selectPostsForInterests=new StringBuilder();
		
//		selectPostsForInterests
//		.append("select*from(")
//		.append("select post_id,member_id,title,post_img,summary,price,star_avg ")
//		.append("from post")
//		.append("where category_id=? and POST_STATUS='Y' order by POST_DATE) where rownum<=8")
//		.append("where rownum<=8");
		String selectPostsForInterests="select*from(select post_id,member_id,title,post_img,summary,price,star_avg from post where category_id=? and POST_STATUS='Y' order by POST_DATE) where rownum<=8";
		
		//PreparedStatement pstmt=con.prepareStatement(selectPostsForInterests.toString());
		PreparedStatement pstmt=con.prepareStatement(selectPostsForInterests);
		pstmt.setInt(1,categoryId);
		ResultSet rs=pstmt.executeQuery();
		PostVO pVO=null;
		try(con;pstmt;rs){
			while(rs.next()) {
				pVO=new PostVO();
				
				pVO.setPostId(rs.getInt("post_id"));
				pVO.setMemberId(rs.getInt("member_id"));
				pVO.setTitle(rs.getString("title"));
				pVO.setPostImg(rs.getString("post_img"));
				pVO.setSummary(rs.getString("summary"));
				pVO.setPrice(rs.getInt("price"));
				pVO.setStarAvg(rs.getDouble("star_avg"));
				
				pVOList.add(pVO);
			}//end while
			
		}//try
		return pVOList;
	}
	
	
	
}//class

