<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="com.kmong.vo.MemberVO"%>
<%@page import="com.kmong.dao.register.MakeAccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:catch var="e">
<%
	
        String ip=request.getRemoteAddr();
		String email=request.getParameter("email");
		String password=request.getParameter("pass2");
		String name=request.getParameter("name");
		String nick=request.getParameter("nick");
		String tel=request.getParameter("tel");
		int categoryID=Integer.parseInt(request.getParameter("business"));
		
		String[] interests=request.getParameterValues("interests");
		String[] agreementArr=request.getParameterValues("clause");
		String agreement="";
		
		String expert=(String)session.getAttribute("flag");
		
		if(expert.equals("expert")){
			expert="Y";
		}else{
			expert="N";
		}
		
		for(String i:agreementArr){
			if(i.equals("선택1")){
				agreement="Y";
			}else{
				agreement="N";
			}
		}
		
		
        MakeAccountDAO madDAO=MakeAccountDAO.getInstance();
		
        MemberVO mVO
        =new MemberVO(madDAO.selectMemberSeq(),categoryID,email,password,name,nick,tel,"","","",ip,expert,"",agreement,interests);
        
        mVO.setPassword(DataEncrypt.messageDigest("MD5", mVO.getPassword()));
      
       	boolean flag=madDAO.insertMemberInfo(mVO);
       	boolean flag2=madDAO.insertInterests(mVO, interests);
		if(flag&&flag2){
			session.setAttribute("join", "complete"); //회원가입 성공 시
			session.removeAttribute("flag"); //회원 유형 세션 삭제
			response.sendRedirect("http://localhost/project_kmong/templates/account/register_success.jsp");
		
		}
        
%>
</c:catch>
<c:if test="${not empty e }">
	<%
	session.setAttribute("error", "error");
	response.sendRedirect("http://localhost/project_kmong/templates/account/register_select.jsp");
	%>
</c:if>




