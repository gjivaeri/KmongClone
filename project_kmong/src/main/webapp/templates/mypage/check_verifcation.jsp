<%@page import="netscape.javascript.JSObject"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.kmong.dao.account.AccountSettingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%out.print((String)session.getAttribute("service")); %> --%>
<c:catch var="e">
<%
//세션에 저장되어 있는 서비스 유형을 가져온다
String sdf=(String)session.getAttribute("service");

//pageContext.setAttribute("str", sdf);

String dfg="";
String passConfirmed="";
if(sdf==null){
	out.print("값없음");
}else{
	
	if(sdf.equals("info")) {
		dfg="my_info_edit.jsp";
		passConfirmed="info";
	}else if(sdf.equals("pass")) {
		dfg="pw_edit.jsp";
		passConfirmed="pass";
	}else if(sdf.equals("withdraw")) {
		dfg="withdrawing.jsp";
		passConfirmed="withdraw";
	}
}


session.setAttribute("lo",1);
 int memberId=(int)session.getAttribute("lo");
//int memberId=(int)session.getAttribute("login");



String password=request.getParameter("pass");
//DB조회
AccountSettingDAO asDAO=AccountSettingDAO.getInstance();
String chkpass=asDAO.selectCheckPassword(memberId,password);



//pageContext.setAttribute("dfg", dfg);
if(chkpass == null){
	%><!-- <script>alert("비밀번호가 일치하지 않습니다.");</script> --><%
	session.setAttribute("alert","fail");
	response.sendRedirect("http://localhost/project_kmong/templates/mypage/verification.jsp?service="+passConfirmed);
	
}else if(chkpass.equals(password)) {
	session.setAttribute("pwConfirmed",passConfirmed);
	session.removeAttribute("service");
	response.sendRedirect("http://localhost/project_kmong/templates/mypage/"+dfg);
	%> <!-- <script>alert("확인되셨습니다."); 
	location.href="http://localhost/project_kmong/templates/mypage/"+;
	</script> -->
	
	<%
}//end if



//String 

 //out.print(jsonObj);  // 출력해보기
%>

</c:catch>
<c:if test="${not empty e }">
	<c:out value="${e }"/>
</c:if>