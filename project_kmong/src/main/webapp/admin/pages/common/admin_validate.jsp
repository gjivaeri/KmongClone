<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
<%
String login = (String)session.getAttribute("loginId");
if(session==null || login==null || login.equals("")){
response.sendRedirect("http://localhost/project_kmong/admin/pages/account/admin_login.jsp");
return;
}
%>