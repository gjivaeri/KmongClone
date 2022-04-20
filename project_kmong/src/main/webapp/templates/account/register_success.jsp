<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<style type="text/css">

#login-btn-after-register{
	color: rgb(74, 74, 74); 
	margin-top: 40px; 
	font-size: 18px;
}

body{
		padding-top:0px; 
		}
</style>


<script type="text/javascript">
$(function(){
   
   $("#login-btn-after-register").click(function(){
      $("#frm").submit();
   });//click
   
})
</script>

</head>

<body>
    <div class="register-step1">
        <div style="text-align: center;">
            <a href="http://localhost/project_kmong/templates/home/index.jsp">
                <div class="logo-div" style="margin-bottom: 30px;"></div>
            </a>
        </div>

        <div class="regis-result-box">
            <div class="which-service" style="text-align: center;">
                <h1>회원가입이 완료되었습니다.</h1>
                
                <div>

				<form id="frm" action="http://localhost/project_kmong/templates/home/index.jsp">
                    <input   class="login-button" id="login-btn-after-register" type="button" value="로그인 하기" 
                    
                   			onmouseover="$('#login-btn-after-register').css('background-color','rgb(240, 192, 79)')" 
							onmouseout="$('#login-btn-after-register').css('background-color','#f3d75b')" />
					<input type="hidden" name="hid" value="login"/>
				</form>
                </div>
            </div>
        </div>

    </div>
</body>
</html>