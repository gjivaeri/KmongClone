<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

if (session.getAttribute("login") == null) {
	
	response.sendRedirect("http://211.63.89.132/templates/home/index.jsp");
	return;
}
int login = (int)session.getAttribute("login");
int id =login;
%>