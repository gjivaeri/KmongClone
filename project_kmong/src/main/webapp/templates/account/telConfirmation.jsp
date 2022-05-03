<%@page import="com.kmong.dao.register.MakeAccountDAO"%>
<%@page import="org.json.simple.JSONObject"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="전홥번호 중복확인 JSON"
    trimDirectiveWhitespaces="true"%>
 <%  
String tel=request.getParameter("tel");
JSONObject jsonObj=new JSONObject();


	MakeAccountDAO maDAO=MakeAccountDAO.getInstance();
	boolean flag=maDAO.selectTel(tel);
	 
	jsonObj.put("flag",flag);
	out.print(jsonObj.toJSONString());

 %>