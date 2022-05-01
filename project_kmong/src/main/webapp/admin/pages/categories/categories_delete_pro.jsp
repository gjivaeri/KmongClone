<%@page import="com.kmong.dao.admin.AdminCategoryDAO"%>
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
int categoryId = Integer.parseInt(request.getParameter("categoryId"));
AdminCategoryDAO acDAO = AdminCategoryDAO.getInstance();
boolean result = acDAO.deleteCategory(categoryId);
%>
<script>
if(!<%=result%>){alert("카테고리 삭제에 실패했습니다")}
alert("카테고리가 삭제되었습니다");

location.replace("http://localhost/project_kmong/admin/pages/categories/categories.jsp");
</script>
</body>
</html>