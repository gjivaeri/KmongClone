<%@page import="java.sql.SQLException"%>
<%@page import="com.kmong.paging.PageImpl"%>
<%@page import="com.kmong.paging.Paging"%>
<%@page import="com.kmong.vo.OrdersVO"%>
<%@page import="java.util.List"%>
<%@page import="com.kmong.dao.orders.OrdersDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>kmong</title>
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
<!-- Login여부 -->
<%@include file ="validate_session.jsp" %>

<% 
int sid = login;  
%>
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
	 
	 $("#contract").change(function() {
		 if ($("#contract").val() == "ordersReq") {
			 location.href="request_list.jsp";
			 return;
		 }
		 if ($("#contract").val() == "ordersCancel") {
			 location.href="cancel_list.jsp";
			 return;
		 }
		 if ($("#contract").val() == "ordersList") {
			 location.href="history_list.jsp";
			 return;
		 }
	 });
	 $("#searchBtn").click(function (){
		 $("#frm").submit();
	 })
	 
	 $("#prevBtn").click(function (){
		 $("#prevFrm").submit();
	 })
	 $("#nextBtn").click(function (){
		 $("#nextFrm").submit();
	 })
});//ready
</script>
</head>
<body>
 <%@include file="../common/header_member.jsp"%>
		<hr>
			<div id="aside-div">
			<%@include file ="user_leftside.jsp" %>

				<main style="margin-left: 24px; margin-top: 30px;">
				<div>
					<h1 style="font-size: 18px; font-weight: bold;">취소한 계약</h1>
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
					<form id="frm" name="frm">
					<div>
					<input type="text" id="datepicker" name="startDate" value="<%= startDate %>"> - <input type="text" id="datepicker2" name="endDate" value="<%= endDate %>">   <input type="text" class="input-text" name="keyword" placeholder="상품을 검색하세요."  style="width:300px; border: 1px solid #CCCCCC">
					<input type="button" value="검색" id="searchBtn" class="btn btn-primary" style="height:35px"/>
					<input type="hidden" name = "contractflag" value="${param.contractflag }"/>
					</div>
					</form>
				<%
					String param="";
					try{
						
					OrdersDAO oDAO = OrdersDAO.getInstance();
					List<OrdersVO> list = oDAO.selectRequestedOrdersRange(startDate, endDate, keyword, "N" ,sid);
					
					Paging paging = new PageImpl(request,list);
					paging.setPagePerRecord(9);
					
					int firstPage = paging.getFirstPage();
					int lastPage = paging.getLastPage();
					boolean isNext = paging.isNextPage();
					boolean isPrev = paging.isPrevPage();
					List<OrdersVO> result = paging.getVoAsPagePerRecord();
					int nextPage = paging.getNextPage();
					int prevPage = paging.getPrevPage();
					
					
						
						
					if (request.getQueryString() != null) {
						param = request.getQueryString().substring(request.getQueryString().indexOf("p")+4);
						if(request.getQueryString().indexOf("p") == -1){
							param = request.getQueryString();			
						}	
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
					
				} catch(SQLException se) {
					response.sendRedirect(request.getRequestURI());
				} catch(Exception e) {
					response.sendRedirect(request.getRequestURI());
				}
			
					%>
					<div id="main-section1" style="width: 850px; height:900px; flex-wrap: wrap;">
					<!-- 게시글 -->
					<c:if test="${size==0}">
					<div style="display: flex;justify-content: center;align-items: center;text-align: center;"><div style="margin-left:280px;"><img src="https://kmong.com/img/seller/nothing.png" title="내역없음" > <h5 class="font-color-lighter">내역이 없습니다.</h5></div></div>
					</c:if>
					<c:if test="${size!=0}">
					<c:forEach items="${ list }" var="item">
					<div style=" margin:10px">
					<a href="#void"><img src="${ item.orderImg }" style="width: 150px; height: 150px; margin: 10px"/></a><br/>
					<div style="text-align: center;">주문번호 : ${item.orderId }</div>
					</div>
					</c:forEach>
					<!-- 게시글 -->
					</div>
					
					<!-- paging -->
					<form id="prevFrm">
					<input type="hidden" value="${prev }" name="p">
					<input type="hidden" value="<%= request.getParameter("startDate") %>" name="startDate">
					<input type="hidden" value="<%= request.getParameter("endDate") %>" name="endDate">
					<input type="hidden" value="<%= request.getParameter("keyword") %>" name="keyword">
					</form>
					<form id="nextFrm">
					<input type="hidden" value="${next }" name="p">
					<input type="hidden" value="<%= request.getParameter("startDate") %>" name="startDate">
					<input type="hidden" value="<%= request.getParameter("endDate") %>" name="endDate">
					<input type="hidden" value="<%= request.getParameter("keyword") %>" name="keyword">
					</form>
					
					<div style="text-align:center;height: 40px;">
					<c:if test="${ isPrevPage }">
					<a href="#void" onclick="prevSubmit()">prev</a>
					</c:if>
					<c:forEach var="i" begin="${firstPage}" end="${lastPage}" step="1">
					<a href="?p=${i}&<%= param %>">${i}</a>
					</c:forEach>
					<c:if test="${ isNextPage }">

					<a href="#void" onclick="nextSubmit()">next</a>
					</c:if>
					</div>
					<!-- paging -->
					</c:if>
				</div>
				</main>
			</div>
				
				<div id="orders-guide">
				<h5>
				<strong>✓ 꼭 확인해주세요!</strong></h5>
				<ul>
				<li>• 세금계산서는 거래 주체인 전문가가 의뢰인에게 발행합니다.</li>
				<li>• 세금계산서는 사업자 인증 받은 기업전문가에게 요청하실 수 있습니다.</li>
				<li>• 이벤트 쿠폰 사용 금액은 할인된 금액이기 때문에 세금계산서에 포함되지 않습니다.</li>
				<li>• 거래명세서는 결제가 완료되었음을 증명하는 용도로만 활용 가능하며 세무상의 지출증빙 효력이 없습니다.</li>
				<li>• 현금영수증은 개인의 소득공제용으로만 사용 가능하며, 결제 당시 지출 증빙용으로 선택하셨더라도 매입세액공제를 받으실 수 없습니다.</li>
				</ul>
				</div>
			</div>	
			
<%@include file="../common/footer.jsp"%>
</body>
</html>
