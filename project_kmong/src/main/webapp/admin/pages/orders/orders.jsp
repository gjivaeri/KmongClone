<%@page import="com.kmong.paging.PageImpl"%>
<%@page import="com.kmong.paging.Paging"%>
<%@page import="com.kmong.vo.admin.AdminOrdersVO"%>
<%@page import="java.util.List"%>
<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String opt=request.getParameter("search");
String table = "orders";
AdminDAO aDAO = AdminDAO.getInstance();
List<AdminOrdersVO> list =  aDAO.selectAllOrder(opt);

/* order count  */
int totalCnt = aDAO.getAllCount(table);
int todayCnt = aDAO.getTodayCount(table);
int totalStatCntY = aDAO.getAllCount(table, "Y");
int todayStatCntY = aDAO.getTodayCount(table, "Y");
int totalStatCntN = aDAO.getAllCount(table, "N");
int todayStatCntN = aDAO.getTodayCount(table, "N");
int totalStatCntP = aDAO.getAllCount(table, "P");
int todayStatCntP = aDAO.getTodayCount(table, "P");

request.setAttribute("list", list);
/* end order count */
/* paging */
Paging paging = new PageImpl(request,list);
paging.setPagePerRecord(10);

int firstPage = paging.getFirstPage();
int lastPage = paging.getLastPage();
boolean isNext = paging.isNextPage();
boolean isPrev = paging.isPrevPage();
List<AdminOrdersVO> result = paging.getVoAsPagePerRecord();
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
/* endPaging */
%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Orders</title>
  	<c:import url="http://localhost/project_kmong/admin/pages/common/cdn.jsp"/>
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- sidebar.jsp (left)-->
      <c:import url="http://localhost/project_kmong/admin/pages/common/sidebar.jsp"/>
		<script>
		const navActive = document.getElementById("nav-orders");
		const uiShow = document.getElementById("ui-order");
		navActive.classList.add('active');
		uiShow.classList.add('show');
		
		$(function(){
			$(".N").html("<label class='badge badge-outline-danger'>[N] Canceled</label>");
			$(".Y").html("<label class='badge badge-outline-success'>[Y] Approved</label>");
			$(".P").html("<label class='badge badge-outline-warning'>[P] Pending</label>");
		});//ready

		function nextSubmit() {
			$("#nextFrm").submit();
		}
		function prevSubmit() {
			$("#prevFrm").submit();
		}

		</script>
      <!-- body -->
      <div class="container-fluid page-body-wrapper">
        <!-- navbar.jsp -->
        <c:import url="http://localhost/project_kmong/admin/pages/common/navbar.jsp"/>
<!----------------------------------------------------- 여기까지 좌,상단 nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- 여기에 본문 내용 채울 것. -->


            <div class="page-header">
              <h3 class="page-title"> Orders </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Orders</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Order Status</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <!-- 표 테이블 시작 . JSP에서 자동화할것-->

              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Order Status</h4>
                    <div>총 결제내역 : <%=totalCnt %>건 | 완료: <%=totalStatCntY %>건 | 대기중: <%=totalStatCntP %>건 | 취소: <%=totalStatCntN %>건</div>
                    <div>오늘 결제내역 : <%=todayCnt %>건 | 완료: <%=todayStatCntY %>건 | 대기중: <%=todayStatCntP %>건 | 취소: <%=todayStatCntN %>건</div><br/>
                    <div class="form-group">
                      <form id="search-frm">
                      <div class="input-group">
                        <input type="text" name="search" class="form-control" placeholder="Search OrderNo, PostNo, Post title, expert, user, status" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                        	<input type="button" id="search-btn" class="btn btn-fw btn-outline-secondary" style="border-color:white;" value="Search">
                        </div>
                      </div>
                      </form>
                    </div><br/>
                    <div class="table-responsive">
                      <table class="table">
                         <c:if test="${size==0}">
                      		no_exists_contents_replace_later
                      	</c:if>
                        <thead>
                          <tr>
          
                            <th style="width:50px;"> OrderNo. </th>
                            <th style="width:50px;"> PostNo. </th>
                            <th> PostTitle </th>
                            <th style="width:150px;"> Expert</th>
                            <th style="width:150px;"> User </th>
                            <th style="width:150px;"> Price </th>
                            <th style="width:150px;"> Order Date </th>
                            <th style="width:150px;"> Status </th>

                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${list }">
                          <tr>
                            <td class="py-1">
                              ${order.orderId }
                            </td>
                            <td>${order.postId }</td>
                            <td><a href="http://localhost/project_kmong/admin/pages/orders/orders_detail.jsp?id=${order.orderId }" style="color:white">${order.title }</a></td>
                            <td>${order.expert }</td>
                            <td>${order.user }</td>
                            <td>${order.price}</td>
                            <td>${order.orderDate }</td>
                            <td>	
                              <div class="${order.status }" ></div>
                            </td>
                          </tr>
                        </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
					<!-- paging -->
					<c:if test="${size!=0}">

					<form id="prevFrm">
						<input type="hidden" value="${prev }" name="p">
					</form>
					<form id="nextFrm">
						<input type="hidden" value="${next }" name="p">
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
					</c:if>
					<!-- paging -->
              </div>

			</div>
          </div>
			<!-- content-wrapper ends -->
		  	<c:import url="http://localhost/project_kmong/admin/pages/common/footer.jsp"/>
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
  </body>
</html>