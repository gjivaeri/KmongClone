package com.kmong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		if(con.isClosed()) {System.out.println("Àß´ÝÈû");}
		if(pstmt.isClosed()) {System.out.println("Àß´ÝÈû");}
		if(rs.isClosed()) {System.out.println("Àß´ÝÈû");}
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
					
				cVOlist.add(cVO);
			}//end while
			
		}//try
		
		return cVOlist;
	}//selectAllCategory
	
	
	
	
	
}//class

