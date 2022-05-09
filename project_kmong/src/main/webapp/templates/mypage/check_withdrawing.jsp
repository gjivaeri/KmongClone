<%@page import="com.kmong.dao.account.AccountSettingDAO"%>
<%@page import="com.kmong.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("UTF-8");
  
    
    int memberId=(int)session.getAttribute("login");
    String email=request.getParameter("email1");
    String reason=request.getParameter("reasons");
    MemberVO mVO=new MemberVO();
    mVO.setMemberId(memberId);
    mVO.setWithdrawalStatus("Y");
    mVO.setWithdrawalReason(reason);
    
    AccountSettingDAO asDAO=AccountSettingDAO.getInstance();
    
   String chkEmail = asDAO.selectEmail(memberId);
   
   if(!email.equals(chkEmail)){
		%><script>alert("이메일이 일치하지 않습니다."); history.back();</script> <%
	}else if(email.equals(chkEmail)) {
		%> <script>alert("탈퇴가 완료되셨습니다.");<% session.removeAttribute("login");%> location.href="http://211.63.89.132/templates/home/index.jsp"</script><%
	}//end if

 
    		
   asDAO.updateMemberWithdrwalStatusReason(mVO);
 
   
  
   
    %>