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

        <div class="regis-result-box">
            <div class="which-service" style="text-align: center;">
                <h4>회원님의 아이디는 _____<!-- 아이디 받아오기 -->입니다.<h4>
                
                <div>
                    <input type="button" value="로그인" class="id-box-btns" onclick="location.href='index.jsp'"/>
                    <input type="button" value="비밀번호 찾기" 
                        onclick="location.href='findingInfo.jsp'"
                        class="id-box-btns" 
                        style="margin-left: 18px;"/>
                </div>
            </div>
        </div>

    </div>
</body>
</html>