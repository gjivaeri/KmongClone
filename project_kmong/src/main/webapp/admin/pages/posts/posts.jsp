<%@page import="java.util.List"%>
<%@page import="com.kmong.paging.PageImpl"%>
<%@page import="com.kmong.paging.Paging"%>
<%@page import="com.kmong.vo.admin.AdminPostsVO"%>
<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String opt="TITLE2";
AdminDAO aDAO = AdminDAO.getInstance();
List<AdminPostsVO> list = aDAO.selectAllPost(opt);

Paging paging = new PageImpl(request,list);
paging.setPagePerRecord(12);

int firstPage = paging.getFirstPage();
int lastPage = paging.getLastPage();
boolean isNext = paging.isNextPage();
boolean isPrev = paging.isPrevPage();
List<AdminPostsVO> result = paging.getVoAsPagePerRecord();
int nextPage = paging.getNextPage();
int prevPage = paging.getPrevPage();

pageContext.setAttribute("isNextPage", isNext);
pageContext.setAttribute("isPrevPage", isPrev);
pageContext.setAttribute("firstPage", firstPage);
pageContext.setAttribute("lastPage", lastPage);
pageContext.setAttribute("next", nextPage);
pageContext.setAttribute("prev", prevPage);
pageContext.setAttribute("list", result);
pageContext.setAttribute("size", result.size());

%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Posts</title>
  	<c:import url="http://localhost/project_kmong/admin/pages/common/cdn.jsp"/>
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- sidebar.jsp (left)-->
      <c:import url="http://localhost/project_kmong/admin/pages/common/sidebar.jsp"/>
		<script>
		const navActive = document.getElementById("nav-posts");
		const uiShow = document.getElementById("ui-post");
		navActive.classList.add('active');
		uiShow.classList.add('show');
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
                  <li class="breadcrumb-item"><a href="#">Posts</a></li>
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
                    <div class="form-group">
                      <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search Post title" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                          <button class="btn btn-fw btn-outline-secondary" type="button">Search</button>
                        </div>
                      </div>
                    </div><br/>
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
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
                              ${posts.post_id}
                            </td>
                            <td> ${posts.category_name} </td>
                            <td>
                                <a href="posts_edit.jsp" style="color:white;">
                                ${posts.title }
                                </a>
                            </td>
                            <td>${posts.email}</td>
                            <td>${posts.post_date}</td>
                          </tr>
                        </tbody>
                     </c:forEach>
                      </table>
                    </div> 
                  </div>
                  <div style="text-align:center;">
                  
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

                  
                  </div>

                </div>
              </div>
             </div>
             <!-- row ends -->

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