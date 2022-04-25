<%@page import="com.kmong.paging.PageImpl"%>
<%@page import="com.kmong.paging.Paging"%>
<%@page import="com.kmong.vo.ExpertOrderVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>kmong</title>
<!-- Login,전문가여부 -->
<%@include file ="validateExpert.jsp" %>

<% 
int sid = Integer.parseInt(login);  
%>
<!-- datePicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style type="text/css">
#datepicker, #datepicker2{
	width: 130px; 
	height: 35px; 
	color: #747474; 
	border: 1px solid #CCCCCC;
}
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
<!-- datePicker -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	 $( function() {
			$( "#datepicker" ).datepicker({
				format: "mm-dd-yyyy"
			});
		});
		 $( function() {
			$( "#datepicker2" ).datepicker({
				format: "mm-dd-yyyy"
			});
		});
		 
	$("#searchBtn").click(function (){
		 $("#frm").submit();
	})
});//ready
function nextSubmit() {
	$("#nextFrm").submit();
}
function prevSubmit() {
	$("#prevFrm").submit();
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
			<%@include file ="leftside.jsp" %>
<!-- 				<aside class="aside">
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
					<select class="input-textDiv" style="cursor: pointer; font-size: 16px;">
						<option value="ordersMng" selected disabled hidden>계약관리</option>
						<option value="ordersReq">계약 요청 승인</option>
						<option value="ordersCancel">완료된 계약</option>
						<option value="ordersList">철회된 계약</option>
						<option value="myService">나의 서비스</option>
					</select>
					</div>
				</aside> -->
				<%!
					String startDate;
					String endDate;
					String keyword;
				%>
				<%
					SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-YYYY");
					startDate = request.getParameter("startDate");
					if (startDate ==null) {
						startDate = "01-01-2022";
					}
					
					endDate = request.getParameter("endDate");
					if (endDate == null) {
						endDate = sdf.format(new Date());
					}
					
					keyword = request.getParameter("keyword");
					if (keyword == null) {
						keyword = "";
					}
					
					
				%>
				
				<%
					
					List<ExpertOrderVO> list = oDAO.selectExpertRequestedOrdersRange(startDate, endDate, keyword, "Y",sid);
					
					Paging paging = new PageImpl(request,list);
					paging.setPagePerRecord(12);
					
					int firstPage = paging.getFirstPage();
					int lastPage = paging.getLastPage();
					boolean isNext = paging.isNextPage();
					boolean isPrev = paging.isPrevPage();
					List<ExpertOrderVO> result = paging.getVoAsPagePerRecord();
					int nextPage = paging.getNextPage();
					int prevPage = paging.getPrevPage();
					
					String param="";
					try {	
					if (request.getQueryString() != null) {
						param = request.getQueryString().substring(request.getQueryString().indexOf("p")+4);
						if(request.getQueryString().indexOf("p") == -1){
							param = request.getQueryString();			
						}	
					}
					} catch(Exception e) {
						response.sendRedirect("success_list.jsp");
					}
					
					pageContext.setAttribute("param",param);
					
					pageContext.setAttribute("isNextPage", isNext);
					pageContext.setAttribute("isPrevPage", isPrev);
					pageContext.setAttribute("firstPage", firstPage);
					pageContext.setAttribute("lastPage", lastPage);
					pageContext.setAttribute("next", nextPage);
					pageContext.setAttribute("prev", prevPage);
					pageContext.setAttribute("list", result);
					pageContext.setAttribute("size", result.size());
			
					%>
				<main style="margin-left: 24px; margin-top: 30px;">
				<div>
					<h1 style="font-size: 18px; font-weight: bold;">완료된 계약</h1>
					<form id="frm" name="frm">
					<div>
					<input type="text" id="datepicker" name="startDate" value="<%= startDate %>"> - <input type="text" id="datepicker2" name="endDate" value="<%= endDate %>">   <input type="text" class="input-text" name="keyword" placeholder="상품을 검색하세요."  style="width:300px; border: 1px solid #CCCCCC">
					<input type="button" value="검색" id="searchBtn" class="btn btn-primary" style="height:35px"/>
					<input type="hidden" name = "contractflag" value="${param.contractflag }"/>
					</div>
					</form>
					
					
					<div id="main-section1" style="width: 900px; height:900px; flex-wrap: wrap;">
					
<!-- 					<div style="flex-direction: column;">
					<img src="https://kmong.com/img/tools/default_profile@2x.png" style="width: 100px; height: 100px; margin: 10px"/><br/>
					<span>구매자 XXX님</span><br>
					<span>구매 완료된 날짜</span>
					</div> -->
					<c:if test="${size==0}">
					<div style="display: flex;justify-content: center;align-items: center;text-align: center;"><div style="margin-left:280px;"><img src="https://kmong.com/img/seller/nothing.png" title="내역없음" > <h5 class="font-color-lighter">내역이 없습니다.</h5></div></div>
					</c:if>
					<c:forEach items="${ list }" var="item">
					<div style="margin:10px">
					<a href="#void"><img src="${item.postImg}" style="width: 120px; height: 150px; margin:10px;margin-left: 35px;"/></a><br/>
					<div style="font-size: 12px;text-align: center;">주문번호 : ${ item.orderId }</div>
					<div style="font-size: 12px;text-align: center;">구매자 ${ item.memberNick }님</div>
					<div style="font-size: 12px;text-align: center;">완료 : ${ item.orderDate }</div>
					</div>
					</c:forEach>
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
				</div>
				
				
				</main>
				</div>
				</div>
				

<%@include file="../common/footer.jsp"%>
</body>
</html>
