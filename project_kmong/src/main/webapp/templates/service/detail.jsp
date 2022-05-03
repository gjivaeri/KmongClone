<%@page import="com.kmong.vo.CommentsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kmong.dao.CommentsDAO"%>
<%@page import="java.util.Map"%>
<%@page import="com.kmong.vo.PostVO"%>
<%@page import="java.util.List"%>
<%@page import="com.kmong.dao.PostDAO"%>
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

/* 별점구현 */
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
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
	
	$("#reviewBtn").click(function() {
		
		var starFlag = false;
		for (var i = 0; i < 5; i++) {	
	  		if($("[name='reviewStar']")[i].checked == true) {
	  			starFlag = true;
				break;
			}  		
		}
		
		if (!starFlag) {
			alert("별점을 선택해주세요");
			return;
		}
		
		if($("#reviewContents").val() == "") {
			alert("후기를 남겨주세요");
			return;
		}
		
		if (starFlag) {
			$("#myform").submit();
		}
	})
});


</script>

</head>
<body>

<%-- <% session.setAttribute("login",5); %> --%>
<% 

if(request.getParameter("id") == null) {
	response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp");
	return;
}
int postId = Integer.parseInt(request.getParameter("id"));


CommentsDAO c = CommentsDAO.getInstance();
double savg = c.selectAvgStar(postId);
pageContext.setAttribute("savg", savg);
if (session.getAttribute("login") != null) {
	int sid = (Integer)session.getAttribute("login");
	String loginNick = c.selectNickByMemberId(sid);
	boolean isWriteComment = c.isWriteComment(sid, postId);
	//double savg = c.selectAvgStar(postId);
	//String starAvg = String.format("%.1f", savg);
	pageContext.setAttribute("loginNick", loginNick);
	pageContext.setAttribute("isWriteComment", isWriteComment);
	//pageContext.setAttribute("starAvg", starAvg);
	//pageContext.setAttribute("savg", savg);
}


%>
<%
if(session.getAttribute("login") == null) {
   %>
<%@include file="../common/header.jsp"%>
<%
} else{
   %><%@include file="../common/header_member.jsp"%>
   <% }
%>
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
<%
System.out.println("selectPostId : "+postId);
PostDAO pDAO = PostDAO.getInstance();
                   
List<Map<String, String>> list = pDAO.selectPost(postId);//사용자가 선택하는 게시물의 정보 조회
System.out.println(list);
%>
<section>
<div style="height:450px; margin-bottom: 30px">
<%if(list.get(0).get("post_img") != null){ %>
<img src="http://localhost/project_kmong/static/PostimgUpload/<%= list.get(0).get("post_img") %>"  style="height:100%; width:100% " />
<%}else{ %>
<img src="http://localhost/project_kmong/static/PostimgUpload/pattern.png"  style="height:100%; width:100% " />
<%} %>
</div>
</section>

<section class="star" style="margin-bottom: 40px">
	<c:forEach begin="1" end="5" step="1" var="var">
	<span style="color: ${var<=savg?'#fad103':'#f0f0f0'}">★</span>
	</c:forEach>
<div></div>
<div><%= String.format("%.1f", savg) %></div>

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
<%= list.get(0).get("description") %>

</p>
</div>
<hr/>
<div class="price_information">
<h3>가격정보</h3>
<%= list.get(0).get("price") %>원
</div>
<hr/>
<div style="margin-bottom: 20px" class="user_comment">
<h3>
사용자 후기
</h3>
</div>
<%
	
	ArrayList<CommentsVO> cList =  (ArrayList)c.selectCommentsAll(postId);
	
	pageContext.setAttribute("cList", cList);
%>
<!-- comments -->
<c:forEach items="${ cList }" var="item">
<div class="comment">
<div>
<div><span style="font-weight: bold;">${item.nick }</span>
<span style="font-size: small;">${item.inputDate }</span>
</div>

<div class="date">
<div>	
	<c:forEach begin="1" end="5" step="1" var="var">
	<span style="color: ${var<=item.star?'#fad103':'#f0f0f0'}">★</span>
	</c:forEach>
</div>
</div>
</div>
<div>
<div>
<p>${item.review }</p>
</div>
</div>
</div>
</c:forEach>
<!-- comments -->


<!-- 댓글작성 -->
<c:if test="${isWriteComment }">
<div>
<div class="comments">
<form class="mb-3" name="myform" id="myform" method="post" action="review_process.jsp">
<div>${loginNick }</div>
	<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="reviewStar" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="reviewStar" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
	<div>
		<textarea class="col-auto form-control" type="text" id="reviewContents" name="reviewText" placeholder="후기를 남겨주세요."></textarea>
	</div>
<div style="width:100px; float:right; margin-top: 5px">

<input type="button" value="등록" style="width:100%" class="btn btn-outline-secondary" id="reviewBtn"/>
</div>
<input type="hidden" value="<%= postId %>" name="postId" />

</form>			
</div>
<!-- 댓글작성 -->
</div>
</c:if>
</div>
  
</div>
</div>
</nav>
<hr/>

</div><!-- mainleft -->

<div class="mainright" style="width:500px">

<section style="margin-bottom: 30px">
<h3>"고객 만족 우선주의" 48시간 이내, 로고에 명함까지 드립니다.</h3>
<hr/>
<div style="text-align: right"><h3><%= list.get(0).get("price") %>원</h3></div>
</section>

<section style="margin-bottom: 30px ">
<div style="border:1px solid rgb(228,229,237)">
<div style="margin-bottom: 15px">
<%if(list.get(0).get("post_img") != null){ %>
<img src="http://localhost/project_kmong/static/PostimgUpload/<%= list.get(0).get("post_img") %>" style="height:300px; width:100%"/>
<%}else{ %>
<img src="http://localhost/project_kmong/static/PostimgUpload/pattern.png" style="height:300px; width:100%" />
<%} %>
</div>
<div style="margin-bottom: 15px">
<img src="http://localhost/project_kmong/static/PostimgUpload/img21.png"/><span><%= list.get(0).get("term") %>일</span>
</div>
<form action="purchase_success.jsp" method="post">
<input type="hidden" name="postId2" value=<%= list.get(0).get("post_id") %>>
<div style="margin:0px auto; width:70% ;margin-bottom: 50px">
<button role="button" type="submit" color="market" class="css-1b6dcge eklkj754" onclick="location.href='http://localhost/project_kmong/templates/service/purchase_success.jsp'">
<span class="css-1oteowz eklkj753">
<span><strong>구매하기</strong></span>
</span>
</button>
</div>
</form>
</div>
</section>

<section >
<div class="professional" style="border:1px solid rgb(228,229,237)">
<div style="width:140px;height:140px;margin: 0px auto; margin-bottom: 20px" >
<%
if(list.get(0).get("user_img") != null){
%>
<img src="http://localhost/project_kmong/static/upload/<%=list.get(0).get("user_img") %>" style="width:100%;height:100%"/>
<%}else{ %>
<img src="http://localhost/project_kmong/static/upload/default_profile.png" style="width:100%;height:100%"/>
<%} %>
</div>
<div style="font-size: 25px">
<strong><%= list.get(0).get("nick") %></strong>
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