<%@page import="com.kmong.dao.login.LoginDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="com.kmong.vo.MemberVO"%>
<%@page import="com.kmong.dao.register.MakeAccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:catch var="e">
<%

		String email=request.getParameter("email");
		String password=request.getParameter("pass");
		
		
		/* if(request.getParameter("url").equals("/project_kmong/templates/home/index.jsp")){
			
		} */
		
		
		LoginDAO lDAO=LoginDAO.getInstance();
			
	    String pass=DataEncrypt.messageDigest("MD5",password);
	        
	    int memberID=lDAO.selectLoginInfo(email, pass);
	        
	    String url="";
		if(memberID!=0){
				
/* 				if(session.getAttribute("logoutPageGo")!=null
						&&(String)session.getAttribute("logoutPageGo")!="/project_kmong/templates/home/index.jsp"){
				
				String url=(String)session.getAttribute("logoutPageGo");
				String url_=(String)session.getAttribute("logoutPageGo"); */
				//url="http://localhost"+url;
				url="http://localhost"+request.getParameter("url");
				//session.removeAttribute("logoutPageGo");
				
				session.setAttribute("login", memberID); 
				session.setAttribute("loginMsg", "loginMsg");
				
					/* if(url_=="/project_kmong/templates/home/index.jsp"){
						response.sendRedirect("http://localhost/project_kmong/templates/home/index_member.jsp");
					}else{ */
				if(request.getParameter("url").equals("/project_kmong/templates/home/index.jsp")){
					response.sendRedirect("http://localhost/project_kmong/templates/home/index_member.jsp");
				}else{
					response.sendRedirect(url);
				}
					//}
				//session.setAttribute("login", memberID); 
				//session.setAttribute("loginMsg", "loginMsg");
				//response.sendRedirect("http://localhost/project_kmong/templates/home/index_member.jsp");
				/* }else{
				session.setAttribute("login", memberID); 
				session.setAttribute("loginMsg", "loginMsg");
				//response.sendRedirect("http://localhost/project_kmong/templates/home/index_member.jsp");
					
				} */
			}else{
				
				/* if(session.getAttribute("logoutPageGo")!=null&&(String)session.getAttribute("logoutPageGo")!="/project_kmong/templates/home/index.jsp"){
					String url_=(String)session.getAttribute("logoutPageGo"); */
					url="http://localhost"+request.getParameter("url");
					
					//session.removeAttribute("logoutPageGo");
					if(request.getParameter("url").equals("/project_kmong/templates/home/index.jsp")){
						session.setAttribute("loginTry", "done");
						response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp?hid=login");
					}else{
						if(url.indexOf("?hid=login")==-1){
						url=url+"&hid=login";
						
						session.setAttribute("loginTry", "done");
						response.sendRedirect(url);
						}
						
					}	
					//session.setAttribute("loginTry", "done");
					//response.sendRedirect(url);
				
				//session.setAttribute("loginTry", "done");
				//response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp?hid=login");
				
			}
%>
</c:catch>
<c:if test="${not empty e }">
	<%
	session.setAttribute("loginTry", "done");
	response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp?hid=login");
	%>
</c:if>



