<%@page import="com.kmong.vo.admin.AdminPostsVO"%>
<%@page import="com.kmong.dao.admin.AdminPostDAO"%>
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
File saveDirectory = new File("E:/dev/web_service/static/PostimgUpload");
String encType = "UTF-8";
int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = null;
multi = new MultipartRequest(request, saveDirectory.getPath(), maxSize,
encType, new DefaultFileRenamePolicy());
        
String originalName = multi.getOriginalFileName("uploadImg");
String fileName = multi.getFilesystemName("uploadImg");
   
int postId = Integer.parseInt(multi.getParameter("postId"));
String title = multi.getParameter("postTitle");    
int categoryId = Integer.parseInt(multi.getParameter("categoryId"));    
int price = Integer.parseInt(multi.getParameter("postPrice"));    
String summary = multi.getParameter("postSummary");    
String description = multi.getParameter("postDescription");    
String imagePath = fileName;
AdminPostDAO apDAO = AdminPostDAO.getInstance();
AdminPostsVO apVO = new AdminPostsVO();

/* DAO랑 꼭 분리해야하나? */
apVO.setPostId(postId);
apVO.setTitle(title);
apVO.setCategoryId(categoryId);
apVO.setPrice(price);
apVO.setSummary(summary);
apVO.setDescription(description);
apVO.setImg(imagePath);

boolean result = apDAO.updatePost(apVO);

pageContext.setAttribute("postId", postId);
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
if(!${result}){alert("게시글 수정에 실패했습니다")}
alert("게시글이 수정되었습니다");
setTimeout(function() {
	location.href="http://211.63.89.132/admin/pages/posts/posts_edit.jsp?postId=${postId}"; 
},1500);
</script>
</body>
</html>