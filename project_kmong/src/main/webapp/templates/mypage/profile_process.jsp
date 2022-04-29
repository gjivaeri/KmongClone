<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="kr.co.sist.util.img.ImageResize"%>
<%@page import="com.kmong.vo.MemberVO"%>
<%@page import="com.kmong.dao.FileUploadDAO"%>
<%@page import="com.kmong.dao.register.MakeAccountDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
   
 <c:catch var="e">
   <%
	
	 //1. 업로드 될 파일의 경로 얻기
	 File saveDirectory=new File("C:/Users/user/git/KmongClone/project_kmong/src/main/webapp/templates/mypage/upload_image");//절대경로
	 
	 System.out.println(saveDirectory.getPath());
	 //2. 업로드 될 파일의 크기 설정
	 int fileSize=1024*1024*10; // 10MB
	 
	 //3. 파일 업로드 컴포넌트 생성
	 MultipartRequest mr=new MultipartRequest(request,saveDirectory.getPath(),fileSize,"UTF-8",
			 new DefaultFileRenamePolicy() );
	 System.out.println(mr);
	 
	 
	 
	 String fileName=mr.getParameter("upFile"); //파일명은 getParameter로 얻어지지 않는다.
	 String originalName=mr.getOriginalFileName("upFile"); //원본 파일명
	 String fileSystemName=mr.getFilesystemName("upFile"); //FileRenamePolicy 클래스에 의해 변화된 이름 
	//FileRenamePolicy 클래스에 의해 변화된 이름 : 파일명 뒤에 1,2 증가하는 숫자가 붙는다.
	
	
	/* //DB에 추가하기 위한 VO생성
	UploadFileVO ufVO=new UploadFileVO(0,name,originalName,fileSystemName,ip,""); */
	MemberVO mVO=new MemberVO();
	
	//mVO.setMemberId((int)session.getAttribute("login"));
	mVO.setMemberId(71);
	mVO.setUser_img(fileSystemName);

	FileUploadDAO fDAO=FileUploadDAO.getInstance();
	
	int cnt= fDAO.updateProfileFile(mVO);
	if(cnt!=0){
		session.setAttribute("fileName", fileSystemName);
		//response.sendRedirect("http://localhost/project_kmong/templates/mypage/my_info_edit2.jsp");
	}else{
		session.setAttribute("fileName", "no");
	}
	
	
 %>
</c:catch>
<c:if test="${not empty e }">
<c:out value="${e }"/>
</c:if>
		 
		 