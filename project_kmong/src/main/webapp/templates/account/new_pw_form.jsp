<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>

<title>kmong</title>
<style type="text/css">
body{
	padding-top:0px; 
}
</style>
<script type="text/javascript">
window.history.forward();
function noBack() { window.history.forward(); }

$(function(){

		$("#btn").click(function(){
			handleSubmit();
		});//click
		
	    
});//ready

	function handleSubmit(){
	
	let reg_pw2 = /(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{8,}/; // 문자와 특수문자 조합의 6~24 자리
	var pattern=/\s/g;
	var pass1=$("#pass1").val();
	var pass2=$("#pass2").val();
	
	if(pass1==""||pass2==""){//-------------비밀번호 유효성 검사--------------
	    	alert("새로운 비밀번호를 입력해주세요.");
	    	return;
	    }else if(pass1.match(pattern)||pass2.match(pattern)){
	    	alert("올바른 비밀번호를 입력해주세요.");
	    	return;
	    }else if(!reg_pw2.test(pass1)){
	    	alert("문자와 특수문자를 조합하여 8자 이상의 비밀번호를 입력해주세요.");
	    	return;
	    }else if(pass1!=pass2){
	    	alert("새 비밀번호를 확인해주세요.");
	    	return;
	    }

		$("#frm").submit();
	}//handleSubmit
	
</script>
</head>
<%
if((String)session.getAttribute("setPass")==null){
	response.sendRedirect("http://localhost/project_kmong/templates/account/finding_info.jsp");
}else{
	session.removeAttribute("setPass");
}
%> 
<body onload="noBack();" 
   onpageshow="if (event.persisted) noBack();" onunload="">
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
                <form action="http://localhost/project_kmong/templates/account/new_pw_action.jsp" id="frm">
                    <input type="password" placeholder="문자와 특수문자를 조합하여 8자 이상" style="margin-top: 20px;" name="pass1" id="pass1"/>  
                    <input type="password" placeholder="새로운 비밀번호 확인" style="margin-bottom: 20px;" name="pass2" id="pass2"/>  
                    <input class="register-btn" type="button" value="확인" id="btn"/>
                </form>
                </div>

            </div>
        </div>

    </div>
</body>
</html>