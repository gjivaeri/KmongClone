<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="admin login process" %>
<%
AdminDAO aDAO = AdminDAO.getInstance();
String id=request.getParameter("id");
String pass=request.getParameter("pass");
System.out.print(id);

boolean loginFlag = aDAO.selectAdminLogin(id, pass);

if(loginFlag){
	session.setAttribute("loginId", id);
}

JSONObject jsonObj = new JSONObject();
jsonObj.put("loginFlag", loginFlag);


out.println(jsonObj.toJSONString());

%>