<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

if (session.getAttribute("login") == null) {
	
	response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp");
	return;
}
int login = (int)session.getAttribute("login");
int id =login;
%>