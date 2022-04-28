package com.kmong.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import com.kmong.dao.DbConnectionDBCP;
import com.kmong.vo.AdminVO;
import com.kmong.vo.PostVO;
import com.kmong.vo.admin.AdminPostsVO;

import oracle.jdbc.proxy.annotation.Post;

public class AdminDAO {

	DbConnectionDBCP dc;
	private static AdminDAO aDAO;
//	Connection con= null;
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;
	
	private AdminDAO() {
		dc = DbConnectionDBCP.getInstance();
	}
	
	public static AdminDAO getInstance() {
		if(aDAO==null) {
			aDAO=new AdminDAO();
		}//end if
		return aDAO;
	}
	
	/* search Admin's account */
	public boolean selectAdminLogin(String admId, String admPw) throws SQLException {
		
		boolean loginFlag = false;
		String query="select count(*) from admin where id=? and pass=?";
		Connection con = dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, admId);
		pstmt.setString(2, admPw);
			
		ResultSet rs=pstmt.executeQuery();
				
			try(con;pstmt;rs;){
				if(rs.next()&&rs.getInt(1) > 0) {
					loginFlag=true;
				}
			}
		return loginFlag;
	}
	
//	update Admin's password
	public boolean updateAdminPass(AdminVO avo) throws SQLException {
		int cnt=0;
		boolean flag=false;
		
		String sql="update admin set pass=? where id=?";
		Connection con=dc.getConn();
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, avo.getPass());
		pstmt.setString(2, avo.getId());
		cnt=pstmt.executeUpdate();
		
		try(con;pstmt;){
			if(cnt > 0) {
				flag=true;
			}
		}
		return flag;
	}
	
	public int getPostCount() throws SQLException {
		int cnt = 0;
		
		String sql="select count(*) from post";
		Connection con=dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs;){
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}
		return cnt;
	};
	
	
//	public ArrayList<AdminPostsVO> selectAllPost(String opt) throws SQLException{
	public List<AdminPostsVO> selectAllPost(String opt) throws SQLException{
		
//		ArrayList<AdminPostsVO> list = new ArrayList<AdminPostsVO>();
		List<AdminPostsVO> list = new ArrayList<AdminPostsVO>();
		Connection con=dc.getConn();
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

			try {
			if(opt == null){
			sql.append("select * ");
			sql.append(" from(select rownum rnum, p.post_id, c.category_name, p.title, m.email, p.post_date");
			sql.append(" from(select * from post order by post_date, post_id) p");
			sql.append(" join member m");
			sql.append(" on m.member_id = p.member_id");
			sql.append(" join category c");
			sql.append(" on c.category_id = p.category_id)");
			sql.append(" where rnum>=? and rnum<=?");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 10);
			
			sql.delete(0,  sql.toString().length());
			
			}
			else{
				sql.append("select * ");
				sql.append(" from(select rownum rnum, p.post_id, c.category_name, p.title, m.email, p.post_date");
				sql.append(" from(select * from post order by post_date, post_id) p");
				sql.append(" join member m");
				sql.append(" on m.member_id = p.member_id");
				sql.append(" join category c");
				sql.append(" on c.category_id = p.category_id");
				sql.append(" where p.title like ? or c.category_name like ? or m.email like ?)");
				sql.append(" where rnum>=? and rnum<=?");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, '%'+opt+'%');
			pstmt.setString(2, '%'+opt+'%');
			pstmt.setString(3, '%'+opt+'%');
			pstmt.setInt(4, 1);
			pstmt.setInt(5, 10);
			
			sql.delete(0,  sql.toString().length());

			}
			
			rs=pstmt.executeQuery();
		
				while(rs.next())
				{
					AdminPostsVO adPosts = new AdminPostsVO(); 
					adPosts.setRnum(rs.getInt("rnum"));
					adPosts.setPost_id(rs.getInt("post_id"));
					adPosts.setCategory_name(rs.getString("category_name"));
					adPosts.setTitle(rs.getString("title"));
					adPosts.setEmail(rs.getString("email"));
					adPosts.setPost_date(rs.getDate("post_date"));
					list.add(adPosts);
				}//while
				return list;
			}finally{
				if(con!=null) {con.close(); System.out.println("con close");}
				if(pstmt!=null) {pstmt.close(); System.out.println("pstmt close");}
				if(rs!=null) {rs.close(); System.out.println("rs close");}
			}
	}//selectAllPost;
			
	
};//class
		
		
	
	

/* Methos to be created later
+ selectAdminLogin(adminVO): boolean
+ updateAdminPass(adminVO): boolean

 
+ selectPost(): List<postVO>
+ selectDetailPost(int): postVO //게시글상세페이지
+ updatePost(postVO): boolean
+ updatePost(postVO, char): boolean //게시글 삭제
+ selectMember(int,char): List<memberVO>// char로 사용자/전문가 조회
+ selectAllMember(): int //총회원수
+ selectTodayMember(int): int //오늘가입한 회원수
+ selectDetailMember(int, char): memberVO // char로 사용자/전문가 조회
+ updateMember(memberVO): boolean
+ deleteMember(memberVO): boolean
+ selectOrders(): List<ordersVO> //모든 결제 내역
+ selectOrders(orderStatusVO): int //결제 건수 조회
+ selectTodayOrders(orderStatusVO, String): int //오늘 결제 내역-날짜로 조회 
+ selectDetailOrders(int): ordersVO
+ updateOrders(oderVO, char): boolean //취소
+ selectAllCategory(): List<categoryVO> //모든 카테고리 조회
+ selectRegisteredCategory(): int //등록된 카테고리 수
+ selectDetailCategory(int): categoryVO
+ updateCategory(categoryVO): boolean
+ updateCategory(categoryVO, char): boolean //카테고리 삭제
+ insertCategory(String, String): void //카테고리 추가
*/
