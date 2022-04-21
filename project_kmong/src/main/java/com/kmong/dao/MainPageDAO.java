package com.kmong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


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
	 * ����� ��ü ī�װ� �̸� ��������
	 * @return
	 * @throws SQLException
	 */
	public List<String> selectAllCategoryName() throws SQLException{
		
		List<String> categoryList=new ArrayList<String>();
		
		
		DbConnectionDBCP dbDBCP=DbConnectionDBCP.getInstance();
		Connection con=dbDBCP.getConn();
		
		String selectCategoryName
		="select category_name from category";
		
		PreparedStatement pstmt=con.prepareStatement(selectCategoryName);
		ResultSet rs=pstmt.executeQuery();
		
		try {
			try(con;pstmt;rs) {
				
				while(rs.next()) {
					String catagoryName=rs.getString("category_name");
					categoryList.add(catagoryName);
					
				}//end while
	
			}//end try
		}finally {
			if(con!=null) {System.out.println("con �ȴ���");}
			if(pstmt!=null) {System.out.println("pstmt �ȴ���");}
			if(rs!=null) {System.out.println("rs �ȴ���");}
		}

		return categoryList;
		
	}//insertMemberInfo
	
	
	
}//class

