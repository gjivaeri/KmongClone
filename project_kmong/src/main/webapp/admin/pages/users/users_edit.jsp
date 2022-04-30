<%@page import="java.util.List"%>
<%@page import="com.kmong.dao.admin.AdminMemberDAO"%>
<%@page import="com.kmong.vo.admin.AdminMemberVO"%>
<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
if(request.getQueryString() == null){
	response.sendRedirect("http://localhost/project_kmong/admin/pages/users/users.jsp");
	return;
}
int memberId = Integer.parseInt(request.getParameter("id"));
AdminMemberDAO amDAO = AdminMemberDAO.getInstance();
AdminMemberVO amVO = amDAO.selectMember(memberId, "N");
List<String> interests = amDAO.selectInterests(memberId);
%>
    
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
		$(function(){
		const navActive = document.getElementById("nav-users");
		const uiShow = document.getElementById("ui-user");
		navActive.classList.add('active');
		uiShow.classList.add('show');
			$("#delete-member").click(function(){
				var warning = confirm("계정을 삭제하시겠습니까?")
				if(warning){
				$("#frm").submit();
				}
			});
		});
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
                                <h6 class="preview-subject"><%=amVO.getMemberId() %></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>이메일</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><%=amVO.getEmail() %></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>닉네임</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><%=amVO.getNick() %></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>가입일</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><%=amVO.getJoinDate() %></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>전문분야</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><%=amVO.getCategoryName() %></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>관심사</h4>
                            </div>
                            <div class="preview-item-content">
                                <h5 class="preview-subject">
                              <% 
                              		String interest="";
                              		for(int i = 0 ; i < interests.size() ; i ++) {
                                   		interest = interests.get(i);
                              %>
                              <%=interest %>&ensp;   
                              <%} %>
                                </h5>
                            </div>
                          </div><br/>
						<form action="users_edit_pro.jsp" method="post" id="frm">
						    <input type="text" value="false" name="isExpert" style="display:none">
						    <input type="text" value=<%=amVO.getMemberId() %> name="memberId" style="display:none">
                           <button type="button" class="btn btn-outline-danger btn-icon-text" id="delete-member">
                            <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete
                            </button>
                        </form>
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