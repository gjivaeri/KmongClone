<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("fileName")!=null){
	String i=(String)session.getAttribute("fileName");
	String e= "http://211.63.89.132/templates/mypage/upload_image/"+i;
	response.sendRedirect("http://211.63.89.132/templates/mypage/my_info_edit.jsp");
}
%>
<%-- 	
	<img 
									src="http://211.63.89.132/templates/mypage/upload_image/<%=(String)session.getAttribute("fileName")%>"
										alt="프로필 사진1" id="profile-img" style="object-fit: cover;" />
										<%session.removeAttribute("fileName");
								}else if(fileName!=null){
									//String fileName=mpDAO.selectUserImg((int)session.getAttribute("login"));
									%><img 
									src="http://211.63.89.132/templates/mypage/upload_image/<%=fileName%>"
										alt="프로필 사진2" id="profile-img" style="object-fit: cover;"/><%
								}else{
									%><img 
									src="http://211.63.89.132/static/images/default_profile.png"
										alt="프로필 사진3" id="profile-img" style="object-fit: cover;"/><%
								}
								%> --%>