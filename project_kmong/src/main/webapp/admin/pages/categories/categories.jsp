<%@page import="java.util.List"%>
<%@page import="com.kmong.vo.CategoryVO"%>
<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/admin_validate.jsp" %>
<%
AdminDAO aDAO = AdminDAO.getInstance();
List<CategoryVO> cVOlist= aDAO.selectAllCategory();
pageContext.setAttribute("list", cVOlist);
%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Categories</title>
  	<c:import url="http://211.63.89.132/admin/pages/common/cdn.jsp"/>
  	 <style>
		a{text-decoration:none; color:white;}
	</style>
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- sidebar.jsp (left)-->
      <c:import url="http://211.63.89.132/admin/pages/common/sidebar.jsp"/>
		<script>
		const navActive = document.getElementById("nav-category");
		const uiShow = document.getElementById("ui-category");
		navActive.classList.add('active');
		uiShow.classList.add('show');
		</script>
      <!-- body -->
      <div class="container-fluid page-body-wrapper">
        <!-- navbar.jsp -->
        <c:import url="http://211.63.89.132/admin/pages/common/navbar.jsp"/>
<!----------------------------------------------------- 여기까지 좌,상단 nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- 여기에 본문 내용 채울 것. -->


            <div class="page-header">
              <h3 class="page-title"> Categories </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="http://211.63.89.132/admin/pages/categories/categories.jsp">Categories</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Category List</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <!-- 표 테이블 시작 . JSP에서 자동화할것-->

              <div class="col-12 grid-margin">
                <div class="card">


                  <div class="card-body">
                    <div class="d-flex flex-row justify-content-between">
                      <h4 class="card-title mb-1">Category List</h4>
                    </div><br/>
                    <div class="row">
                      <div class="col-12">
                        <div class="preview-list">

						<c:forEach var="category" items="${list}">
                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail">
                              <img src="http://211.63.89.132/static/${category.categoryImage}"/>
                            </div>
                            <div class="preview-item-content d-sm-flex flex-grow">
                              <div class="flex-grow">
                                <h4 class="preview-subject">${category.categoryName}</h4>
                                <a class="text-muted mb-0" href="http://211.63.89.132/admin/pages/categories/categories_edit.jsp?id=${category.categoryId}">edit</a>
                              </div>
                            </div>
                          </div>
                        </c:forEach>

                          <br/>
                          <a href="categories_add.jsp">
                          <button type="button" class="btn btn-primary btn-icon-text">
                            <i class="mdi mdi-upload btn-icon-prepend"></i>항목추가 </button>
                          </a>
    
                        </div>
                      </div>
                    </div>
                  </div>

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