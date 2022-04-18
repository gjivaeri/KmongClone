<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>User Edit</title>
  	<c:import url="http://localhost/project_kmong/admin/pages/common/cdn.jsp"/>
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- sidebar.jsp (left)-->
      <c:import url="http://localhost/project_kmong/admin/pages/common/sidebar.jsp"/>
		<script>
		const navActive = document.getElementById("nav-users");
		const uiShow = document.getElementById("ui-user");
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
              <h3 class="page-title"> Users </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="users.jsp">Users</a></li>
                  <li class="breadcrumb-item active" aria-current="page">User Status</li>
                  <li class="breadcrumb-item active" aria-current="page">User Edit</li>
                </ol>
              </nav>
            </div>

            <div class="row">

              <div class="col-12 grid-margin">
                <div class="card">

                  <div class="card-body">
                      <h4 class="card-title mb-1">User Edit</h4>
                      <p class="card-description">User info </p>
                    <div class="row">
                      <div class="col-12">
                        <div class="preview-list">

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>회원번호</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">3</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>이메일</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">user1@naver.com</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>닉네임</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">username</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>가입일</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">April 20, 2022</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>전문분야</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">IT/Programming, 문학, 영상</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>관심사</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">영상</h6>
                            </div>
                          </div><br/>
                    	  <button type="button" class="btn btn-outline-danger btn-icon-text">
                      		<i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete
                      	  </button>
                		</div>
              		  </div>
            	   </div>
                 </div>
            	<!-- card-body ends -->
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