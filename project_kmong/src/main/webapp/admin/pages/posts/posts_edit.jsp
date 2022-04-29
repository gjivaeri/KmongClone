<%@page import="com.kmong.vo.admin.AdminPostsVO"%>
<%@page import="com.kmong.dao.admin.AdminPostDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
int postId = Integer.parseInt(request.getParameter("postId"));
AdminPostDAO apDAO = AdminPostDAO.getInstance();
AdminPostsVO apVO = apDAO.selectDetailPost(postId);
request.setAttribute("post", apVO);
request.setAttribute("postNum", postId);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Post edit</title>
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
                  <li class="breadcrumb-item"><a href="posts.jsp">Posts</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Post List</li>
                  <li class="breadcrumb-item active" aria-current="page">Post Edit</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <!-- 표 테이블 시작 . JSP에서 자동화할것-->
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Post Edit</h4>
                    <form class="form-sample">
                      <p class="card-description"> Post No. ${postNum } </p>

                      <!-- 이름, 작성자 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Title</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="${post.title}">
                            </div>
                          </div>
                        </div>
                        
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Writer</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="${post.email}">
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- 카테고리, 작성일 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Category</label>
                            <div class="col-sm-9">
                              <select class="form-control">
                                <option value="${post.categoryName }" selected>${post.categoryName }</option>
                                <option>IT/Programming</option>
                                <option>Category3</option>
                                <option>Category4</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Write-Date</label>
                            <div class="col-sm-9">
                              <input class="form-control" placeholder="dd/mm/yyyy" value="${post.postDate}">
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- 가격 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Price</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="${post.price}">
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- 썸네일 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">thumbnail</label>
                            <div class="col-sm-9">
                              <input type="file" name="img[]" class="file-upload-default">
                              <div class="input-group col-xs-12">
                                <input type="text" class="form-control file-upload-info" disabled="" placeholder="Upload Image">
                                <span class="input-group-append">
                                  <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                </span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- 기존 썸네일 이미지 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Current thumbnail</label>
                            <div class="col-sm-9">
                              <img src="http://localhost/project_kmong/admin/assets/images/auth/Login_bg.jpg" style="height:200px;" alt="thumbnail"/>
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- 요약, 상세정보 -->
                      <p class="card-description"> Post Description </p>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="exampleTextarea1">Summary</label>
                            <textarea class="form-control" id="exampleTextarea1" rows="3">${post.summary}</textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="exampleTextarea1">Service Information</label>
                            <textarea class="form-control" id="exampleTextarea1" rows="8">${post.description}</textarea>
                          </div>
                        </div>
                      </div>

                      <button type="button" class="btn btn-outline-primary btn-icon-text">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> Submit </button>
                        &emsp;
                      <button type="button" class="btn btn-outline-danger btn-icon-text">
                        <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete</button>
                        <!-- <button type="submit" class="btn btn-danger mr-2">Delete</button> -->
                        &emsp;
                      <button type="button" class="btn btn-outline-warning btn-icon-text">
                        <i class="mdi mdi-reload btn-icon-prepend"></i> Reset </button>
                    </form>
                  </div>
                </div>
              </div>
             </div>

          </div>
          <!-- content-wrapper ends -->
          <!-- partial:http://localhost/project_kmong/admin/partials/_footer.jsp -->
		  	<c:import url="http://localhost/project_kmong/admin/pages/common/footer.jsp"/>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
  </body>
</html>