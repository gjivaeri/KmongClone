<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>Insert title here</title>
<!-- 공통CSS-->
<style type="text/css">

.css-123:hover {
font-weight: bold;
color:#333
}






</style>

<script type="text/javascript">

$(function(){
	
	$("#home-tab").click(function() {
		var height=$(".service_explain").offset();
		$("html, body").animate({scrollTop: height.top}, 10);
	})
	$("#profile-tab").click(function() {
		var height=$(".price_information").offset();
		$("html, body").animate({scrollTop: height.top}, 10);
	})
	
	$("#contact-tab").click(function() {
		var height=$(".user_comment").offset();
		$("html, body").animate({scrollTop: height.top}, 10);
	})
});


</script>

</head>
<body>
<body>
<%@include file="../common/header_member.jsp"%>
<!-- if session에서 로그인 확인되면 header_member.jsp(line replace)-->
<hr/>
<!-- 메인 시작 -->
<div style="width:100%"> <!-- 가장큰 바깥쪽 -->
<div class="maindiv">
<div class="mainleft" style="width:800px">
<section style="margin-bottom: 18px">
<div>
<a href="http://localhost/project_kmong/templates/service/list.jsp" style="color:#333; text-decoration: none" class="css-123">디자인</a>
</div>
</section>

<section>
<div style="height:450px; margin-bottom: 30px">
<img src="http://localhost/project_kmong/static/images/img.PNG"  style="height:100%; width:100% " />
</div>
</section>

<section class="star" style="margin-bottom: 40px">
<div>★★★★★</div>
<div>5.0</div>

</section>
<nav>
<div class="summary" style="display:flex; flex-direction: column;">
<!-- <div style="height:60px;border:1px solid #333" class="summary1">서비스 설명</div>
<div style="height:60px;border:1px solid #333" class="summary2">가격 정보</div> -->
<div style="border-bottom:1px solid #808080">
<ul class="nav nav-tabs" id="myTab" role="tablist" style="width:400px;float:left ;flex-direction: row">
  <li class="nav-item" role="presentation">
  <a href="#target1">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">서비스 설명</button>
  </a>
  </li>
  <li class="nav-item" role="presentation">
  <a href="#target2">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">가격 정보</button>
  </a>
  </li>
  <li class="nav-item" role="presentation">
  <a href="#target3">
    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">서비스 평가</button>
  </a>
  </li>
</ul>
</div>
<br/>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab"> 
  
  <!-- 서비스 설명 -->
<div class="service_explain">
<h3>서비스 설명</h3>
<p>
[기자]

네. 조금 전인 7시쯤 전국 부장검사 대표 회의가 시작됐습니다.

수사 실무 책임자인 전국 검찰청 부장검사 대표들이 자발적으로 한자리에 모인 건 검찰 역사상 처음인데요.

각 검찰청 대표 60여 명 정도가 참석할 것으로 알려졌습니다.

검찰 수사권 폐지의 문제점과 함께 정치적 중립성 확보 방안에 대해서도 폭넓게 논의될 것으로 보입니다.

회의는 오늘 밤 늦게까지 이어질 예정인데 내일 오전 입장문이 발표될 예정입니다.

민주당의 법안 논의 속도에 맞춰 검찰은 바쁘게 움직이고 있습니다.

수도권에서 처음으로 의정부지검장이 기자들을 만나 법안의 문제점을 지적했고, 대검찰청 형사부도 기자간담회를 열어 "인권 보호가 어려워진다"고 강조했습니다.

[김지용/대검 형사부장 : "(검찰의 역할은) 부실 수사로 피해자의 구제가 미흡한 것은 아닌지 등을 밝히고 이를 시정하여 국민의 권익을 보호해 주는 것입니다."]

</p>
</div>
<hr/>
<div class="price_information">
<h3>가격정보</h3>
[기자]

네. 조금 전인 7시쯤 전국 부장검사 대표 회의가 시작됐습니다.

수사 실무 책임자인 전국 검찰청 부장검사 대표들이 자발적으로 한자리에 모인 건 검찰 역사상 처음인데요.

각 검찰청 대표 60여 명 정도가 참석할 것으로 알려졌습니다.

검찰 수사권 폐지의 문제점과 함께 정치적 중립성 확보 방안에 대해서도 폭넓게 논의될 것으로 보입니다.

회의는 오늘 밤 늦게까지 이어질 예정인데 내일 오전 입장문이 발표될 예정입니다.

민주당의 법안 논의 속도에 맞춰 검찰은 바쁘게 움직이고 있습니다.

수도권에서 처음으로 의정부지검장이 기자들을 만나 법안의 문제점을 지적했고, 대검찰청 형사부도 기자간담회를 열어 "인권 보호가 어려워진다"고 강조했습니다.

[김지용/대검 형사부장 : "(검찰의 역할은) 부실 수사로 피해자의 구제가 미흡한 것은 아닌지 등을 밝히고 이를 시정하여 국민의 권익을 보호해 주는 것입니다."]
</div>
<hr/>
<div style="margin-bottom: 20px" class="user_comment">
<h3>
사용자 후기
</h3>
</div>

<div class="comment">
<div>
<div>닉네임</div>
<div class="date">
<div>★★★★★<span>(5.0) </span></div><div style="margin-left: 10px">22.04.10 14:24</div>
</div>
</div>
<div>
<div>
<p>급하게 만들어 달라고 했는데 정말 잘 만드셨어요. 감사합니다!!</p>
</div>
</div>
</div>


<div class="comment">
<div>
<div>닉네임</div>
<div class="date">
<div>★★★★★<span>(5.0) </span></div><div style="margin-left: 10px">22.04.10 14:24</div>
</div>
</div>
<div>
<div>
<p>급하게 만들어 달라고 했는데 정말 잘 만드셨어요. 감사합니다!!</p>
</div>
</div>
</div>

<!-- 댓글작성 -->
<div class="comments">

<div>
<div>닉네임</div>
<div style="display:flex; flex-direction: row">
<div>☆☆☆☆☆</div><div><span>( )</span></div>
</div>
</div>
<div>
<textarea placeholder="댓글을 입력해주세요." style="width:100%"></textarea>
</div>
<div style="width:100px; float:right; margin-top: 5px">
<input type="button" value="등록" style="width:100%" class="btn btn-outline-secondary"/>
</div>
</div>
  
  
  
     </div>
  
</div>
</div>
</nav>
<hr/>





</div><!-- mainleft -->

<div class="mainright" style="width:500px">

<!-- <section class="jjim">
<div></div>
<button type="button" style="background-color: #FFFFFF">
<span>♡ </span><span>찜하기</span>
</button>
</section> -->

<section style="margin-bottom: 30px">
<h3>"고객 만족 우선주의" 48시간 이내, 로고에 명함까지 드립니다.</h3>
<hr/>
<div style="text-align: right"><h3>45,000원</h3></div>
</section>

<section style="margin-bottom: 30px ">
<div style="border:1px solid rgb(228,229,237)">
<div style="margin-bottom: 15px">
<img src="http://localhost/project_kmong/static/images/img.PNG" style="height:300px; width:100%"/>
</div>
<div style="margin-bottom: 15px">
<img src="http://localhost/project_kmong/static/images/img2.PNG"/><span>작업일 : 5일</span>
</div>

<div style="margin:0px auto; width:70% ;margin-bottom: 50px">
<button role="button" color="market" class="css-1b6dcge eklkj754" onclick="location.href='http://localhost/project_kmong/templates/service/purchase_success.jsp'">
<span class="css-1oteowz eklkj753">
<span>구매하기</span></span>
</button>
</div>
</div>
</section>

<section >
<div class="professional" style="border:1px solid rgb(228,229,237)">
<div style="width:140px;height:140px;margin: 0px auto; margin-bottom: 20px" >
<img src="http://localhost/project_kmong/static/images/mykmong.PNG" style="width:100%;height:100%"/>
</div>
<div style="font-size: 25px">
<strong>전문가 닉네임</strong>
</div>
</div>
</section>

</div><!-- mainright -->

</div> <!-- maindiv -->
</div>

<!--  footer-->
<%@include file="../common/footer.jsp" %>


</body>
</html>