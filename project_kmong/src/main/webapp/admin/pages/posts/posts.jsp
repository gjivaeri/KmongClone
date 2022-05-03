<%@page import="java.util.List"%>
<%@page import="com.kmong.paging.PageImpl"%>
<%@page import="com.kmong.paging.Paging"%>
<%@page import="com.kmong.vo.admin.AdminPostsVO"%>
<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/admin_validate.jsp" %>
<%
String table="POST";
String tempSearch=request.getParameter("search");
AdminDAO aDAO = AdminDAO.getInstance();
List<AdminPostsVO> list = aDAO.selectAllPost(tempSearch);
int totalCnt = aDAO.getAllCount(table);
int todayCnt = aDAO.getTodayCount(table);

/* paging */
Paging paging = new PageImpl(request,list,10);

int firstPage = paging.getFirstPage();
int lastPage = paging.getLastPage();
boolean isNext = paging.isNextPage();
boolean isPrev = paging.isPrevPage();
List<AdminPostsVO> result = paging.getVoAsPagePerRecord();
int nextPage = paging.getNextPage();
int prevPage = paging.getPrevPage();

String param="";

if (request.getQueryString() != null) {
	//param = request.getQueryString().substring(request.getQueryString().indexOf("p")+4);
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
    <title>Posts</title>
  	<c:import url="http://localhost/project_kmong/admin/pages/common/cdn.jsp"/>
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
      <c:import url="http://localhost/project_kmong/admin/pages/common/sidebar.jsp"/>
		<script type="text/javascript">
		$(function(){
			const navActive = document.getElementById("nav-posts");
			const uiShow = document.getElementById("ui-post");
			navActive.classList.add('active');
			uiShow.classList.add('show');
				
			 $("#search-btn").click(function(){
				 $("#search-frm").submit();
			 })
			 
			
		});//ready
		function nextSubmit() {
			$("#nextFrm").submit();
		}
		function prevSubmit() {
			$("#prevFrm").submit();
		}

		 
/* 		 
		function getQueryString(key) {
		    var str = location.href;
		    var index = str.indexOf("?") + 1;
		    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
		 
		    if (index == 0) {
		        return "";
		    }

		    str = str.substring(index, lastIndex); 
		    str = str.split("&");
		    var rst = "";
		 
		    for (var i = 0; i < str.length; i++) {
		    	
		        var arr = str[i].split("=");
		        if(arr.length != 2){
		        break;
		    }
		        if (arr[0] == key) {
		            rst = arr[1];
		            break;
		        }
		    }
		    return rst;
		} */


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
              <h3 class="page-title"> Posts </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="http://localhost/project_kmong/admin/pages/posts/posts.jsp">Posts</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Post List</li>
                </ol>
              </nav>
            </div>
            
            <div class="row">
              <!-- 표 테이블 시작 . JSP에서 자동화할것-->
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Post List</h4>
                    <div>총 게시글 수 : <%=totalCnt %>건 | 오늘 등록된 게시글 수: <%=todayCnt %>건</div><br/>
                    <div class="form-group">
                      <form id="search-frm">
                      <div class="input-group">
                        <input type="text" name="search" class="form-control" placeholder="Search No, PostNo, Category, Title, Writer" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                        	<input type="button" id="search-btn" class="btn btn-fw btn-outline-secondary" style="border-color:white;" value="Search">
                        </div>
                      </div>
                      </form>
                    </div><br/>
                    <div class="table-responsive">
                      <table class="table table-striped" id="post-table">
                      	<c:if test="${size==0}">
                      		<div style="text-align:center;">검색 결과가 존재하지 않습니다</div>
                      	</c:if>
                      	<c:if test="${size!=0}">                      	
                        <thead>
                          <tr>
                            <th> No. </th>
                            <th> PostNo. </th>
                            <th> Category </th>
                            <th> Title </th>
                            <th> Writer </th>
                            <th> Write Date </th>
                          </tr>
                        </thead>
                        
                    <c:forEach var="posts" items="${list}">
                        <tbody>
                          <tr>
                            <td class="py-1">
                              ${posts.rnum}
                            </td>
                            <td class="py-1">
                              ${posts.postId}
                            </td>
                            <td> ${posts.categoryName} </td>
                            <td>
                                <a href="posts_edit.jsp?postId=${posts.postId}">
                                ${posts.title}
                                </a>
                            </td>
                            <td>${posts.email}</td>
                            <td>${posts.postDate}</td>
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
					
					<div id="page-div" style="text-align:center;height: 40px;">
					<c:if test="${ isPrevPage }">
						<a href="#void" onclick="prevSubmit()">prev</a>
					</c:if>
					<c:forEach var="i" begin="${firstPage}" end="${lastPage}" step="1">
 					<a href="?p=${i }&<%=param %>">${i }</a>

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
    </div>
  </body>
</html>