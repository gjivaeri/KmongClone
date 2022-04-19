<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
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
                    <div>총 결제내역 : 15건 | 완료: 11건 | 대기중: 2건 | 취소:2건</div>
                    <div>오늘 결제내역 : 15건 | 완료: 11건 | 대기중: 2건 | 취소:2건</div><br/>
                    <div class="form-group">
                      <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search Post title" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                          <button class="btn btn-fw btn-outline-secondary" type="button">Search</button>
                        </div>
                      </div>
                    </div><br/>
                    <div class="table-responsive">
                      <table class="table">
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

                          <tr>
                            <td class="py-1">
                              15
                            </td>
                            <td>1</td>
                            <td><a href="orders_detail.jsp" style="color:white">IT관련 서비스 게시글</a></td>
                            <td>expert1</td>
                            <td>user5</td>
                            <td>50,000</td>
                            <td>April 9, 2023</td>
                            <td>
                              <div class="badge badge-outline-warning">Pending</div>
                            </td>
                          </tr>

                          <tr>
                            <td class="py-1">
                              14
                            </td>
                            <td>1</td>
                            <td><a href="orders_detail.jsp" style="color:white">IT관련 서비스 게시글</a></td>
                            <td>expert1</td>
                            <td>user5</td>
                            <td>50,000</td>
                            <td>April 9, 2023</td>
                            <td><label class="badge badge-outline-success">Approved</label></td>
                          </tr>

                          <tr>
                            <td class="py-1">
                              13
                            </td>
                            <td>1</td>
                            <td><a href="orders_detail.jsp" style="color:white">IT관련 서비스 게시글</a></td>
                            <td>expert1</td>
                            <td>user5</td>
                            <td>50,000</td>
                            <td>April 9, 2023</td>
                            <td><label class="badge badge-outline-danger">Canceled</label></td>
                          </tr>                        



                        </tbody>
                      </table>
                    </div>
                  </div>
                  <div style="text-align: center;">Pagination 여기서 구현</div>

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