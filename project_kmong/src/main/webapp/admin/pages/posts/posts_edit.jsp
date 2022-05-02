<%@page import="java.util.List"%>
<%@page import="com.kmong.dao.admin.AdminDAO"%>
<%@page import="com.kmong.vo.CategoryVO"%>
<%@page import="com.kmong.vo.admin.AdminPostsVO"%>
<%@page import="com.kmong.dao.admin.AdminPostDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/admin_validate.jsp" %>
<%
if(request.getQueryString()==null){
	response.sendRedirect("http://localhost/project_kmong/admin/pages/posts/posts.jsp");
	return;
}
int postId = Integer.parseInt(request.getParameter("postId"));
AdminPostDAO apDAO = AdminPostDAO.getInstance();
AdminPostsVO apVO = apDAO.selectDetailPost(postId);
pageContext.setAttribute("post", apVO);
pageContext.setAttribute("postNum", postId);
pageContext.setAttribute("categoryName", apVO.getCategoryName());
AdminDAO aDAO = AdminDAO.getInstance();
List<CategoryVO> list = aDAO.selectAllCategory();
pageContext.setAttribute("categoryList", list);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Post edit</title>
  	<c:import url="http://localhost/project_kmong/admin/pages/common/cdn.jsp"/>
  	<style>
	#post-email, #post-date{
	background-color: #2A3038;
    color: #ffffff;
	}
	#cat-sel{
	color:#ffffff;
	}
  	</style>
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- sidebar.jsp (left)-->
      <c:import url="http://localhost/project_kmong/admin/pages/common/sidebar.jsp"/>
		<script>
		$(function(){
		const navActive = document.getElementById("nav-posts");
		const uiShow = document.getElementById("ui-post");
		navActive.classList.add('active');
		uiShow.classList.add('show');
		
		$("#delete-btn").click(function(){
			var warning = confirm("게시글을 삭제하시겠습니까?")
			if(warning){
			$("#delete-frm").submit();
			}
		});
		
		$("#submit-btn").click(function(){
			var fileName = $(".file-upload-default").val();
			let ext=fileName.toLowerCase().substring(fileName.lastIndexOf(".")+1);
			var compareExt = "png,jpg,gif,bmp,".split(",");
			var flag=false;
			
			for(var i = 0 ; i < compareExt.length; i++){
				if(compareExt[i] == ext){
					flag=true;
					break;
				}//end if
			}//end for
			
			if(!flag){
				alert(fileName+"은 업로드 불가능합니다. \n이미지만 업로드 가능합니다");
				return;
			}
			
			var warning = confirm("게시글을 수정하시겠습니까?")
			if(warning){
			$("#post-frm").submit();
			}
		});
		
		 $("#cat-sel option").each(function(){
			if($(this).text()=="${categoryName}"){
				$(this).prop("selected","selected");
			    }
			});
		 
		 $('.file-upload-browse').on('click', function() {
			  var file = $(this).parent().parent().parent().find('.file-upload-default');
			  file.trigger('click');
			});
		 
		$('.file-upload-default').on('change', function() {
			  $(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
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
                    <form method="post" action="posts_edit_pro.jsp" enctype="multipart/form-data" class="form-sample" id="post-frm" >
                      <p class="card-description"> Post No. ${postNum } </p>
                      <input type="text" value="${postNum }" name="postId" style="display:none";/>
                      <!-- 이름, 작성자 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Title</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="${post.title}" name="postTitle">
                            </div>
                          </div>
                        </div>
                        
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Writer</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="${post.email}" readonly="readonly" id="post-email">
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

                              <select class="form-control" name="categoryId" id="cat-sel">
                           	 <c:forEach var="cat" items="${categoryList }">
                                <option value=${cat.categoryId } >${cat.categoryName }</option>
                             </c:forEach>
                              </select>
                              
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Write-Date</label>
                            <div class="col-sm-9">
                              <input class="form-control" placeholder="dd/mm/yyyy" value="${post.postDate}" readonly="readonly" id="post-date">
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
                              <input type="text" class="form-control" value="${post.price}" name="postPrice">
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
                              <input type="file" name="uploadImg" class="file-upload-default">
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
                              <img src="http://localhost/project_kmong/static/PostimgUpload/${post.img}" style="height:200px;" alt="thumbnail"/>
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
                            <textarea class="form-control" id="exampleTextarea1" rows="3" name="postSummary">${post.summary}</textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="exampleTextarea1">Service Information</label>
                            <textarea class="form-control" id="exampleTextarea1" rows="8" name="postDescription">${post.description}</textarea>
                          </div>
                        </div>
                      </div>
					<div id="three-btn" style="display:flex">
                      <button type="button" class="btn btn-outline-primary btn-icon-text" id="submit-btn">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> Submit </button>
                        &emsp;
                      <button type="reset" class="btn btn-outline-warning btn-icon-text" id="reset-btn">
                        <i class="mdi mdi-reload btn-icon-prepend"></i> Reset </button>
                    </form>
                        &emsp;
                        <form id="delete-frm" action="posts_delete_pro.jsp" method="post">
                        <input type="text" name="postId" value=${postNum } style="display:none"/>
                      <button type="button" class="btn btn-outline-danger btn-icon-text" id="delete-btn">
                        <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete</button>
                        </form>
                    </div> <!-- end three-btn -->
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