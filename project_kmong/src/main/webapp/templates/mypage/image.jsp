<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("fileName")!=null){
	String i=(String)session.getAttribute("fileName");
	String e= "http://localhost/project_kmong/templates/mypage/upload_image/"+i;
	response.sendRedirect("http://localhost/project_kmong/templates/mypage/my_info_edit.jsp");
}
%>
<%-- 	
	<img 
									src="http://localhost/project_kmong/templates/mypage/upload_image/<%=(String)session.getAttribute("fileName")%>"
										alt="프로필 사진1" id="profile-img" style="object-fit: cover;" />
										<%session.removeAttribute("fileName");
								}else if(fileName!=null){
									//String fileName=mpDAO.selectUserImg((int)session.getAttribute("login"));
									%><img 
									src="http://localhost/project_kmong/templates/mypage/upload_image/<%=fileName%>"
										alt="프로필 사진2" id="profile-img" style="object-fit: cover;"/><%
								}else{
									%><img 
									src="http://localhost/project_kmong/static/images/default_profile.png"
										alt="프로필 사진3" id="profile-img" style="object-fit: cover;"/><%
								}
								%> --%>