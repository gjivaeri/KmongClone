<%@page import="com.kmong.dao.MyServiceDAO"%>
<%@page import="com.kmong.vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
			
	//System.out.println("id=" + request.getParameter("postId"));
	
	int postId = Integer.parseInt(request.getParameter("postId"));
	//String url = request.getParameter("url");
	PostVO pVO = new PostVO();
				
	pVO.setPostId(postId);
	
				
	MyServiceDAO msDAO = MyServiceDAO.getInstance();
	msDAO.deleteMyService(postId);
	
 	//response.sendRedirect(url); 
 	response.sendRedirect("http://localhost/project_kmong/templates/service_expert/service_list.jsp"); 
	
	
				
%>