<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%session.removeAttribute("login");
session.setAttribute("logoutDone", "logout");
response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp");%>