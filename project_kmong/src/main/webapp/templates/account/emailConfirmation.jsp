<%@page import="com.kmong.dao.register.MakeAccountDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="이메일 중복확인 JSON"
    trimDirectiveWhitespaces="true"%>
 <%  
String email=request.getParameter("email");
JSONObject jsonObj=new JSONObject();

String regx = "^[A-Za-z0-9+_.-]+@(.+)$";  
Pattern pattern = Pattern.compile(regx);  
Matcher matcher = pattern.matcher(email);  
 

if(matcher.matches()){//이메일 형식이 올바른 경우
	
	MakeAccountDAO maDAO=MakeAccountDAO.getInstance();
	boolean flag=maDAO.selectEmail(email);
	 
	jsonObj.put("flag",flag);

	out.print(jsonObj.toJSONString());
	
}else{//이메일 형식이 맞지 않을 경우
	jsonObj.put("validation","isNotEmail");
	out.print(jsonObj.toJSONString());
}


 %>