<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<nav class="navbar p-0 fixed-top d-flex flex-row">
  <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
    <a class="navbar-brand brand-logo-mini kmong-title" href="http://localhost/project_kmong/admin/admin_index.jsp"><i class="mdi mdi-baby-face"></i></a>
  </div>

  <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
    <!-- 축소버튼 -->
    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
      <span class="mdi mdi-menu"></span>
    </button>

    <!--검색버튼 -->
    <ul class="navbar-nav w-100">
      <li class="nav-item w-100">
        <form action="http://localhost/project_kmong/admin/pages/posts/posts.jsp" class="nav-link mt-2 mt-md-0 d-none d-lg-flex search top-search-frm">
          <input type="text" name="search" class="form-control" placeholder="Search products">
        </form>
      </li>
    </ul>

    <!-- 관리자계정 관리 -->
    <ul class="navbar-nav navbar-nav-right">
      
      <li class="nav-item dropdown">
        <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
          <div class="navbar-profile">
            <img class="img-xs rounded-circle" src="http://localhost/project_kmong/admin/assets/images/faces/monkey.png" alt="">
            <p class="mb-0 d-none d-sm-block navbar-profile-name">Admin</p>
            <i class="mdi mdi-menu-down d-none d-sm-block"></i>
          </div>
        </a>
        <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="profileDropdown">
          <h6 class="p-3 mb-0">Profile</h6>
          <div class="dropdown-divider"></div>

          <a class="dropdown-item preview-item" href="http://localhost/project_kmong/admin/pages/account/admin_setting.jsp">
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

          <a class="dropdown-item preview-item" href="http://localhost/project_kmong/templates/home/admin_index.jsp">
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


          <a class="dropdown-item preview-item" href="http://localhost/project_kmong/admin/pages/account/admin_login.jsp">
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