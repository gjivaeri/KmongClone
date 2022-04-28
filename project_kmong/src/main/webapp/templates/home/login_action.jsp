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
		
        LoginDAO lDAO=LoginDAO.getInstance();
		
        String pass=DataEncrypt.messageDigest("MD5",password);
        
       	boolean flag=lDAO.selectLoginInfo(email, pass);
        
       
		if(flag){
			session.setAttribute("login", email); //회원가입 성공 시
			session.setAttribute("loginMsg", "loginMsg");
			response.sendRedirect("http://localhost/project_kmong/templates/home/index_member.jsp");
		}else{
			session.setAttribute("loginTry", "done");
			response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp?hid=login");
		}
        
%>
</c:catch>
<c:if test="${not empty e }">
	<%
	session.setAttribute("loginTry", "done");
	response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp?hid=login");
	%>
</c:if>




