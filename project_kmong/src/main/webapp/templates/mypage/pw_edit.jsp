<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>Insert title here</title>
<style type="text/css">

</style>

<!-- bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<script type="text/javascript">
<%
if(session.getAttribute("pwConfirmed")!=null){
	if(((String)session.getAttribute("pwConfirmed")).equals("pass")){
		%>
		alert("비밀번호가 확인되었습니다.");
		<%
		session.setAttribute("pwConfirmed","done");
		session.setAttribute("confirmed", "pass");
		}else if(!(((String)session.getAttribute("pwConfirmed")).equals("done"))
				||!(((String)session.getAttribute("confirmed")).equals("pass"))){
			response.sendRedirect("http://localhost/project_kmong/templates/mypage/verification.jsp?service=pass");
		
		}else if(!(((String)session.getAttribute("pwConfirmed")).equals("done"))
				&&(!((String)session.getAttribute("confirmed")).equals("pass"))){
			response.sendRedirect("http://localhost/project_kmong/templates/mypage/verification.jsp?service=pass");
		}
		
}else{
		response.sendRedirect("http://localhost/project_kmong/templates/mypage/verification.jsp?service=pass");
}%>
	
	
	
	$(function() {
		$("#updatechkbtn").click(function() {
			var pass1=$("#pass1").val();
			var pass2=$("#pass2").val();
			
		if(pass1 ==""){
			alert("새로운 비밀번호를 입력해주세요");
			$("#pass1").focus();
			return;
		}//end if
		if(pass2 ==""){
			alert("한번더 입력해주세요");
			$("#pass2").focus();
	return;
		}//end if
		if(pass1 != pass2) {
			alert("비밀번호가 서로 일치하지 않습니다.");
			$("#pass2").focus();
			return;
		}
		  	$("#pwfrm").submit();  
		  	

		})//click

	});//ready
</script>
</head>
<body>
 <%@include file="../common/header_member.jsp"%>
		<hr>
			<!-- main div -->
			<div id="aside-div">
				<aside class="aside">
					<div>
						<strong>계정설정</strong>
					</div>
					<hr orientation="horizontal" style="height: 2px;">
					<a href="my_info_edit.jsp" class="aside-a">나의 정보</a> 
					<a href="pw_edit.jsp" class="aside-a">비밀번호 변경</a> 
					<a href="withdrawing.jsp" class="aside-a">회원탈퇴</a>
				</aside>
				<main style="margin-left: 24px;">
					<div>
						<h1 style="font-size: 18px; font-weight: bold;">비밀번호 변경</h1>


						
						<form action="check_pw_edit.jsp" method="post"  id="pwfrm" name="ffrm">

						<div id="update-pass-frm">
						<!-- <section>
						<div><label class="aside-a">현재 비밀번호</label></div>
						<div class="input-textDiv"><input type="password" placeholder="기존 비밀번호를 입력해주세요." name="currentPassword" class="input-text" value=""></div>
						</section> -->
						<section>
						<div class="passwd-chk-div">
							<label class="aside-a"><span>변경할 비밀번호</span></label>
							<label class="aside-a"><span>한번 더 입력</span></label>
						</div>
						<div class="passwd-chk-div">
							<div class="input-textDiv">
								<input type="password" class="input-text" placeholder="변경할 비밀번호를 입력해주세요." name="updatePassword" value="" id="pass1">
							</div>
							<div class="input-textDiv">
								<input type="password" class="input-text" placeholder="변경할 비밀번호를 한번 더 입력해주세요." name="updatePasswordchk"  value="" id="pass2">
							</div>
						</div>
						</section>
						<div style="margin-top: 20px; display: flex;">
							<div style="flex-grow:1;"><span></span></div>
							<button type="button" type="button"  class="submit-btn" id="updatechkbtn">
							<span>변경하기</span>
							</button>
						</div>
						</div>
						</form>
						
						<!-- data-testid="submit-button"   data-bs-toggle="modal"   data-bs-target="#passChk"     -->
						
						<!-- Modal -->
						<div class="modal fade" id="passChk" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body" style="text-align: center;">
						       비밀번호가 일치하지 않습니다.
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100%">확인</button>
						    </div>
						    </div>
						  </div>
						</div>
						
					</div>
				</main>
			</div>
		</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
