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
import com.kmong.vo.CategoryVO;
import com.kmong.vo.MemberVO;
import com.kmong.vo.PostVO;
import com.kmong.vo.admin.AdminMemberVO;
import com.kmong.vo.admin.AdminOrdersVO;
import com.kmong.vo.admin.AdminPostsVO;

import oracle.jdbc.proxy.annotation.Post;

public class AdminDAO {

	DbConnectionDBCP dc;
	private static AdminDAO aDAO;
	
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
	
	public int getAllCount(String table) throws SQLException {
		int cnt = 0;
		Connection con=dc.getConn();
		String sql="select count(*) from "+table;
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs;){
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}
		return cnt;
	};
	
	public int getAllCount(String table, String val) throws SQLException {
		int cnt = 0;
		String condition="";
		
		switch(table.toLowerCase()) {
		case "member" :
			condition = "expert";
			break;
		case "orders" :
			condition = "order_status";
			break;
		}
		
		Connection con=dc.getConn();
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from ");
		sql.append(table);
		sql.append(" where ");
		sql.append(condition);
		sql.append("=?");
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, val);
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs;){
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}
		return cnt;
	};

	public int getTodayCount(String table) throws SQLException {
		int cnt = 0;		
		String dateCol = table.toLowerCase().equals("orders") ? "order" : table;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from ");
		sql.append(table);
		sql.append(" where to_char(");
		sql.append(dateCol);
		sql.append("_date, 'YYYY-MM-DD') = to_char(sysdate, 'YYYY-MM-DD')");
		
		Connection con=dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs;){
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}
		return cnt;
	};
	
	public int getTodayCount(String table, String val) throws SQLException {
		int cnt = 0;		
		String dateCol = "";
		String condition="";
		
		switch(table.toLowerCase()) {
		case "member" :
			condition = "expert";
			dateCol = "join_date";
			break;
		case "orders" :
			condition = "order_status";
			dateCol = "order_date";
			break;
		}
		
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from ");
		sql.append(table);
		sql.append(" where to_char(");
		sql.append(dateCol);
		sql.append(", 'YYYY-MM-DD') = to_char(sysdate, 'YYYY-MM-DD') and ");
		sql.append(condition);
		sql.append("=?");
		
		Connection con=dc.getConn();
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, val);
		ResultSet rs=pstmt.executeQuery();
		
		try(con;pstmt;rs;){
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}
		return cnt;
	};

	
	public List<AdminPostsVO> selectAllPost(String opt) throws SQLException{
		
		List<AdminPostsVO> list = new ArrayList<AdminPostsVO>();
		Connection con=dc.getConn();
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

			try {
			if(opt == null){
			sql.append("select * ");
			sql.append(" from(select rownum rnum, p.post_id, c.category_name, p.title, m.email, p.post_date");
			sql.append(" from(select * from post order by post_id, post_date) p");
			sql.append(" join member m");
			sql.append(" on m.member_id = p.member_id");
			sql.append(" join category c");
			sql.append(" on c.category_id = p.category_id)");
			sql.append(" where rnum>=?");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, 1);
			
			sql.delete(0,  sql.toString().length());
			
			}
			else{
				sql.append("select * ");
				sql.append(" from(select rownum rnum, p.post_id, c.category_name, p.title, m.email, p.post_date");
				sql.append(" from(select * from post order by post_id, post_date) p");
				sql.append(" join member m");
				sql.append(" on m.member_id = p.member_id");
				sql.append(" join category c");
				sql.append(" on c.category_id = p.category_id)");
				sql.append(" where title like ? or category_name like ? or email like ? ");
				sql.append(" or to_char(post_id) like ? or to_char(rnum) like ? ");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, '%'+opt+'%');
			pstmt.setString(2, '%'+opt+'%');
			pstmt.setString(3, '%'+opt+'%');
			pstmt.setString(4, opt);
			pstmt.setString(5, opt);
			
			sql.delete(0,  sql.toString().length());

			}
			
			rs=pstmt.executeQuery();
		
				while(rs.next())
				{
					AdminPostsVO adPosts = new AdminPostsVO(); 
					adPosts.setRnum(rs.getInt("rnum"));
					adPosts.setPostId(rs.getInt("post_id"));
					adPosts.setCategoryName(rs.getString("category_name"));
					adPosts.setTitle(rs.getString("title"));
					adPosts.setEmail(rs.getString("email"));
					adPosts.setPostDate(rs.getDate("post_date"));
					list.add(adPosts);
				}//while
				return list;
			}finally{
				if(con!=null) {con.close(); System.out.println("con close");}
				if(pstmt!=null) {pstmt.close(); System.out.println("pstmt close");}
				if(rs!=null) {rs.close(); System.out.println("rs close");}
			}
	}//selectAllPost;
	
	public List<AdminMemberVO>selectAllMember(String opt, String exp) throws SQLException{
		List<AdminMemberVO> list = new ArrayList<AdminMemberVO>();
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		if(opt == null) {
			sql.append("select m.member_id, m.email, m.nick, c.category_name, m.join_date");
			sql.append(" from member m");
			sql.append(" join category c");
			sql.append(" on c.category_id = m.category_id");
			sql.append(" where expert = ?");
			sql.append(" order by join_date desc, member_id");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, exp);
			
			sql.delete(0, sql.toString().length());
		}else {
		sql.append("select m.member_id, m.email, m.nick, c.category_name, m.join_date");
		sql.append(" from member m");
		sql.append(" join category c");
		sql.append(" on c.category_id = m.category_id");
		sql.append(" where expert = ? and nick like ? or m.email like ? or c.category_name like ? or to_char(member_id) like ?");
		sql.append(" order by join_date desc, member_id");
		
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, exp);
		pstmt.setString(2, '%'+opt+'%');
		pstmt.setString(3, '%'+opt+'%');
		pstmt.setString(4, '%'+opt+'%');
		pstmt.setString(5, opt);
		
		sql.delete(0, sql.toString().length());
		}
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			AdminMemberVO aMVO = new AdminMemberVO();
			aMVO.setMemberId(rs.getInt("member_id"));
			aMVO.setEmail(rs.getString("email"));
			aMVO.setNick(rs.getString("nick"));
			aMVO.setCategoryName(rs.getString("category_name"));
			aMVO.setJoinDate(rs.getDate("join_date"));
			
			list.add(aMVO);
		}
		return list;
		
		}finally {
			if(con != null) {con.close();}
			if(pstmt != null) {pstmt.close();}
			if(rs != null) {rs.close();}
		}
	}
			
	public List<AdminOrdersVO> selectAllOrder(String opt) throws SQLException{
		List<AdminOrdersVO> list = new ArrayList<AdminOrdersVO>();
		Connection con = dc.getConn();
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		
		if(opt == null) {
			sql.append("select o.order_id, o.post_id, p.title, p.nick exp, m.nick nonexp, p.price, o.order_date, o.order_status");
			sql.append(" from orders o");
			sql.append(" join (select exp.nick, p.title, p.post_id, p.price");
			sql.append(" from post p");
			sql.append(" join member exp");
			sql.append(" on exp.member_id = p.member_id) p");
			sql.append(" on p.post_id = o.post_id");
			sql.append(" join member m");
			sql.append(" on m.member_id = o.member_id");
			sql.append(" order by order_date desc, order_status");

			
			pstmt = con.prepareStatement(sql.toString());
			sql.delete(0, sql.toString().length());
		}else {
			sql.append("select o.order_id, o.post_id, p.title, p.nick exp, m.nick nonexp, p.price, o.order_date, o.order_status");
			sql.append(" from orders o");
			sql.append(" join (select exp.nick, p.title, p.post_id, p.price");
			sql.append(" from post p");
			sql.append(" join member exp");
			sql.append(" on exp.member_id = p.member_id) p");
			sql.append(" on p.post_id = o.post_id");
			sql.append(" join member m");
			sql.append(" on m.member_id = o.member_id");
			sql.append(" where title like ? or p.nick like ? or m.nick like ? or order_status like ?");
			sql.append(" or to_char(o.order_id) like ? or to_char(o.post_id) like ?");
			sql.append(" order by order_date desc, order_status");
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, '%'+opt+'%');
			pstmt.setString(2, '%'+opt+'%');
			pstmt.setString(3, '%'+opt+'%');
			pstmt.setString(4, '%'+opt+'%');
			pstmt.setString(5, opt);
			pstmt.setString(6, opt);
			
			sql.delete(0, sql.toString().length());	
		}
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			AdminOrdersVO aOVO = new AdminOrdersVO();
			aOVO.setOrderId(rs.getInt("order_id"));
			aOVO.setPostId(rs.getInt("post_id"));
			aOVO.setTitle(rs.getString("title"));
			aOVO.setExpert(rs.getString("exp"));
			aOVO.setUser(rs.getString("nonexp"));
			aOVO.setPrice(rs.getInt("price"));
			aOVO.setOrderDate(rs.getDate("order_date"));
			aOVO.setStatus(rs.getString("order_status"));
			
			list.add(aOVO);
		}
		
		return list;
	}
	
	public List<CategoryVO> selectAllCategory() throws SQLException {
		Connection con = dc.getConn();
		String sql = "select * from category";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<CategoryVO> list = new ArrayList<CategoryVO>();
		CategoryVO cVO = null;
		
		try(con; pstmt; rs;){
			while(rs.next()) {
				cVO=new CategoryVO();
				cVO.setCategoryId(rs.getInt("category_id"));
				cVO.setCategoryName(rs.getString("category_name"));
				cVO.setCategoryImage(rs.getString("category_image"));
				cVO.setCategoryStatus(rs.getString("category_status"));
				
				list.add(cVO);
			}
		}
		return list;
	}
	
};//class
		
		
	
	

/* Methos to be created later


+ updateMember(memberVO): boolean
+ deleteMember(memberVO): boolean


+ selectAllCategory(): List<categoryVO> //모든 카테고리 조회
+ selectRegisteredCategory(): int //등록된 카테고리 수
+ selectDetailCategory(int): categoryVO
+ insertCategory(String, String): void //카테고리 추가
*/
