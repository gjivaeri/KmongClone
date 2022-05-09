<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% session.invalidate();%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Admin Login</title>
  	<c:import url="http://211.63.89.132/admin/pages/common/cdn.jsp"/>
  	<style>
  		#warning{height:10px; color:red; padding-top:5px;}
  	</style>
  </head>
  <script>
	var loginFlag=false;
   	$(function(){ 
  		$("#login").click(function(){
			loginPro();
  		});//login
  		
  		$("form").find('[name=admPw]').on("keyup", function(key){
  			if(key.keyCode==13){
  				loginPro();
  			}
  		});
  		
  		function loginPro(){
  			var id = $("form").find('[name=admId]').val();
  			var pass = $("form").find('[name=admPw]').val();
	   		$.ajax({
	   			url:"admin_login_pro.jsp",
	   			data:{"id":id, "pass":pass},
	   			type:"get",
	   			dataType:"json",
	   			error:function(xhr){
	   				alert(xhr.status+"/"+xhr.statusText);
	   			},
	   			success:function(jsonObj){
	   				loginFlag=jsonObj.loginFlag;
	   				loginChk(loginFlag);
	   			}
  			});//ajax */
  		}
  		
   		function loginChk(loginFlag){
 			if(loginFlag){
  				location.href="http://211.63.89.132/admin/admin_index.jsp";
  				return
  			} 
  			$("#warning").html("아이디 혹은 비밀번호를 잘못 입력하셨습니다.")		
  		} 
  		
   	});//ready 
  </script>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="row w-100 m-0">
          <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
            <div class="card col-lg-4 mx-auto">
              <div class="card-body px-5 py-5">
                <h3 class="card-title text-left mb-3">Admin Login</h3>
                <form id="frm">
                  <div class="form-group">
                    <label>Username or email *</label>
                    <input type="text" class="form-control p_input" name="admId">
                  </div>
                  <div class="form-group">
                    <label>Password *</label>
                    <input type="password" class="form-control p_input" name="admPw">
                    <div id="warning"></div>
                  </div>
                  <div class="text-center">
                    <input type="button" class="btn btn-primary btn-block enter-btn" id="login" value="Login" style="height:40px; margin-top:35px;"/>
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