<%@page import="netscape.javascript.JSObject"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.kmong.dao.account.AccountSettingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    %>
<%
//세션에 저장되어 있는 memberID 를 가져온다

int memberId=(int)session.getAttribute("login");


String password=request.getParameter("pass");
//DB조회
AccountSettingDAO asDAO=AccountSettingDAO.getInstance();
String chkpass=asDAO.selectCheckPassword(memberId,password);

if(chkpass == null){
	%><script>alert("비밀번호가 일치하지 않습니다."); history.back();</script> <%
}else if(chkpass.equals(password)) {
	%> <script>alert("확인되셨습니다."); location.href="http://localhost/project_kmong/templates/mypage/my_info_edit.jsp"</script><%
}//end if



//String 

 //out.print(jsonObj);  // 출력해보기
%>