<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>Insert title here</title>
<!-- datePicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style type="text/css">
#datepicker, #datepicker2{
	width: 130px; 
	height: 35px; 
	color: #747474; 
	border: 1px solid #CCCCCC;
}
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
<!-- datePicker -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	$( function() {
		$( "#datepicker" ).datepicker();
	} );
	 $( function() {
		$( "#datepicker2" ).datepicker();
	} );
});//ready
</script>
</head>
<body>
	<!-- 전체 페이지 묶기 -->
	<div id="wrap">
		<div class="header"><!-- header div -->
			<div class="header1">
            <a href="index.jsp"><div class="logo-div"></div></a>
            
                <div style="flex-grow: 1;"></div>
                
                    <!-- ////////////////////// -->
               <div style="width: 250px;" class="buttons"> 
                    <input type="button" value="로그아웃"class="login-btn" >
                    <div style="width: 270px; margin-right: 20px;">
                        <input type="button" value="마이계약" class="my-contract-btn" style="margin-left: 10px;" >
                    </div>
                        
                    <div class="dropdown" style="width: 40px; border-radius: 50px;" >
                        <div style="height: 40px; width:40px; margin-left:0px;border-radius: 50px;">
                        
                        <img src="http://localhost/project_kmong/static/images/profile.JPG" class="profile" style="width: 40px; height: 40px; object-fit: cover; border-radius: 50px; transition: border 0.2s ease 0s;"/>
                        </div>
                        
                        <div class="dropdown-content" style="width: 150px;  line-height: 22px;">
                        
                        <span style="font-size: 11px; padding-left: 10px; ">계정 설정</span>
                       <!-- 카테고리 메뉴 DB에서 불러오기 -->
                        <a href="my_info_edit.jsp">나의 정보</a>
                        <a href="pw_edit.jsp" style="font-size: 13px;">비밀번호 변경</a>
                        <a href="withdrawing.jsp" style="font-size: 13px;">회원 탈퇴</a>
                        </div>
                    </div>
                </div>
               </div>
        </div>
		<hr>
			<div id="aside-div">
				<aside class="aside">
					<div>
						<div style="margin-top: 60p">
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
						<option value="ordersReq">계약 요청</option>
						<option value="ordersCancel">계약 철회</option>
						<option value="ordersList">계약 리스트(현황)</option>
					</select>
					</div>
				</aside>
				<main style="margin-left: 24px; margin-top: 30px;">
				<div>
					<h1 style="font-size: 18px; font-weight: bold;">취소한 계약</h1>
					<div>
					<input type="text" id="datepicker" value="mm-dd-yyyy"> - <input type="text" id="datepicker2" value="mm-dd-yyyy" >   <input type="text" class="input-text" placeholder="상품을 검색하세요."  style="border: 1px solid #CCCCCC">
					</div>
					<div id="main-section1" style="height: 500px;">
					<div style="flex-direction: row;">
					<img src="https://kmong.com/img/tools/default_profile@2x.png" style="width: 100px; height: 100px; margin: 10px"/><br/>
					</div>
					</div>
				</div>
				</main>
			</div>
				
				<div id="orders-guide">
				<h5>
				<strong>✓ 꼭 확인해주세요!</strong></h5>
				<ul>
				<li>• 세금계산서는 거래 주체인 전문가가 의뢰인에게 발행합니다.</li>
				<li>• 세금계산서는 사업자 인증 받은 기업전문가에게 요청하실 수 있습니다.</li>
				<li>• 이벤트 쿠폰 사용 금액은 할인된 금액이기 때문에 세금계산서에 포함되지 않습니다.</li>
				<li>• 거래명세서는 결제가 완료되었음을 증명하는 용도로만 활용 가능하며 세무상의 지출증빙 효력이 없습니다.</li>
				<li>• 현금영수증은 개인의 소득공제용으로만 사용 가능하며, 결제 당시 지출 증빙용으로 선택하셨더라도 매입세액공제를 받으실 수 없습니다.</li>
				</ul>
				</div>
			</div>	
			
<%@include file="../common/footer.jsp"%>
</body>
</html>
