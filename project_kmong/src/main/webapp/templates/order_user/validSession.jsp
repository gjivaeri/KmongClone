<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("login", "1");
String login = (String)session.getAttribute("login");

if (login == null) {
	
	response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp");
}
%>