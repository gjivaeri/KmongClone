<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>kmong</title>
<style type="text/css">
.serviceBtn:hover{
	background-color: #ffffd9;
	border-color:#f5d670;
}
.serviceBtn2:hover{
	background-color: #ffffd9;
	border-color:#f5d670;
}

.btn-subDiv{
margin-top:10px; 
margin-left: 15px;
}

body{
padding-top:0px; 
}


</style>

<script type="text/javascript">
$(function(){
	$(".serviceBtn").mouseover(function(){
		$("#check_1").css("color","#333");
	})
	$(".serviceBtn").mouseout(function(){
		$("#check_1").css("color","#EAEAEA");
	})
	
	$(".serviceBtn2").mouseover(function(){
		$("#check_2").css("color","#333");
	})
	$(".serviceBtn2").mouseout(function(){
		$("#check_2").css("color","#EAEAEA");
	})
});//ready
</script>
</head>

<body>
    <div class="register-step1">
        <div style="text-align: center;">
            <a href="http://localhost/project_kmong/templates/home/index.jsp">
                <!-- <img src="img.png" style="padding-top: 20px; padding-bottom: 20px;"/> -->
                <div class="logo-div" style="margin-bottom: 30px;"></div>
            </a>
        </div>

        <div class="register-box1">
            <div class="which-service">
                <h1>크몽에서 어떤 서비스를<h1>
                <h1>이용하고 싶으세요?</h1>
                <p>
                원하는 회원가입 유형을 선택하세요.
                </p>
                <label>서비스를 의뢰하고 싶다면</label>
                <div>
                    <button class="serviceBtn" onclick="location.href='http://localhost/project_kmong/templates/account/register_form.jsp?flag=client'">
                        <div class="btn-subDiv"><div id="check_1" style="color:#EAEAEA; font-size:18px; font-weight: bold;">✓</div></div>
                        <span>외뢰인으로 가입 </span>
                    </button>
                </div>
                
                <label>내 전문성을 판매하고 싶다면</label>
                <div>
                    <button class="serviceBtn2" onclick="location.href='http://localhost/project_kmong/templates/account/register_form.jsp?flag=expert'">
                        <div class="btn-subDiv"><div id="check_2"  style="color:#EAEAEA;font-size:18px; font-weight: bold;">✓</div></div>
                        <span>전문가로 가입 </span>
                    </button>
                </div>
            </div>
        </div>

    </div>
</body>
</html>