<%@page import="com.kmong.dao.admin.AdminCategoryDAO"%>
<%@page import="com.kmong.vo.CategoryVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/admin_validate.jsp" %>
<%
if(request.getQueryString() == null){
	response.sendRedirect("http://localhost/project_kmong/admin/pages/categories/categories.jsp");
	return;
}

int categoryId = Integer.parseInt(request.getParameter("id"));
AdminCategoryDAO acDAO = AdminCategoryDAO.getInstance();
CategoryVO cVO = acDAO.selectDetailCategory(categoryId);
pageContext.setAttribute("categoryImage", cVO.getCategoryImage());
pageContext.setAttribute("categoryId", categoryId);
%>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Category Edit</title>
  	<c:import url="http://localhost/project_kmong/admin/pages/common/cdn.jsp"/>
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- sidebar.jsp (left)-->
      <c:import url="http://localhost/project_kmong/admin/pages/common/sidebar.jsp"/>
		<script>
		$(function(){
		const navActive = document.getElementById("nav-category");
		const uiShow = document.getElementById("ui-category");
		var categoryId = "<c:out value='${categoryId}'/>"
		navActive.classList.add('active');
		uiShow.classList.add('show');
		
		$("#delete-category").click(function(){
			var warning = confirm("카테고리를 삭제하시겠습니까?")
			if(warning){
			$("#delete-frm").submit();
			}
		});
		
		$("#edit-category").click(function(){
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
			
			var warning = confirm("카테고리를 수정하시겠습니까?")
			if(warning){
				var form=$("#edit-frm")[0];
				var formData=new FormData(form);
				
				formData.append("fileObj", $("#file-input")[0].files[0]);
				
				   $.ajax({
					   type: "POST",
					   dataType:"json",
				        enctype: 'multipart/form-data',
				        url: "http://localhost/project_kmong/admin/pages/categories/categories_edit_pro.jsp",
				        data: formData,
				        processData: false,
				        contentType: false,
				        cache: false,
				        timeout: 600000,
				        success: function (data) {
				        setTimeout(function() {
				        	location.href="http://localhost/project_kmong/admin/pages/categories/categories_edit.jsp?id="+categoryId;	
				        	},3000);
				        },
				        error: function (e) {
				            console.log("ERROR : ", e);
				        }
			        }); // $.ajax 
			}
		});

			    $('.file-upload-browse').on('click', function() {
			      var file = $(this).parent().parent().parent().find('.file-upload-default');
			      file.trigger('click');
			    });
			    $('.file-upload-default').on('change', function() {
			      $(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
			    });

	});//ready
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
                    <form method="post" action="categories_edit_pro.jsp" enctype="multipart/form-data" class="form-sample" id="edit-frm" >
                      <p class="card-description">Category info </p>
                      <input type="text" value="<%=cVO.getCategoryId() %>" name="categoryId" style="display:none";/>

                      <!-- 이름, 작성자 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Title</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="<%=cVO.getCategoryName()%>" name="name">
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Category Image</label>
                            <div class="col-sm-9">
                              <img src="http://localhost/project_kmong/static/${categoryImage }" alt="thumbnail"  style="width:100px; height:100px;">
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label" >Image Upload</label>
                            <div class="col-sm-9">
                            
                              <input type="file" name="uploadImg" class="file-upload-default" id="file-input">
                              <div class="input-group col-xs-12">
                                <input type="text" class="form-control file-upload-info" placeholder="Upload Image">
                                <span class="input-group-append">
                                  <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                </span>
                              </div>
                              
                            </div>
                          </div>
                        </div>
                      </div>
					
					  <div class="two-btn" style="display:flex;">
                      <button type="button" class="btn btn-outline-secondary btn-icon-text" id="edit-category"> 
                        <i class="mdi mdi-file-check btn-icon-prepend"></i>Edit
                      </button><span>&nbsp;</span>
                    </form>
                    <form action="categories_delete_pro.jsp" method="post" id="delete-frm">
						    <input type="text" value=<%=cVO.getCategoryId()%> name="categoryId" style="display:none">
                           <button type="button" class="btn btn-outline-danger btn-icon-text" id="delete-category">
                            <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete
                            </button>
                    </form>
                    </div> <!-- end two btn -->
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