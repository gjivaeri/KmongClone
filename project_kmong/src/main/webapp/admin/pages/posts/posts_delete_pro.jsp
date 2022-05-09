<%@page import="com.kmong.dao.admin.AdminPostDAO"%>
<%@page import="com.kmong.vo.admin.AdminPostsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
int postId = Integer.parseInt(request.getParameter("postId"));
AdminPostDAO apDAO = AdminPostDAO.getInstance();
boolean result = apDAO.deletePost(postId);
pageContext.setAttribute("result", result);
%>
<script>
if(!${result}){alert("게시글 삭제에 실패했습니다")}
else{
alert("게시글이 삭제되었습니다");
}
location.replace("http://211.63.89.132/admin/pages/posts/posts.jsp");
</script>
</body>
</html>