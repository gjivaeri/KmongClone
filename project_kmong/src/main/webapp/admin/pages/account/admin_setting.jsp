<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/admin_validate.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Admin Setting</title>
  	<c:import url="http://211.63.89.132/admin/pages/common/cdn.jsp"/>
  	<style>
  		#warning{height:10px; color:red; padding-top:5px;}
  	</style>
  </head>
  <script>
  $(function(){
	  $("#ad_setting").click(function(){
		  adSetting();
	  });//submit
	  
	  $("form").find('[name=confpass]').on("keyup", function(key){
		  if(key.keyCode==13){
		  adSetting();
		  }
	  });
	  
	  function adSetting(){
		var curpass = $("form").find('[name=curpass]').val();
		var newpass = $("form").find('[name=newpass]').val();
		var confpass = $("form").find('[name=confpass]').val();
		
	  	$.ajax({
	  		url:"admin_setting_pro.jsp",
	  		data:{"curpass":curpass, "newpass":newpass, "confpass":confpass},
	  		dataType:"json",
	  		error:function(xhr){
	  			alert(xhr.status+"/"+xhr.statusText);
	  		},
	  		success:function(jsonObj){
	  			if(jsonObj.setFlag == true){
 	  				location.href="http://211.63.89.132/admin/admin_index.jsp";
	  				return; 
	  			}
	  			$("#warning").html(jsonObj.msg);
	  		},		  
	  	});//ajax
	  };//adSetting
	  
	  
	  
  });//ready
  </script>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="row w-100 m-0">
          <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
            <div class="card col-lg-4 mx-auto">
              <div class="card-body px-5 py-5">
                <h3 class="card-title text-left mb-3">Admin Settings</h3>
                <form>
                  <div class="form-group">
                    <label>Current Password</label>
                    <input type="password" class="form-control p_input" name="curpass">
                  </div>
                  <div class="form-group">
                    <label>New Password</label>
                    <input type="password" class="form-control p_input" name="newpass">
                  </div>
                  <div class="form-group">
                    <label>Confirm Password</label>
                    <input type="password" class="form-control p_input" name="confpass">
                    <div id="warning"></div>
                  </div>
                  <div class="text-center">
					<input type="button" class="btn btn-primary btn-block enter-btn" value="Submit" style="height:40px; margin-top:35px;" id="ad_setting"/>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
        </div>
        <!-- row ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
  </body>
</html>