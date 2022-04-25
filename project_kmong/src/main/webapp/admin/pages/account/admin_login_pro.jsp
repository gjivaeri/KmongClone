<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="admin login process" %>
<%
AdminDAO aDao = AdminDAO.getInstance();
JSONObject jsonObj = new JSONObject();



%>