<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="admin login process" %>
<%
AdminDAO aDAO = AdminDAO.getInstance();
String id=request.getParameter("id");
String pass=DataEncrypt.messageDigest("MD5", request.getParameter("pass"));
boolean loginFlag = aDAO.selectAdminLogin(id, pass);

if(loginFlag){
	session.setAttribute("loginId", id);
}

JSONObject jsonObj = new JSONObject();
jsonObj.put("loginFlag", loginFlag);


out.println(jsonObj.toJSONString());

%>