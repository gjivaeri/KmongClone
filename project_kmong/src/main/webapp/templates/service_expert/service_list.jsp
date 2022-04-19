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

</script>
</head>
<body>
 <%@include file="../common/header_member.jsp"%>
		<hr>
			<div style="border: 1px solid #333; height: 90px; text-align: center;">
				광고이미지
			</div>
			<div id="aside-div">
				<aside class="aside">
					<div>
						<div style="margin-top: 60px">
						<div class="side-menu-wrapper">
						<div id="side-menu-wrapper">
							<img src="https://kmong.com/img/tools/default_profile@2x.png" title="컬러풀블루1395" class="profile-image img-responsive" style="width: 150px;">
						</div>
						<div id="nickname-div"><span style="text-align: center; font-size: 18px; font-weight: bold">닉네임</span></div>
						<div class="side-menu-title-wrapper" style="margin-top: 50px; font-weight: bold;">마이계약</div>
						<div class="menu-list-wrapper"></div>
						</div>
						</div>
					</div>
					<hr orientation="horizontal" style="height: 2px;">
					<div>
					<select class="input-textDiv" style="cursor: pointer; font-size: 16px;">
						<option value="ordersMng" selected disabled hidden>계약관리</option>
						<option value="ordersReq">계약 요청 승인</option>
						<option value="ordersCancel">완료된 계약</option>
						<option value="ordersList">철회된 계약</option>
						<option value="myService">나의 서비스</option>
					</select>
					</div>
				</aside>
				<main style="margin-left: 24px; margin-top: 30px; width: 100%">
			
					<h1 style="font-size: 18px; font-weight: bold;">나의 서비스</h1>
					<div id="main-section1" style="padding: 20px;  height: 60%; flex-direction: column; position: relative;"> 
						<div class="dropdown">
                           <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_more.svg" alt="더보기 아이콘" style="cursor: pointer; float: right;"/>
                            <div class="dropdown-content" style="position: absolute;">
						        <a href="#" style="font-size: 15px; text-align: center;">서비스 편집</a>
						        <a href="#" style="font-size: 15px; text-align: center;">서비스 삭제</a>
						    </div>
						</div>
						<div>
							<img src="https://kmong.com/img/tools/default_profile@2x.png" style="width: 100px; height: 100px; margin: 10px"/>
							<span>제목제목제목</span>
						</div>
						<div style="position: absolute; bottom: 10px; text-align: right;">등록 날짜</div>
					</div>
					<div style="position: relative; height: 30%; border: 2px dotted #e4e5ed; margin-top: 20px" >
						<button role="button" id="regi-btn"><a href="http://localhost/project_kmong/templates/service_expert/service_write.jsp" style="text-decoration: none; color: #747474; font-weight: bold;"><h1>+</h1>서비스등록하기</a>						
						</button>
					</div>
					</main>
   				</div>
			</div>
		
<%@include file="../common/footer.jsp"%>
</body>
</html>
