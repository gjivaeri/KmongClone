<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>Insert title here</title>
<style type="text/css">


a{vertical-align: middle; text-decoration: none; color:#333}

#notice{width:200px;height:700px;float:left}

.li{margin-top: 30px}


.mainbox{width:1400px;margin:0px auto;} 
.mainbox2{display:flex; flex-direction:row}




/* footer */
.footer{width:1400px; display:flex; flex-direction: row;margin: 0px auto; justify-content: space-between;}



</style>
</head>

<body>
<%

if(session.getAttribute("login") == null) {
   %>
<%@include file="../common/header.jsp"%>
<%
} else{
   %><%@include file="../common/header_member.jsp"%>
   <% }
%>

<hr/>
<!-- main -->
<div class="mainbox"> 
<div style="margin-top:10px">
<h5>* 공지사항</h5>
</div>

<div style="width:100%" class="mainbox2" >
<!-- 왼쪽 -->
<div style="margin-right: 80px">
<div style="margin-top:30px">
<ul style="list-style: none">
<li style="color:#808080"><h6>이 섹션의 문서</h6></li>
</ul>
</div>
<div>
<ul>
	<li><h5>고객센터 운영 시간</h5></li>
</ul>
</div>
</div>
<!--오른쪽-->
<div>
<article  id="main2">
<h1 id="h1"><strong>고객센터 운영 시간 안내</strong></h1>
<img src="http://211.63.89.132/static/images/notice.PNG"/><br/>
<p id="p">
<span>안녕하세요, 크몽입니다</span><br/>
<br/>
<span>크몽을 이용해 주시는 회원님들께 감사드리며,</span><br/>
<span>2022년, 내부 일정에 따라 고객센터 운영시간을 아래와 같이 조정합니다.</span><br/>
<br/>
<span>회원님의 너그러운 양해를 부탁드리며, 서비스 이용에 참고해 주시기 바랍니다.</span><br/>
</p>
<h3 style="margin-top: 70px">
<span style="background-color:#FFC266">
<strong>&nbsp;</strong>
</span>
<span ><strong>고객센터 운영시간</strong></span>
</h3>
<span style="font-size: large;">■ 평일 10:30 ~ 18:00</span>
<span>&nbsp;(점심시간 13:00 ~ 14:00)</span>
<h3 style="margin-top: 70px">
<span style="background-color:#FFC266">
<strong>&nbsp;</strong>
</span>
<span ><strong>고객센터 미운영시간</strong></span>
</h3>
<span style="font-size: large;">■ 4월 1일(금) 14:00 ~ 15:00</span><br/>
<span style="font-size: large;">■ 4월 6일(수) 10:30 ~ 12:00</span><br/>
<span style="font-size: large;">■ 4월 13일(수) 14:00 ~ 15:00</span><br/>
<span style="font-size: large;">■ 4월 27일(수) 14:00 ~ 15:00</span><br/>
<h3 style="margin-top: 70px">
<span style="background-color:#FFC266">
<strong>&nbsp;</strong>
</span>
<span ><strong>고객센터 이용 안내</strong></span>
</h3>
<p>미 운영시간 내 문의사항은 02-****-****로 전화 주시면 답변해드리겠습니다.</p>
<p>&nbsp;</p>
<p>봄기운이 완연한 4월 입니다.</p>
<p>따뜻한 날씨처럼 포근하고 소소한 행복이 느껴지는 한 달이 되시기를 바랍니다.</p><br/>
<p>크몽이 회원님의 비즈니스를 항상 응원하겠습니다.</p>

</article>
</div> <!-- 오른쪽 -->


</div>




</div><!-- main -->






<!--  footer-->
<%@include file="../common/footer.jsp" %>

</body>
</html>