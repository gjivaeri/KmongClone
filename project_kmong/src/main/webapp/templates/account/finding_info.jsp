<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>

<title>kmong</title>
<!--공통 CSS-->

</head>
<body>
    <div class="register-step1">
        <div style="text-align: center;">
            <a href="http://localhost/project_kmong/templates/home/index.jsp">
                <div class="logo-div" style="margin-bottom: 30px;"></div>
            </a>
        </div>

        <div class="register-box1">
            <div class="finding-input" style="text-align: center;">
               
                <div class="finding-input-text">아이디 찾기</div>
                <input type="text" placeholder="이름" />  
               <input type="text" placeholder="휴대폰 번호" />  
               <div class="finding-btn">
               <input type="button" value="아이디 찾기" onclick="location.href='http://localhost/project_kmong/templates/account/finding_success.jsp'" style="display: block;"/>
               </div>
                <div style="height: 30px;"></div>
               <div class="finding-input-text" >비밀번호 찾기</div> 
               <input type="text" placeholder="이름"/>  
               <input type="text" placeholder="휴대폰 번호" />  
               <input type="text" placeholder="이메일" />  
                
                <div class="finding-btn">
                    <input type="button" value="비밀번호 찾기" onclick="location.href='http://localhost/project_kmong/templates/account/new_pw_form.jsp'"
                style="display: block; color: #edeaea; background-color: rgb(150, 150, 150);" />
                    </div>
            </div>
        </div>

    </div>
</body>
</html>