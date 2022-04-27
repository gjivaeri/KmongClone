<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>

<title>kmong</title>
<!--공통 CSS-->
<style type="text/css">
body{
	padding-top:0px; 
}
</style>
<script type="text/javascript">
<%
if((String)session.getAttribute("find")!=null){
	%>alert("회원정보를 찾을 수 없습니다. 다시 시도해주세요.");<%
	session.removeAttribute("find");
}
if((String)session.getAttribute("newPass")!=null){
	%>alert("비밀번호 변경을 실패하였습니다.");<%
	session.removeAttribute("newPass");
}
%>
$(function(){
	
	$("#idBtn").click(function(){
		handleSubmit();
	});//click
	
	$("#passBtn").click(function(){
		handleSubmit2();
	});//click
	
});//ready

function handleSubmit(){
	if($("#name").val()==""){
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return;
	}else if($("#tel").val()==""){
		alert("휴대폰 번호를 입력해주세요.");
		$("#tel").focus();
		return;
	}else{
		$("#frmId").submit();
	}
}//handleSubmit

function handleSubmit2(){
	if($("#name2").val()==""){
		alert("이름을 입력해주세요.");
		$("#name2").focus();
		return;
	}else if($("#tel2").val()==""){
		alert("휴대폰 번호를 입력해주세요.");
		$("#tel").focus();
		return;
	}else if($("#email").val()==""){
		alert("이메일을 입력해주세요.");
		$("#email").focus();
		return;
	}else{
		$("#frmPass").submit();
	}
}//handleSubmit2
</script>
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
                <form action="http://localhost/project_kmong/templates/account/finding_id_action.jsp" id="frmId">
	                <input type="text" placeholder="이름" name="name" id="name"/>  
	               <input type="text" placeholder="휴대폰 번호" name="tel" id="tel"/>  
	               <div class="finding-btn">
	               	<input type="button" value="아이디 찾기" id="idBtn" style="display: block;"/>
	               </div>
               </form>
                <div style="height: 30px;"></div>
               <div class="finding-input-text" >비밀번호 찾기</div> 
               <form action="http://localhost/project_kmong/templates/account/finding_pass_action.jsp" id="frmPass">
	               <input type="text" placeholder="이름" name="name2" id="name2"/>  
	               <input type="text" placeholder="휴대폰 번호"  name="tel2" id="tel2"/>  
	               <input type="text" placeholder="이메일"  name="email" id="email"/>  
                </form>
                <div class="finding-btn">
                    <input type="button" value="비밀번호 찾기" id="passBtn"
                style="display: block; color: #edeaea; background-color: rgb(150, 150, 150);" />
                    </div>
            </div>
        </div>

    </div>
</body>
</html>