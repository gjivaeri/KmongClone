<%@page import="com.kmong.vo.MemberVO"%>
<%@page import="com.kmong.dao.login.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:catch var="e">
<%

		String name=request.getParameter("name2");
		String tel=request.getParameter("tel2");
		String email=request.getParameter("email");
		
        MemberDAO mDAO=MemberDAO.getInstance();
		MemberVO mVO=new MemberVO();
		mVO.setName(name);
		mVO.setTel(tel);
		mVO.setEmail(email);
        
       	boolean flag=mDAO.selectPassword(mVO);
        
       
		if(flag){
			session.setAttribute("setPass", "succeed");
			session.setAttribute("name", name);
			session.setAttribute("tel", tel);
			session.setAttribute("email", email);
			response.sendRedirect("http://211.63.89.132/templates/account/new_pw_form.jsp");
		}else{
			session.setAttribute("find", "fail");
			response.sendRedirect("http://211.63.89.132/templates/account/finding_info.jsp");
		}
        
%>
</c:catch>
<c:if test="${not empty e }">
	<%
	session.setAttribute("find", "fail");
	response.sendRedirect("http://211.63.89.132/templates/account/finding_info.jsp");
	%>
</c:if>
    