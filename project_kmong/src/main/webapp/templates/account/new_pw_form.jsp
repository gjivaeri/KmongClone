<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>

<title>kmong</title>

<script type="text/javascript">
$(function(){
	
});//ready
</script>
</head>

<body>
    <div class="register-step1">
        <div style="text-align: center;">
           <a href="http://localhost/project_kmong/templates/home/index.jsp">
                <div class="logo-div" style="margin-bottom: 30px;"></div>
            </a>
        </div>

        <div class="new-password-box">
            <div class="which-service" style="text-align: center;">
                <h3>새로운 비밀번호 설정</h3>
                
                <div class="new-pass-input">
                    <input type="password" placeholder="새로운 비밀번호 입력" style="margin-top: 20px;"/>  
                    <input type="password" placeholder="새로운 비밀번호 다시 입력" style="margin-bottom: 20px;"/>  
                    <input class="register-btn" type="button" value="확인"/>
                </div>

            </div>
        </div>

    </div>
</body>
</html>