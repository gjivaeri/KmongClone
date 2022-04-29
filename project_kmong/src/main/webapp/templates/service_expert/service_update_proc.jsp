<%@page import="com.kmong.dao.MyServiceDAO"%>
<%@page import="com.kmong.vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String summary = request.getParameter("summary");
	int price = Integer.parseInt(request.getParameter("price"));
	int term = Integer.parseInt(request.getParameter("term"));
	String description = request.getParameter("description");
	String postImg = request.getParameter("file1");
				
	PostVO pVO = new PostVO();
				
	pVO.setTitle(title);
	pVO.setCategoryId(categoryId);
	pVO.setSummary(summary);
	pVO.setPrice(price);
	pVO.setTerm(term);
	pVO.setDescription(description);
	pVO.setPostImg(postImg);
				
	MyServiceDAO msDAO = MyServiceDAO.getInstance();
	msDAO.updateMyService(pVO);
	System.out.println(pVO);
				
	response.sendRedirect("http://localhost/project_kmong/templates/service_expert/service_list.jsp");
%>