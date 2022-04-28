<%@page import="com.kmong.dao.orders.OrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("login", "5");
String login = (String)session.getAttribute("login");
if (login == null) {
	
	response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp");
	return;
}
int id = Integer.parseInt(login);

OrdersDAO oDAO = OrdersDAO.getInstance();

if(!oDAO.selectMemberExpert(id)) {
	response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp");
	return;
}
%>