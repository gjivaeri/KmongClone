<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
try{
File saveDirectory = new File("C:/Users/user/git/KmongClone/project_kmong/src/main/webapp/static/images/category");
String encType = "UTF-8";
int maxSize = 5 * 1024 * 1024;

	MultipartRequest multi = null;
    multi = new MultipartRequest(request, saveDirectory.getPath(), maxSize,
            encType, new DefaultFileRenamePolicy());
        
    String originalName = multi.getOriginalFileName("uploadImg");
    String fileName = multi.getFilesystemName("uploadImg");
   
int categoryId = Integer.parseInt(multi.getParameter("categoryId"));
String name = multi.getParameter("name");    
String imagePath = "images/category/"+fileName;
AdminCategoryDAO acDAO = AdminCategoryDAO.getInstance();
boolean result = acDAO.updateCategory(categoryId, name, imagePath);

pageContext.setAttribute("id", multi.getParameter("categoryId"));
pageContext.setAttribute("categoryId", categoryId);
pageContext.setAttribute("result", result);
%>
<%
}catch(Exception e){
%>
	업로드 중 예외 발생 <%=e %>
<%
}
%>
<script>
if(!${result}){alert("카테고리 수정에 실패했습니다")}
alert("카테고리가 수정되었습니다");
location.href="http://localhost/project_kmong/admin/pages/categories/categories_edit.jsp?id=${categoryId}"; 
</script>
</body>
</html>