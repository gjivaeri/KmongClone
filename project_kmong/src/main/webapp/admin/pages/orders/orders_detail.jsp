<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Order detail</title>
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
                  <li class="breadcrumb-item"><a href="orders.jsp">Orders</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Order Status</li>
                  <li class="breadcrumb-item active" aria-current="page">Order Detail</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <!-- 표 테이블 시작 . JSP에서 자동화할것-->

              <div class="col-12 grid-margin">
                <div class="card">


                  <div class="card-body">
                      <h4 class="card-title mb-1">Order Detail</h4>
                      <p class="card-description">Order info </p>
                    <div class="row">
                      <div class="col-12">
                        <div class="preview-list">

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>주문번호</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">3</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>게시글번호</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">5</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>게시글제목</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">게시글제목 입니다</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>주문일</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">April 20, 2022</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>전문가</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">expert1</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>사용자</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">user1</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>가격</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">50,000</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>상태</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">Canceled</h6>
                            </div>
                          </div>
                          <br/>
                          <button type="button" class="btn btn-outline-danger btn-icon-text">
                            <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete</button>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
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