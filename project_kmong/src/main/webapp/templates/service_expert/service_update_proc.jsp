<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="com.kmong.dao.MyServiceDAO"%>
<%@page import="com.kmong.vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	boolean ImgFileFlag = (boolean)session.getAttribute("updateImgFlag");
	PostVO pVO = new PostVO();
	
	System.out.println(ImgFileFlag);
	 
	if(!ImgFileFlag){
		//String ip = mr.getRemoteAddr(); 
		
	//1. 업로드될 파일의 경로 얻기
	//File saveDirectory=new File("C:/Users/user/git/KmongClone/project_kmong/src/main/webapp/static/PostimgUpload");
	File saveDirectory=new File("E:/dev/web_service/static/PostimgUpload");
	
	//2. 업로드될 파일의 크기설정
	int fileSize=1024*1024*10; //10MByte
	//3. 파일 업로드 컴포넌트를 생성
	MultipartRequest mr = new MultipartRequest(request, saveDirectory.getPath(), fileSize, "UTF-8",	new DefaultFileRenamePolicy());

	System.out.println("postId : "+ mr.getParameter("postId"));
	int postId =  Integer.parseInt(mr.getParameter("postId"));
	
	String title = mr.getParameter("title");
	int categoryId = Integer.parseInt(mr.getParameter("categoryId"));
	String summary = mr.getParameter("summary");
	int price = Integer.parseInt(mr.getParameter("price"));
	int term = Integer.parseInt(mr.getParameter("term"));
	String description = mr.getParameter("description");
	String postImg = mr.getFilesystemName("file1");
				
	pVO.setPostId(postId);			
	pVO.setTitle(title);
	pVO.setCategoryId(categoryId);
	pVO.setSummary(summary);
	pVO.setPrice(price);
	pVO.setTerm(term);
	pVO.setDescription(description);
	pVO.setPostImg(postImg);
				
	MyServiceDAO msDAO = MyServiceDAO.getInstance();
	msDAO.updateMyService(pVO);
	
	System.out.println(pVO);
				
	response.sendRedirect("http://211.63.89.132/templates/service_expert/service_list.jsp");
	}
%>