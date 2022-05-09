<%@page import="java.sql.SQLException"%>
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
<%@include file ="validate_expert.jsp" %>

<% 
int sid = login;  
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
		 
	$("#OsearchBtn").click(function (){
		 $("#Ofrm").submit();
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

			<div id="aside-div">
			<%@include file ="leftside.jsp" %>

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
					 
					//try{
					List<ExpertOrderVO>list = oDAO.selectExpertRequestedOrdersRange(startDate, endDate, keyword, "Y",sid);
					
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
					
/* 				} catch(SQLException se) {
						response.sendRedirect(request.getRequestURI());
					} catch(Exception e) {
						response.sendRedirect(request.getRequestURI());
					}  */
			
					%>
				<main style="margin-left: 24px; margin-top: 30px;">
				<div>
					<h1 style="font-size: 18px; font-weight: bold;">완료된 계약</h1>
					<form id="Ofrm" name="Ofrm">
					<div>
					<input type="text" id="datepicker" name="startDate" value="<%= startDate %>"> - <input type="text" id="datepicker2" name="endDate" value="<%= endDate %>">   <input type="text" class="input-text" name="keyword" placeholder="상품을 검색하세요."  style="width:300px; border: 1px solid #CCCCCC">
					<input type="button" value="검색" id="OsearchBtn" class="btn btn-primary" style="height:35px"/>
					<input type="hidden" name = "contractflag" value="${param.contractflag }"/>
					</div>
					</form>
					
					
					<div id="main-section1" style="width: 900px; height:900px; flex-wrap: wrap;">
					
					<c:if test="${size==0}">
					<div style="display: flex;justify-content: center;align-items: center;text-align: center;"><div style="margin-left:280px;"><img src="https://kmong.com/img/seller/nothing.png" title="내역없음" > <h5 class="font-color-lighter">내역이 없습니다.</h5></div></div>
					</c:if>
					<c:forEach items="${ list }" var="item">
					<div style="margin:10px;">
					<a href="http://211.63.89.132/templates/service/detail.jsp?id=${ item.postId }"><img src="http://211.63.89.132/static/PostimgUpload/${item.postImg}" style="width: 120px; height: 150px; margin:10px;margin-left: 25px;"/></a><br/>
					<div style="font-size: 14px;text-align: center;">주문번호 : ${ item.orderId }</div>
					<div style="font-size: 14px;text-align: center;">구매자 ${ item.memberNick }님</div>
					<div style="font-size: 14px;text-align: center;">${ item.orderDate }</div>
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

