<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
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
                        <tbody>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td> IT/Programming </td>
                            <td>
                                <a href="posts_edit.jsp" style="color:white;">
                                게시글의 타이틀이 들어가는 공간이다
                                </a>
                            </td>
                            <td>작성자의이름</td>
                            <td> May 15, 2015 </td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              2
                            </td>
                            <td> IT/Programming </td>
                            <td>
                                <a href="posts_edit.jsp" style="color:white;">
                                게시글의 타이틀이 들어가는 공간이다
                                </a>
                            </td>
                            <td>작성자의이름</td>
                            <td> May 15, 2015 </td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              3
                            </td>
                            <td> IT/Programming </td>
                            <td>
                                <a href="posts_edit.jsp" style="color:white;">
                                게시글의 타이틀이 들어가는 공간이다
                                </a>
                            </td>
                            <td>작성자의이름</td>
                            <td> May 15, 2015 </td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              4
                            </td>
                            <td> IT/Programming </td>
                            <td>
                                <a href="posts_edit.jsp" style="color:white;">
                                게시글의 타이틀이 들어가는 공간이다
                                </a>
                            </td>
                            <td>작성자의이름</td>
                            <td> May 15, 2015 </td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              5
                            </td>
                            <td> IT/Programming </td>
                            <td>
                                <a href="posts_edit.jsp" style="color:white;">
                                게시글의 타이틀이 들어가는 공간이다
                                </a>
                            </td>
                            <td>작성자의이름</td>
                            <td> May 15, 2015 </td>
                          </tr>
                        </tbody>
                      </table>
                    </div> 
                  </div>
                  <div style="text-align:center;">
                    여기서 페이지 구현
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