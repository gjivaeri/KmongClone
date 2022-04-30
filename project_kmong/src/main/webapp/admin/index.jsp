<%@page import="com.kmong.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@page import="com.kmong.dao.account.AccountSettingDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="pages/common/admin_validate.jsp" %>
<%
AdminDAO aDAO = AdminDAO.getInstance();

int totalPost = aDAO.getAllCount("post");
int totalExp = aDAO.getAllCount("member", "Y");
int totalUser = aDAO.getAllCount("member", "N");
int totalOrderY = aDAO.getAllCount("orders", "Y");
int totalOrderN = aDAO.getAllCount("orders", "N");
int totalOrderP = aDAO.getAllCount("orders", "P");

int todayPost = aDAO.getTodayCount("post");
int todayExp = aDAO.getTodayCount("member", "Y");
int todayUser = aDAO.getTodayCount("member", "N");
int todayOrderY = aDAO.getTodayCount("orders", "Y");

Date today = new Date();
/* end order count */
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Kmong Admin</title>
  	<c:import url="http://localhost/project_kmong/admin/pages/common/cdn.jsp"/>
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- sidebar.jsp (left)-->
      <c:import url="http://localhost/project_kmong/admin/pages/common/sidebar.jsp"/>
		<script>
		const navActive = document.getElementById("nav-dashboard");
		navActive.classList.add('active');
		localStorage.setItem("todayOrderY", <%=todayOrderY%>);
		</script>
      <!-- body -->
      <div class="container-fluid page-body-wrapper">
        <!-- navbar.jsp -->
        <c:import url="http://localhost/project_kmong/admin/pages/common/navbar.jsp"/>
<!----------------------------------------------------- 여기까지 좌,상단 nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">

            <div class="row">

              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4>전체 사용자 수</h4>
                    
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0"><%=totalUser %> 명</h2>
                          <p class="text-success ml-2 mb-0 font-weight-medium">+<%=todayUser %></p>
                        </div>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-account
                        text-primary ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4>전체 전문가 수</h4>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0"><%=totalExp %> 명</h2>
                          <p class="text-success ml-2 mb-0 font-weight-medium">+<%=todayExp%></p>
                        </div>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-account-card-details
                        text-warning ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4>등록된 게시글 수</h4>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0"><%=totalPost %> 개</h2>
                          <p class="text-success ml-2 mb-0 font-weight-medium">+<%=todayPost %></p>
                        </div>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-library-books
                        text-info ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4>완료된 주문 수</h4>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0"><%=totalOrderY %> 건</h2>
                          <p class="text-success ml-2 mb-0 font-weight-medium">+<%=todayOrderY%></p>
                        </div>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-basket
                        text-success ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>


            <div class="row">
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">주문현황</h4><br/>
                    <canvas id="doughnutChart" style="height:250px"></canvas>

                    <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                      <div class="text-md-center text-xl-left">
                        <h6 class="mb-1">Current Revenue</h6>
                        <p class="text-muted mb-0"><%=today %></p>
                      </div>
                      <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                        <h6 class="font-weight-bold mb-0">$999</h6>
                      </div>
                    </div>
                  </div>
                </div>
              </div>



              <div class="col-md-8 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-row justify-content-between" style="margin-bottom:20px;">
                      <h4 class="card-title mb-1">등록된 카테고리</h4>
                    </div>
                    <div class="row">
                      <div class="col-12">
                        <div class="preview-list">
               
                <% List<CategoryVO> cVOlist=aDAO.selectAllCategory();
                String categoryName="";
                String categoryImg="";
                
                if(cVOlist!=null){
                	for(int i=0;i<cVOlist.size();i++){
                		
                	categoryName=cVOlist.get(i).getCategoryName();
                	categoryImg=cVOlist.get(i).getCategoryImage();
                		
                %>
                           <div class="preview-item border-bottom">
                            <div class="preview-thumbnail">
								<img src="http://localhost/project_kmong/static/<%=categoryImg%>" />
                            </div>
                            <div class="preview-item-content d-sm-flex flex-grow">
                              <div class="flex-grow">
                                <h6 class="preview-subject"><%= categoryName%></h6>
                              </div>
                            </div>
                          </div>
                <%    		
                	}//end for
                }//end if
                %>                          
                        </div>
					<!--preview-list ends -->
                      </div>
                    </div>
                  </div>
                  <!-- card-body ends -->
                </div>
              </div>
              <!-- stretch-card ends -->
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

    <!-- plugins:js -->
    <script>
    var complete = <%=totalOrderY%>;
    var canceled = <%=totalOrderN%>;
    var pending = <%=totalOrderP%>;
    </script>
    <script src="http://localhost/project_kmong/admin/assets/vendors/chart.js/Chart.min.js"></script>
<!--     <script src="http://localhost/project_kmong/admin/assets/js/off-canvas.js"></script> -->
    <script src="http://localhost/project_kmong/admin/assets/js/chart.js">
    </script>
  </body>
</html>