<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>Insert title here</title>

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
$(function() {
	
				
			$("#passbtn").click(function() {
				var pass=$("#chkpass").val();
				
				if(pass == "") {
					alert("비밀번호를 입력해주세요.");
					$("#chkpass").focus();
					return;
				}//end if
				
				
				$("#vefrm").submit();
			});//click
				
			
		
	//	})//ajax
		
		
	//})//click
	
	

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
				<a href="http://localhost/project_kmong/templates/mypage/my_info_edit.jsp" class="aside-a">나의 정보</a> 
					<a href="http://localhost/project_kmong/templates/mypage/pw_edit.jsp" class="aside-a">비밀번호 변경</a> 
					<a href="http://localhost/project_kmong/templates/mypage/withdrawing.jsp" class="aside-a">회원탈퇴</a>
			</aside>
				<main style="margin-left: 24px;">
					<div>
						<h1 style="font-size: 18px; font-weight: bold;">나의 정보</h1>


						

						<form action="check_verifcation.jsp"  id="vefrm"  method="get">
						<section id="main-section1">
						<div style="margin: 100px;">
							<label style="margin-bottom: 10px;">비밀번호</label>
							<input type="password" id="chkpass" class="input-text" placeholder="비밀번호입력" name="pass" style="border: 1px solid #CCCCCC;"/>
						</div>
						</section>
						<div style="margin-top: 20px; display: flex;">
							<div style="flex-grow:1;"></div>
							<button type="button" type="button" class="submit-btn" id="passbtn">
							<span>확인</span>
							</button>
						</div>
				</form>
				
				<!-- data-testid="submit-button"   data-bs-toggle="modal"    data-bs-target="#checkModal" -->
						
						<!-- Modal -->
						<div class="modal fade" id="checkModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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