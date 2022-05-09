<%@page import="com.kmong.vo.MemberVO"%>
<%@page import="com.kmong.dao.login.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:catch var="e">
<%

		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		
        MemberDAO mDAO=MemberDAO.getInstance();
		MemberVO mVO=new MemberVO();
		
		mVO.setName(name);
		mVO.setTel(tel);
        
       	String email=mDAO.selectID(mVO);
        
       
		if(!email.equals("")){
			session.setAttribute("id",email); 
			response.sendRedirect("http://211.63.89.132/templates/account/finding_success.jsp");
		}
		else if(email.equals("")){
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
