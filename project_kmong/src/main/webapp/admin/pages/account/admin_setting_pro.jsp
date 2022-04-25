<%@page import="com.kmong.vo.AdminVO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
AdminDAO aDAO = AdminDAO.getInstance();
AdminVO aVO = new AdminVO();
JSONObject jsonObj = new JSONObject();

String id = (String)session.getAttribute("loginId");
String curPass = request.getParameter("curpass");
String newPass = request.getParameter("newpass");
String confPass = request.getParameter("confpass");
System.out.print(id+"/"+curPass+"/"+newPass+"/"+confPass);
String msg="현재 비밀번호를 다시 입력해주세요";
boolean loginFlag = aDAO.selectAdminLogin(id, curPass);
System.out.print(loginFlag);

if(loginFlag && newPass.equals(confPass)){
	jsonObj.put("setFlag", true);

	aVO.setId(id);
	aVO.setPass(newPass);
	aDAO.updateAdminPass(aVO);
}
if(!newPass.equals(confPass)){
	msg="새 비밀번호가 일치하지 않습니다";
}

jsonObj.put("msg", msg);
out.println(jsonObj.toJSONString());

%>