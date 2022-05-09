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
</script>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
	})
});//ready
</script>
</head>
<body onload="noBack();" 
   onpageshow="if (event.persisted) noBack();" onunload="">
<%
if((String)session.getAttribute("id")==null){
	response.sendRedirect("http://211.63.89.132/templates/account/finding_info.jsp");
}
%>
    <div class="register-step1">
        <div style="text-align: center;">
            <a href="http://211.63.89.132/templates/home/index.jsp">
                <div class="logo-div" style="margin-bottom: 30px;"></div>
            </a>
        </div>

        <div class="regis-result-box">
            <div class="which-service" style="text-align: center;">
                <h4>회원님의 아이디는 <span style="text-decoration: underline; font-size: 20px;"><%=(String)session.getAttribute("id") %></span><!-- 아이디 받아오기 -->입니다.<h4>
                <div>
                    <form id="frm" action="http://211.63.89.132/templates/home/index.jsp">
               		<input type="hidden" name="hid" value="login"/>
                    <input type="button" value="로그인" class="id-box-btns" id="btn"/>
                    <input type="button" value="비밀번호 찾기" 
                        onclick="location.href='http://211.63.89.132/templates/account/finding_info.jsp'"
                        class="id-box-btns" 
                        style="margin-left: 18px;"/>
             	</form>
                </div>
            </div>
        </div>

    </div>
<%session.removeAttribute("id"); %>
</body>
</html>