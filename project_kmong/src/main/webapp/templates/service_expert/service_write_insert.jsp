<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="com.kmong.dao.MyServiceDAO"%>
<%@page import="com.kmong.vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	 int login = (int)session.getAttribute("login");
	 int id =login;

	 boolean ImgFileFlag = (boolean)session.getAttribute("insertImgFlag");
	 PostVO pVO = new PostVO();
	 System.out.println("ImgFileFlag: "+ImgFileFlag);
	 //System.out.println(session.getAttribute("login"));
	 session.setAttribute("memberId", id);
	 System.out.println("memberId: "+session.getAttribute("memberId"));
	
	 
	if(!ImgFileFlag){
		
	//1. 업로드될 파일의 경로 얻기
	File saveDirectory=new File("E:/dev/web_service/static/PostimgUpload");
	//2. 업로드될 파일의 크기설정
	int fileSize=1024*1024*10; //10MByte
	//3. 파일 업로드 컴포넌트를 생성
	MultipartRequest mr = new MultipartRequest(request, saveDirectory.getPath(), fileSize, "UTF-8",	new DefaultFileRenamePolicy());
	
	
	System.out.println(mr.getParameter("title"));
	String title = mr.getParameter("title");
	//System.out.println(mr.getParameter("categoryId"));
	int categoryId = Integer.parseInt(mr.getParameter("categoryId"));
	String summary = mr.getParameter("summary").trim();
	int term = Integer.parseInt(mr.getParameter("term"));
	String description = mr.getParameter("description");
	//System.out.println(mr.getParameter("file1"));
	System.out.println("FileSystemName : "+mr.getFilesystemName("file1"));
	
	//String postImg = mr.getParameter("file1");
	String postImg =mr.getFilesystemName("file1");
	
	System.out.println("price : "+mr.getParameter("price").trim());
	int price = Integer.parseInt(mr.getParameter("price").trim());
	System.out.println("price2 : "+ price);
	
	int memberId = (Integer)session.getAttribute("memberId");
	
	pVO.setTitle(title);
	pVO.setCategoryId(categoryId);
	pVO.setSummary(summary);
	pVO.setPrice(price);
	pVO.setTerm(term);
	pVO.setDescription(description);
	pVO.setPostImg(postImg);
	pVO.setMemberId(memberId);
	
	MyServiceDAO msDAO = MyServiceDAO.getInstance();
	msDAO.insertMyService(pVO);
	
	response.sendRedirect("http://211.63.89.132/templates/service_expert/service_list.jsp");
	
	 } 
%>