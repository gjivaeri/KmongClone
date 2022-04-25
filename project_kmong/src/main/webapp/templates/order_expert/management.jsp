<%@page import="com.kmong.vo.ExpertOrderVO"%>
<%@page import="com.kmong.paging.PageImpl"%>
<%@page import="com.kmong.paging.Paging"%>
<%@page import="com.kmong.vo.OrdersVO"%>
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
$(function() {
	 $('#acceptChk').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget); // Button that triggered the modal
		  var recipient = button.data('id'); // Extract info from data-* attributes
		  var modal = $(this);
		  modal.find('#acceptHid').val(recipient);
		 
		})
	
	 $("#acceptOk").click(function() {
		 let id=$("#acceptHid").val()
		 $.ajax({
			 url:"accept.jsp",
			 method:"post",
			 data : "id="+id,
			 success:function() {
				 location.href=location.href;

			 } 
		 })
	 })//click
	 $('#cancelChk').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget); // Button that triggered the modal
		  var recipient = button.data('id'); // Extract info from data-* attributes
		  var modal = $(this);
		  modal.find('#cancelHid').val(recipient);
		 
		})
	
	 $("#cancelOk").click(function() {
		 let id=$("#cancelHid").val()
		 $.ajax({
			 url:"excancel.jsp",
			 method:"post",
			 data : "id="+id,
			 success:function() {
				 location.href=location.href;

			 } 
		 })
	 })//click
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
					
					List<ExpertOrderVO> list = oDAO.selectExpertRequestedOrdersRange(startDate, endDate, keyword, "P",sid);
					
					Paging paging = new PageImpl(request,list);
					paging.setPagePerRecord(12);
					
					int firstPage = paging.getFirstPage();
					int lastPage = paging.getLastPage();
					boolean isNext = paging.isNextPage();
					boolean isPrev = paging.isPrevPage();
					List<ExpertOrderVO> result = paging.getVoAsPagePerRecord();
					int nextPage = paging.getNextPage();
					int prevPage = paging.getPrevPage();
					

					
					pageContext.setAttribute("isNextPage", isNext);
					pageContext.setAttribute("isPrevPage", isPrev);
					pageContext.setAttribute("firstPage", firstPage);
					pageContext.setAttribute("lastPage", lastPage);
					pageContext.setAttribute("next", nextPage);
					pageContext.setAttribute("prev", prevPage);
					pageContext.setAttribute("list", result);
			
					%>
				<main style="margin-left: 24px; margin-top: 30px;">
				<div>
					<h1 style="font-size: 18px; font-weight: bold;">계약 요청 승인</h1>
					<div id="main-section1" style="width: 900px; height:900px; flex-wrap: wrap;">
					
<!-- 					<div style="flex-direction: column;">
					<img src="https://kmong.com/img/tools/default_profile@2x.png" style="width: 100px; height: 100px; margin: 10px"/><br/>
					<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#acceptChk" style="float: left: ;">승인</button>
					<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#cancelChk" style="float: right;">철회</button>
					</div> -->
					<c:if test="${size==0}">
					<div style="display: flex;justify-content: center;align-items: center;text-align: center;"><div style="margin-left:280px;"><img src="https://kmong.com/img/seller/nothing.png" title="내역없음" > <h5 class="font-color-lighter">내역이 없습니다.</h5></div></div>
					</c:if>
					<c:if test="${size!=0 }">					
					<c:forEach items="${ list }" var ="item">
					<div style="margin:10px;">
					<div style="text-align: center;">${ item.orderDate }</div>
					<a href="#void"><img src="${item.postImg}" style="width: 120px; height: 150px; margin:10px;margin-left: 35px;"/></a><br/>
					<div style="font-size: 12px;text-align: center;"><strong>${ item.memberNick }</strong>님 께서 계약을 요청했습니다.</div>
					<div>
					<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-id="${item.orderId }" data-bs-target="#acceptChk" style="float: left: ;">승인</button>
					<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-id="${item.orderId }" data-bs-target="#cancelChk" style="float: right;">철회</button>
					</div>
					</div>					
					</c:forEach>
					</div>
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
					
					<!-- paging -->	
									
					<!-- Modal -->
					<div class="modal fade" id="acceptChk" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						 <form id="acceptForm">
						 <input type="hidden" value="" id="acceptHid"/>
						 </form>
						 <div class="modal-dialog">
						   <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body" style="text-align: center;">
					       승인하시겠습니까?
					      </div>
					      <div class="modal-footer" style="flex-direction: row;">
						       <button type="button" id="acceptOk" class="btn btn-secondary" data-bs-dismiss="modal" style="align-content: center;">OK</button>
						       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
						     </div>
						   </div>
					  </div>
					</div>
					</c:if>
					<!-- Modal -->
					<div class="modal fade" id="cancelChk" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						 <form id="cancelForm">
						 <input type="hidden" value="" id="cancelHid"/>
						 </form>						
						 <div class="modal-dialog">
						   <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body" style="text-align: center;">
					      철회하시겠습니까?
					      </div>
					      <div class="modal-footer" style="flex-direction: row;">
						       <button type="button" id="cancelOk" class="btn btn-secondary" data-bs-dismiss="modal" style="align-content: center;">OK</button>
						       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
						     </div>
						   </div>
					  </div>
					</div>
					
					
				</div>	
				</main>
				</div>
				
				</div>
			
<%@include file="../common/footer.jsp"%>
</body>
</html>