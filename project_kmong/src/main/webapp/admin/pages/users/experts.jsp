<%@page import="com.kmong.paging.PageImpl"%>
<%@page import="com.kmong.paging.Paging"%>
<%@page import="com.kmong.vo.admin.AdminMemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/admin_validate.jsp" %>
<%
String opt=request.getParameter("search");
String exp="Y";
String table="member";
AdminDAO aDAO = AdminDAO.getInstance();
List<AdminMemberVO> list = aDAO.selectAllMember(opt, exp);
int totalCnt = aDAO.getAllCount(table, exp);
int todayCnt = aDAO.getTodayCount(table, exp);

pageContext.setAttribute("list", list);

/* paging */
Paging paging = new PageImpl(request,list);

int firstPage = paging.getFirstPage();
int lastPage = paging.getLastPage();
boolean isNext = paging.isNextPage();
boolean isPrev = paging.isPrevPage();
List<AdminMemberVO> result = paging.getVoAsPagePerRecord();
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
    <title>Experts</title>
  	<c:import url="http://211.63.89.132/admin/pages/common/cdn.jsp"/>
  	<style>
  		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&display=swap');
		.table td a:hover{color:#6C7293;}
		.table td{font-size:1.05rem; font-family: 'Noto Sans KR', sans-serif; color:white;}
		.table thead th{font-size:1.2rem; color:white;}	
	</style>	
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- sidebar.jsp (left)-->
      <c:import url="http://211.63.89.132/admin/pages/common/sidebar.jsp"/>
		<script>
		const navActive = document.getElementById("nav-users");
		const uiShow = document.getElementById("ui-user");
		navActive.classList.add('active');
		uiShow.classList.add('show');
		$(function(){
			$("#search-btn").click(function(){
				$("#search-frm").submit();
			})
		})
		</script>
      <!-- body -->
      <div class="container-fluid page-body-wrapper">
        <!-- navbar.jsp -->
        <c:import url="http://211.63.89.132/admin/pages/common/navbar.jsp"/>
<!----------------------------------------------------- ???????????? ???,?????? nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- ????????? ?????? ?????? ?????? ???. -->


            <div class="page-header">
              <h3 class="page-title"> Users </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="http://211.63.89.132/admin/pages/users/experts.jsp">Experts</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Expert Status</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <!-- ??? ????????? ?????? . JSP?????? ???????????????-->
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Expert Status</h4>
                    <div>??? ????????? ??? : <%=totalCnt %>??? | ?????? ????????? ????????? ???: <%=todayCnt %>???</div><br/>
                    <div class="form-group">
                      <form id="search-frm">
                      <div class="input-group">
                        <input type="text" name="search" class="form-control" placeholder="Search email, expert number, nickname, category" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                        	<input type="button" id="search-btn" class="btn btn-fw btn-outline-secondary" style="border-color:white;" value="Search">
                        </div>
                      </div>
                      </form>
                    </div><br/>
                    <div class="table-responsive">
                    
                      <table class="table table-striped">
                      	<c:if test="${size==0}">
                      		<div style="text-align:center;">?????? ????????? ???????????? ????????????</div>
                      	</c:if>          
                      	<c:if test="${size!=0}">            
                        <thead>
                          <tr>
                            <th> ExpertNo. </th>
                            <th> E-mail </th>
                            <th> Nickname </th>
                            <th> Category</th>
                            <th> Join Date </th>
                            <th> Edit </th>
                          </tr>
                        </thead>
                        <c:forEach var="exp" items="${list}">
                        <tbody>
                          <tr>
                            <td class="py-1">
                              ${exp.memberId}
                            </td>
                            <td>${exp.email}</td>
                            <td>${exp.nick}</td>
                            <td>${exp.categoryName }</td>
                            <td>${exp.joinDate}</td>
                            <td> 
                              <a href="http://211.63.89.132/admin/pages/users/experts_edit.jsp?id=${exp.memberId }" style="color:white;">
                                ??????
                              </a>
                            </td>
                          </tr>
                        </tbody>
                        </c:forEach>
                        </c:if>
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
			
          </div>
			<!-- content-wrapper ends -->
		  	<c:import url="http://211.63.89.132/admin/pages/common/footer.jsp"/>
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
  </body>
</html>