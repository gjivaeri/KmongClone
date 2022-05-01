<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%http://localhost/project_kmong/templates/
session.setAttribute("resultpage", "service/list.jsp");
session.setAttribute("resultpage", "service/search_result.jsp");
session.getAttribute("resultpage");
session.removeAttribute("login");
session.setAttribute("logoutDone", "logout");
response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp");
%>