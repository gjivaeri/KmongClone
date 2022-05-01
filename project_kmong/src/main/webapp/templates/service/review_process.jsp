<%@page import="com.kmong.vo.CommentsVO"%>
<%@page import="com.kmong.dao.CommentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	int star = Integer.parseInt(request.getParameter("reviewStar"));
	String review = request.getParameter("reviewText");
	int memberId = (Integer)session.getAttribute("login");
	int postId = Integer.parseInt(request.getParameter("postId"));
	CommentsDAO cDAO = CommentsDAO.getInstance();
	CommentsVO cVO = new CommentsVO();
	cVO.setStar(star);
	cVO.setReview(review);
	cVO.setMemberId(memberId);
	cVO.setPostId(postId);
	cDAO.insertComments(cVO);
	response.sendRedirect("http://localhost/project_kmong/templates/service/detail.jsp?id="+postId);
	
%>

