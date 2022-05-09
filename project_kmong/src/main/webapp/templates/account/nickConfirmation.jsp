<%@page import="com.kmong.dao.register.MakeAccountDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="이메일 중복확인 JSON"
    trimDirectiveWhitespaces="true"%>
 <%
 if(request.getParameter("nick")==null){
	 response.sendRedirect("http://211.63.89.132/templates/account/register_select.jsp");
 }
 %>
 <%  
String nick=request.getParameter("nick");
JSONObject jsonObj=new JSONObject();

String regx = "^^[가-힣a-zA-Z0-9_-]+$";  
Pattern pattern = Pattern.compile(regx);  
Matcher matcher = pattern.matcher(nick);  


if(matcher.matches()){
	
	if(nick.length()>=5){ //
	MakeAccountDAO maDAO=MakeAccountDAO.getInstance();
	boolean flag=maDAO.selectNick(nick);
	 
	jsonObj.put("flag",flag);

	out.print(jsonObj.toJSONString());
	}else{ //닉네임이 5 글자 미만일때 
		jsonObj.put("validation","length");
		out.print(jsonObj.toJSONString());
	}

}else{
	jsonObj.put("validation","isNotNick");
	out.print(jsonObj.toJSONString());
}


 %>