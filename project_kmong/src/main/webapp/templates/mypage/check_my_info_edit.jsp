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

 int memberId=(int)session.getAttribute("lo");
 
 //카테고리
 String bucategoryId1=request.getParameter("buCategoryId");  // 얘가 왜 널인지 왜 안얻어 질까요....
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
 

  
/*  //프로필 사진변경
  AccountSettingDAO asDAO=AccountSettingDAO.getInstance();  // 위에 있다 나중에 지울 것
boolean dupFlag=(boolean)session.getAttribute("insertFileFlag");

if(!dupFlag){
	
	//1.업로드 될 파일의 경로 얻기
	File saveDirectory = new File("C:/Users/user/git/KmongClone/project_kmong/src/main/webapp/static/upload");	
	//2.업로드 될 파일의 크기 설정
	int fileSize=1024*1024*10;//10MB
	//3.파일 업로드 컴포넌트 생성
	MultipartRequest mr = new MultipartRequest(request, saveDirectory.getPath(), fileSize,"UTF-8",
			new DefaultFileRenamePolicy());
	//파라메터받기
	String fileName=mr.getParameter("upFile"); //파일명은 getParameter로 얻어지지 않는다
	String originalName=mr.getOriginalFileName("upFile"); //원본파일명
	String fileSystemName=mr.getFilesystemName("upFile"); //FileRenamePolicy에 의해 변화된 이름
	
	asDAO.updateFile(originalName, memberId);
	
	//리스트에서 보여줄 이미지를 생성
		ImageResize.resizeImage(saveDirectory.getPath()+"/"+fileName, 80, 60);
		session.setAttribute("insertFileFlag", true);
	
	
} */










 
 %>