<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* if(session.getAttribute("logoutPageGo")!=null){
	String url=(String)session.getAttribute("logoutPageGo");
	url="http://localhost"+url;
	session.removeAttribute("login");
	session.removeAttribute("logoutPageGo");
	session.setAttribute("logoutDone", "logout");
	response.sendRedirect(url);
}else{
	session.removeAttribute("login");
	session.setAttribute("logoutDone", "logout");
	response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp");
} */
String url="http://localhost"+request.getParameter("url");

	session.removeAttribute("login");
	//session.removeAttribute("logoutSession");
	session.setAttribute("logoutDone", "logout");
	response.sendRedirect(url);

	//response.sendRedirect(url);

 %>
 
 
 
 
 
 
 