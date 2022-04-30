<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="com.kmong.dao.MyServiceDAO"%>
<%@page import="com.kmong.vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	 boolean ImgFileFlag = (boolean)session.getAttribute("insertImgFlag");
	 PostVO pVO = new PostVO();
	 System.out.println(ImgFileFlag);
	 
	if(!ImgFileFlag){
		//String ip = request.getRemoteAddr(); 
	
		
	//1. 업로드될 파일의 경로 얻기
	File saveDirectory=new File("C:/Users/user/git/KmongClone/project_kmong/src/main/webapp/static/PostimgUpload");
	//2. 업로드될 파일의 크기설정
	int fileSize=1024*1024*10; //10MByte
	//3. 파일 업로드 컴포넌트를 생성
	MultipartRequest mr = new MultipartRequest(request, saveDirectory.getPath(), fileSize, "UTF-8",	new DefaultFileRenamePolicy());
	
	
	//int postId = mr.getParameter("postId");
	System.out.println(mr.getParameter("title"));
	String title = mr.getParameter("title");
	System.out.println(mr.getParameter("categoryId"));
	int categoryId = Integer.parseInt(mr.getParameter("categoryId"));
	String summary = mr.getParameter("summary");
	int term = Integer.parseInt(mr.getParameter("term"));
	String description = mr.getParameter("description");
	//System.out.println(mr.getParameter("file1"));
	System.out.println("FileSystemName : "+mr.getFilesystemName("file1"));
	
	//String postImg = mr.getParameter("file1");
	String postImg =mr.getFilesystemName("file1");
	int price = Integer.parseInt(mr.getParameter("price").trim());
	
/* 	System.out.println(mr.getParameter("title"));
	String title = mr.getParameter("title");
	System.out.println(request.getParameter("categoryId"));
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String summary = request.getParameter("summary");
	int term = Integer.parseInt(request.getParameter("term"));
	String description = request.getParameter("description");
	String postImg = request.getParameter("file1");
	int price = Integer.parseInt(request.getParameter("price").trim());
	 */
				
	/* PostVO pVO = new PostVO(); */
	pVO.setTitle(title);
	pVO.setCategoryId(categoryId);
	pVO.setSummary(summary);
	pVO.setPrice(price);
	pVO.setTerm(term);
	pVO.setDescription(description);
	pVO.setPostImg(postImg);
				
	MyServiceDAO msDAO = MyServiceDAO.getInstance();
	msDAO.insertMyService(pVO);
	
	/* PostImgFileVO pifVO = new PostImgFileVO("postImg");
	pifVO.setPostImg(postImg);
	
	PostImgFileUploadDAO pifuDAO = PostImgFileUploadDAO.getInstance();
	pifuDAO.insertImgFile(pifVO); */
	
	response.sendRedirect("http://localhost/project_kmong/templates/service_expert/service_list.jsp");
	
	 } 
%>