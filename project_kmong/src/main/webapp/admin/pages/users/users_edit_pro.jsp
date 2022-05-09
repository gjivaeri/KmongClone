<%@page import="com.kmong.dao.admin.AdminMemberDAO"%>
<%@page import="com.kmong.dao.admin.AdminOrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
int memberId = Integer.parseInt(request.getParameter("memberId"));
boolean isExpert = Boolean.parseBoolean(request.getParameter("isExpert"));
AdminMemberDAO amDAO = AdminMemberDAO.getInstance();
boolean result = amDAO.deleteMember(memberId);
%>
<script>
if(!<%=result%>){alert("계정 삭제에 실패했습니다")}
alert("계정이 삭제되었습니다");
var url="users.jsp";
if(<%=isExpert%>){
	url="experts.jsp";
}
location.replace("http://211.63.89.132/admin/pages/users/"+url);
</script>
</body>
</html>