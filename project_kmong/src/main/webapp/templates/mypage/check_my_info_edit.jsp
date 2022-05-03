<%@page import="kr.co.sist.util.img.ImageResize"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="com.kmong.vo.InterestVO"%>
<%@page import="com.kmong.dao.account.AccountSettingDAO"%>
<%@page import="com.kmong.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%

 int memberId=(int)session.getAttribute("login");
 
 //카테고리
 String bucategoryId1=request.getParameter("buCategoryId");  
 int bucategoryId=Integer.parseInt(bucategoryId1);
 MemberVO mVO=new MemberVO();
 AccountSettingDAO asDAO=AccountSettingDAO.getInstance();
 mVO.setMemberId(memberId);
 mVO.setCategoryId(bucategoryId);
 asDAO.updateMemberCategoryId(mVO);

 

 
 //관심사
  String[] inter=request.getParameterValues("interestcategory");
 int[] inter1=new int[inter.length];
 for(int i=0; i<inter.length; i++) {
	 inter1[i]=Integer.parseInt(inter[i]);
 }//end for 
 
 asDAO.deleteinterest(memberId);
 
 for(int i=0;i<inter1.length;i++){
	 asDAO.insertinterest(memberId, inter1[i]);
 }//end for
 
 session.setAttribute("msg", "msg");
 response.sendRedirect("http://localhost/project_kmong/templates/mypage/my_info_edit.jsp");
 

  











 
 %>