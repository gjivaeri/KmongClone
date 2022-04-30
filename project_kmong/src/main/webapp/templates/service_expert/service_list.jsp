<%@page import="com.kmong.vo.ExpertOrderVO"%>
<%@page import="com.kmong.paging.PageImpl"%>
<%@page import="com.kmong.paging.Paging"%>
<%@page import="java.io.Console"%>
<%@page import="com.kmong.vo.PostVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.catalina.manager.DummyProxySession"%>
<%@page import="com.kmong.dao.MyServiceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>kmong</title>
<!-- Login,전문가여부 -->
<%@include file ="../order_expert/validate_expert.jsp" %>

<% 
int sid = login;  
%>

<style type="text/css">

</style>

<!-- bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<script type="text/javascript">
function nextSubmit() {
	$("#nextFrm").submit();
}
function prevSubmit() {
	$("#prevFrm").submit();
}

$(function(){
	$(".modifyBtn").click(function(){
		$("#modiForm").submit();
	})
	

});//ready 

function removeService( postId ){
		alert("게시글을 삭제하겠습니까?" );
		$("#postId").val( postId ) ;
		$("#delForm").submit();
}
</script>
</head>
<body>
 <%@include file="../common/header_member.jsp"%>
		<hr>
			<div style="border: 1px solid #333; height: 90px; text-align: center;">
				광고이미지
			</div>
			<div id="aside-div">
			<%@include file ="../order_expert/leftside.jsp" %>
				<!-- <aside class="aside">
					<div>
						<div style="margin-top: 60px">
						<div class="side-menu-wrapper">
						<div id="side-menu-wrapper">
							<img src="https://kmong.com/img/tools/default_profile@2x.png" title="컬러풀블루1395" class="profile-image img-responsive" style="width: 150px;">
						</div>
						<div id="nickname-div"><span style="text-align: center; font-size: 18px; font-weight: bold">닉네임</span></div>
						<div class="side-menu-title-wrapper" style="margin-top: 50px; font-weight: bold;">마이계약</div>
						<div class="menu-list-wrapper"></div>
						</div>
						</div>
					</div>
					<hr orientation="horizontal" style="height: 2px;">
					<div>
					<select class="input-textDiv" id="expertContract" style="cursor: pointer; font-size: 16px;">
						<option value="ordersMng" selected disabled hidden>계약관리</option>
						<option value="ordersReq">계약 요청 승인</option>
						<option value="ordersCancel">완료된 계약</option>
						<option value="ordersList">철회된 계약</option>
						<option value="myService">나의 서비스</option>
					</select>
					</div>
				</aside> -->
				<main style="margin-left: 24px; margin-top: 30px; width: 100%">
				<%
				MyServiceDAO msDAO = MyServiceDAO.getInstance();
				List<PostVO> list = msDAO.selectMyServiceList(sid);
				
				//pageContext.setAttribute("list", list);
				//System.out.println(list);
				
				Paging paging = new PageImpl(request,list);
				paging.setPagePerRecord(2);
					
				int firstPage = paging.getFirstPage();
				int lastPage = paging.getLastPage();
				boolean isNext = paging.isNextPage();
				boolean isPrev = paging.isPrevPage();
				List<PostVO> result = paging.getVoAsPagePerRecord();
				int nextPage = paging.getNextPage();
				int prevPage = paging.getPrevPage();
				
 				String param="";
				try {	
				if (request.getQueryString() != null) {
					
					//param = request.getQueryString().substring(request.getQueryString().indexOf("p")+4);
					if(request.getQueryString().indexOf("p") == -1){
						
						param = request.getQueryString();			
					}	
				}
				} catch(Exception e) {
					
					e.getStackTrace();
					response.sendRedirect("service_list.jsp");
				}
				pageContext.setAttribute("param", param);
				pageContext.setAttribute("isNextPage", isNext);
				pageContext.setAttribute("isPrevPage", isPrev);
				pageContext.setAttribute("firstPage", firstPage);
				pageContext.setAttribute("lastPage", lastPage);
				pageContext.setAttribute("next", nextPage);
				pageContext.setAttribute("prev", prevPage);
				pageContext.setAttribute("list", result);
				pageContext.setAttribute("size", list.size());
				
				%>
					<h1 style="font-size: 18px; font-weight: bold;">나의 서비스</h1>
					<div id="main-section1" style="padding: 20px;  height: 60%; flex-direction: column; position: relative;"> 
						<div>
						
						<c:if test="${size==0}">
						<div style="display: flex;justify-content: center;align-items: center;text-align: center;">
							<div style="margin-top: 60px">
							<img src="https://kmong.com/img/seller/nothing.png" title="내역없음" style="width: 100px" > 
							<h5 class="font-color-lighter">내역이 없습니다.</h5>
							</div>
						</div>
						</c:if>
						
						<form id="delForm" action="service_delete_proc.jsp" method="post">
		                         <input type="hidden" name="postId" id="postId"/>
						</form>
						<form id="modiForm" action="service_update.jsp" method="post">
		                         <input type="hidden" name="postId2" id="postId2"/>
						</form>
						<c:forEach items="${list}" var="items"> 
						<div>
							<div class="dropdown">
		                         <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_more.svg" alt="더보기 아이콘" style="cursor: pointer; float: right;"/>
		                         <div class="dropdown-content" style="float: right; position: relative; width: 40px;"> 
							       <a href="#void" class="modifyBtn" style="font-size: 15px; text-align: center;">서비스 편집</a>
		                         <!-- <input type="hidden" value="http://localhost/project_kmong/templates/service_expert/service_list.jsp" name="url"/> --> 
							       <a href="#void" onclick="removeService(${items.postId})" class="deleteBtn" style="font-size: 15px; text-align: center;">서비스 삭제</a>
								</div>
							</div>
							<img src="${items.postImg }" style="width: 100px; height: 100px; margin: 10px"/>
							<span><strong>제목</strong> : ${items.title }</span><br/>
							<span style="margin-bottom: 10px"><strong>등록일</strong> : ${items.postDate }</span>
						</div>
						</c:forEach>
						
						</div>
						<!-- <div style="position: absolute; bottom: 10px; text-align: right;">등록 날짜</div> -->
					</div>
					
					<c:if test="${size!=0 }">				
					<!-- paging -->
					<form id="prevFrm">
					<input type="hidden" value="${prev}" name="p">
					</form>
					<form id="nextFrm">
					<input type="hidden" value="${next }" name="p">
					</form>
					
					<div style="text-align:center;height: 40px;">
					<c:if test="${ isPrevPage }">
					<a href="#void" onclick="prevSubmit()">prev</a>
					</c:if>
					<c:forEach var="i" begin="${firstPage}" end="${lastPage}" step="1">
					<a href="?p=${i}">${i}</a>
					</c:forEach>
					<c:if test="${ isNextPage }">
					<a href="#void" onclick="nextSubmit()">next</a>
					</c:if>
					</div>
					</c:if>
					<!-- paging -->	
					
					<div style="position: relative; height: 25%; border: 2px dotted #e4e5ed; margin-top: 20px" >
						<button role="button" id="regi-btn"><a href="http://localhost/project_kmong/templates/service_expert/service_write.jsp" style="text-decoration: none; color: #747474; font-weight: bold;"><h1>+</h1>서비스등록하기</a>						
						</button>
					</div>
					
					</main>
   				</div>
		
<%@include file="../common/footer.jsp"%>
</body>
</html>
