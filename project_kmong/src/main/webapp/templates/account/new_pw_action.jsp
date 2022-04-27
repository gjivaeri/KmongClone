<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="com.kmong.vo.MemberVO"%>
<%@page import="com.kmong.dao.login.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:catch var="e">
<%

		String name=(String)session.getAttribute("name");
		String tel=(String)session.getAttribute("tel");
		String email=(String)session.getAttribute("email");
	
		String pass=request.getParameter("pass2");
		
        MemberDAO mDAO=MemberDAO.getInstance();
		MemberVO mVO=new MemberVO();
		
		mVO.setName(name);
		mVO.setTel(tel);
		mVO.setEmail(email);
		
		String password=DataEncrypt.messageDigest("MD5", pass);
		
       	boolean flag=mDAO.updatePassword(password, mVO);
        
       
		if(flag){
			session.setAttribute("setPass", "succeed");
			response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp");
		}else{
			session.setAttribute("newPass", "fail");
			response.sendRedirect("http://localhost/project_kmong/templates/account/finding_info.jsp");
		}
        
%>
</c:catch>
<c:if test="${not empty e }">
	<%
	session.setAttribute("newPass", "fail");
	response.sendRedirect("http://localhost/project_kmong/templates/account/finding_info.jsp");
	%>
<
	
</c:if>
    