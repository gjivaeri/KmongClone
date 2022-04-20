
<%@page import="com.kmong.vo.PostAdminVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kmong.paging.PageImpl"%>
<%@page import="com.kmong.paging.Paging"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.kmong.dao.DbConnectionDBCP"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th> PostNo. </th>
                            <th> Category </th>
                            <th> Title </th>
                            <th> Writer </th>
                            <th> Write Date </th>
                          </tr>
                        </thead>
                        <tbody>
                    

<%
                    /* -------------------------DAO------------------------ */	
                    	DbConnectionDBCP dc = DbConnectionDBCP.getInstance(); 
                    	Connection conn = null;
                    	PreparedStatement pstmt = null;
                    	ResultSet rs = null;
                    	List<PostAdminVO> list = new ArrayList<PostAdminVO>();
                    	try {
                    		conn = dc.getConn();
                    		String sql = "select post_id,category_name,title,nick,post_date from post,member,category where post.member_id = member.member_id and post.category_id = category.category_id order by post_id";
                    		pstmt = conn.prepareStatement(sql);
                    		rs = pstmt.executeQuery();
                    %>
		<% 
		while(rs.next()) {
			list
			.add(new PostAdminVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)));
		}
	} finally {
		dc.dbClose(rs, pstmt, conn);
	}
/* -------------------------DAO------------------------ */	

/* -------------------------PAGING------------------------ */	
	Paging paging = new PageImpl(request,list);

	int firstPage = paging.getFirstPage();
	int lastPage = paging.getLastPage();
	boolean isNext = paging.isNextPage();
	boolean isPrev = paging.isPrevPage();
	List<PostAdminVO> result = paging.getVoAsPagePerRecord();
	int nextPage = paging.getNextPage();
	int prevPage = paging.getPrevPage();
	
	
	pageContext.setAttribute("isNextPage", isNext);
	pageContext.setAttribute("isPrevPage", isPrev);
	pageContext.setAttribute("firstPage", firstPage);
	pageContext.setAttribute("lastPage", lastPage);
	pageContext.setAttribute("next", nextPage);
	pageContext.setAttribute("prev", prevPage);
	pageContext.setAttribute("list", result);

/* -------------------------PAGING------------------------ */	
%>
<!------------------------ 게시글 --------------------------->
<c:forEach items="${ list }" var="list">
      	<tr>
           <td class="py-1">
             ${list.postNo }
           </td>
           <td> ${ list.category } </td>
           <td>
               <a href="posts-edit.jsp?no=${list.postNo}" style="color:white;">
               ${ list.title }
               </a>
           </td>
           <td>${ list.writer }</td>
           <td> ${ list.writeDate } </td>
         </tr>
</c:forEach>
       </tbody>
     </table>
   </div> 
<!------------------------ 게시글 --------------------------->

<!------------------------ 페이징 처리 --------------------------->              
<div style="text-align:center;">

<c:if test="${ isPrevPage }">
<a href="?p=${prev}">prev</a>
</c:if>
<c:forEach var="i" begin="${firstPage}" end="${lastPage}" step="1">
	<a href="?p=${i}">${i}</a>
</c:forEach>
<c:if test="${ isNextPage }">
<a href="?p=${next}">next</a>
</c:if>
</div>
<!------------------------ 페이징 처리 --------------------------->



