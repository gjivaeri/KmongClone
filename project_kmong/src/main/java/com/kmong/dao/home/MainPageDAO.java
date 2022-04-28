package com.kmong.dao.home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.CategoryVO;


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
	 * ����� ��ü ī�װ��� �̸� ��������
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
//		if(con.isClosed()) {System.out.println("�ߴ���");}
//		if(pstmt.isClosed()) {System.out.println("�ߴ���");}
//		if(rs.isClosed()) {System.out.println("�ߴ���");}
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
		
		return fileName;
	}//selectAllCategory
	
	
	
	
}//class

