<%@page import="com.kmong.vo.MemberVO"%>
<%@page import="com.kmong.dao.account.AccountSettingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    %>

    <%
  
    session.setAttribute("lo",1);
    int memberId=(int)session.getAttribute("lo");
   // int memberId=(int)session.getAttribute("login");
    String pass1=request.getParameter("updatePassword");
    String pass2=request.getParameter("updatePasswordchk");
    MemberVO mVO=new MemberVO();
    mVO.setMemberId(memberId);
    mVO.setPassword(pass1);
    
    AccountSettingDAO asDAO= AccountSettingDAO.getInstance();
    
   String selectpass= asDAO.selectapss(memberId);
   
   if(selectpass.equals(pass1)){%>
   <script>alert("현재 비밀번호와 일치합니다. 다시 설정해주세요."); history.back()</script> <%
   return;
   }
    
    
    
    
    asDAO.updateMemberPassword(mVO);
    %><script>alert("비밀번호 변경이 완료되었습니다."); location.href="http://localhost/project_kmong/templates/home/index.jsp"; 
</script><% 
 
   
 
    %>