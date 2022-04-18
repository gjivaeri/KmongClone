<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Kmong Admin</title>
    <!-- plugins:css -->
    <!-- 아이콘관련 -->
    <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">

    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../assets/images/favicon.png" />
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.jsp -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
          <a class="sidebar-brand brand-logo kmong-title" href="../../index.jsp" style="color:white; font-weight: bold;">

            <i class="mdi mdi-baby-face text-warning"></i>
            <span >Kmong Admin</span>
          </a>
          <a class="sidebar-brand brand-logo-mini" href="../../index.jsp"><i class="mdi mdi-baby-face"></i></a>
        </div>

        <!-- 목록창 -->
        <ul class="nav">
          <li class="nav-item profile">

          <!-- 프로필시작 -->
            <div class="profile-desc">

              <div class="profile-pic">
                <div class="count-indicator">
                  <img class="img-xs rounded-circle " src="../../assets/images/faces/squidGame.jpg" alt="">
                  <span class="count bg-success"></span>
                </div>
                <div class="profile-name">
                  <h5 class="mb-0 font-weight-normal">Admin</h5>
                  <span>Administrator</span>
                </div>
              </div>

            </div>
          </li>


          <li class="nav-item nav-category">
            <span class="nav-link">Navigation</span>
          </li>

          <!-- 대시보드 -->
          <li class="nav-item menu-items">
            <a class="nav-link" href="../../index.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i>
              </span>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>

          <!-- 게시판관리 -->
          <li class="nav-item menu-items">
            <!-- <a class="nav-link" data-toggle="collapse" href="#ui-post" aria-expanded="false" aria-controls="ui-basic"> -->
            <a class="nav-link" data-toggle="collapse" data-target="#ui-post" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-calendar-text"></i>
              </span>
              <span class="menu-title">Posts</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-post">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../../pages/posts/posts.jsp">Post List</a></li>
              </ul>
            </div>
          </li>

          <!-- 회원관리 -->
          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#ui-user" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-contacts"></i>
              </span>
              <span class="menu-title">Users</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-user">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../../pages/users/users.jsp">Users</a></li>
                <li class="nav-item"> <a class="nav-link" href="../../pages/users/experts.jsp">Experts</a></li>
              </ul>
            </div>
          </li>

          <!-- 결제관리 -->
          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#ui-order" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-basket"></i>
              </span>
              <span class="menu-title">Orders</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-order">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../../pages/orders/orders.jsp">Order Status</a></li>
              </ul>
            </div>
          </li>

          <!-- 서비스관리 -->
          <li class="nav-item menu-items active">
            <a class="nav-link" data-toggle="collapse" href="#ui-category" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-wrench"></i>
              </span>
              <span class="menu-title">Categories</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse show" id="ui-category">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../../pages/categories/categories.jsp">Category List</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>


      <!-- 본문 -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_navbar.jsp -->
        <nav class="navbar p-0 fixed-top d-flex flex-row">
          <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
            <a class="navbar-brand brand-logo-mini" href="../../index.jsp"><i class="mdi mdi-baby-face text-warning"></i></a>
          </div>

          <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
            <!-- 축소버튼 -->
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
              <span class="mdi mdi-menu"></span>
            </button>

            <!-- 검색버튼 -->
            <ul class="navbar-nav w-100">
              <li class="nav-item w-100">
                <form class="nav-link mt-2 mt-md-0 d-none d-lg-flex search">
                  <input type="text" class="form-control" placeholder="Search products">
                </form>
              </li>
            </ul>

            <!-- 관리자계정 관리 -->
            <ul class="navbar-nav navbar-nav-right">
              
              <li class="nav-item dropdown">
                <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
                  <div class="navbar-profile">
                    <img class="img-xs rounded-circle" src="../../assets/images/faces/squidGame.jpg" alt="">
                    <p class="mb-0 d-none d-sm-block navbar-profile-name">Admin</p>
                    <i class="mdi mdi-menu-down d-none d-sm-block"></i>
                  </div>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="profileDropdown">
                  <h6 class="p-3 mb-0">Profile</h6>
                  <div class="dropdown-divider"></div>

                  <a class="dropdown-item preview-item" href="../../pages/account/admin-setting.jsp">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-settings text-success"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Settings</p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>

                  <a class="dropdown-item preview-item" href="#void">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-baby-face-outline text-info"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Return</p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>


                  <a class="dropdown-item preview-item" href="../../pages/account/admin-login.jsp">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-logout text-danger"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Log out</p>
                    </div>
                  </a>

                </div>
              </li>
            </ul>

            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
              <span class="mdi mdi-format-line-spacing"></span>
            </button>
          </div>
        </nav>
<!----------------------------------------------------- 여기까지 좌,상단 nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- 여기에 본문 내용 채울 것. -->


            <div class="page-header">
              <h3 class="page-title"> Categories </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="categories.jsp">Categories</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Category List</li>
                  <li class="breadcrumb-item active" aria-current="page">Category Edit</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <!-- 표 테이블 시작 . JSP에서 자동화할것-->
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Category Edit</h4>
                    <form class="form-sample">
                      <p class="card-description">Category info </p>

                      <!-- 이름, 작성자 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Title</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="카테고리이름">
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Category Image</label>
                            <div class="col-sm-9">
                              <img src="../../assets/images/auth/Login_bg.jpg" style="height:200px;" alt="thumbnail">
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Image Upload</label>
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

                      <button type="button" class="btn btn-outline-secondary btn-icon-text"> 
                        <i class="mdi mdi-file-check btn-icon-prepend"></i>Edit
                      </button>&emsp;
                      <button type="button" class="btn btn-outline-danger btn-icon-text">
                        <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete</button>

                    </form>
                  </div>
                </div>
              </div>







        </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.jsp -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <script src="../../assets/js/settings.js"></script>
    <script src="../../assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>