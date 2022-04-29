<%@page import="com.kmong.vo.InterestVO"%>
<%@page import="com.kmong.dao.account.AccountSettingDAO"%>
<%@page import="com.kmong.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@page import="com.kmong.dao.account.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 <%
    session.setAttribute("insertFileFlag", false);
    %>
	
<!DOCTYPE html>
<html>
<head>
    <link rel='stylesheet' type='text/css' media='screen' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.1/css/bootstrap.min.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css'>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js'></script>
<%@include file="../common/cdn.jsp"%>
<title>Insert title here</title>

<style type="text/css">
.multi_select_box{
	width:100%;
	margin-top: 8px;
	margin-bottom: 30px;
	height:50px
}

.multi_select_box select{
    width:100%;
}

.multi_select_box button{
   background-color: #FFFFFF !important;
   color: #333 !important;
   border-color: #c7c6c6;
   padding-left: 20px;
   padding-top:13px;
   padding-bottom:13px;
}

.select-box button{
   background-color: #FFFFFF !important;
   color: #333 !important;
   border-color: #c7c6c6;
   padding-left: 20px;
   padding-top:13px;
   padding-bottom:13px;
   margin-bottom: 20px;
}
</style>
<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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

<!-- select Picker -->	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/
	twitter-bootstrap/4.6.1/js/bootstrap.bundle.min.js"> 
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/
	bootstrap-select/1.13.18/js/bootstrap-select.min.js"> 
</script>	
<script type="text/javascript">
$(function() {
//$(document).ready(function(){
    $('.multi_select').selectpicker();
//})

$("#infobtn").click(function() {
	
	
	$("#frm").submit();
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
					<link rel="stylesheet" type="text/css" href="http://localhost/project_kmong/templates/mypage/my_info_edit.jsp"/>
					
					<hr orientation="horizontal" style="height: 2px;">
					<a href="my_info_edit.jsp" class="aside-a">나의 정보</a> 
					<a href="pw_edit.jsp" class="aside-a">비밀번호 변경</a> 
					<a href="withdrawing.jsp" class="aside-a">회원탈퇴</a>
				</aside>
				<main style="margin-left: 24px;">
					<div>
						<h1 style="font-size: 18px; font-weight: bold;">나의 정보</h1>
						<form action="check_my_info_edit.jsp" id="frm" name="frm" method="post" enctype="multipart/form-data">
						<section id="main-section1">
							<section id="main-section2">
								<div id="div-img">
									<img src="https://kmong.com/img/tools/main_user_gray.png"
										alt="프로필 사진" id="profile-img" />
								</div>
								<div style="margin-top: 10px;">
									<button type="button" color="default" class="profile-btn" id="profileBtn">
										<span><label for="file-input" style="cursor: pointer;">프로필 변경
										<input  name="upFile" id="file-input" type="file" accept="image/gif, image/jpeg, image/jpg, image/png" style="display:none">
										</label>
										</span>
									</button>
								</div>
							</section>
							<section id="main-section2">
								<div class="section2-div">
									<label for="username" class="section2-label">
									<span class="section2-span">이름
									</span>
									</label>
									<div class="input-textDiv" disabled="">
									<input type="text" placeholder="이름" maxlength="17" class="input-text">
									</div>
								</div>
								<div class="section2-div">
									<label for="username" class="section2-label">
									<span class="section2-span">전화번호
									</span>
									</label>
									<div class="input-textDiv" disabled="">
									<input type="text" placeholder="전화번호" maxlength="17" class="input-text">
									</div>
								</div>
								<div class="section2-div">
									<label for="username" class="section2-label">
									<span class="section2-span">닉네임
									</span>
									</label>
									<div class="input-textDiv" disabled="">
									<input type="text" placeholder="닉네임" maxlength="17" class="input-text">
									</div>
								</div>
								<div class="section2-div">
									<label for="username" class="section2-label">
									<span class="section2-span">이메일
									</span>
									</label>
									<div class="input-textDiv" disabled="">
									<input type="text" placeholder="이메일" maxlength="17" class="input-text">
									</div>
								</div>
								
								
								<div class="section2-div">
									<label for="username" class="section2-label">
									<span class="section2-span">비즈니스분야
									</span>
									</label>
									<div class="input-textDiv" disabled="">
										<select name="buCategoryId" style="width: 500px;  height: 40px; border: 0px; font-size: 16px;">
<%
MenuDAO mnDAO=new MenuDAO();   
List<CategoryVO> list1=mnDAO.selectAllCategory();
pageContext.setAttribute("categoryList", list1);
%>
										<c:forEach var="categorylist"  items="${categoryList }">
											<option  value="${categorylist.categoryId }"><c:out value="${categorylist.categoryName}"/></option>
								<!-- 			<option value="design">디자인</option>
											<option value="media">영상/사진/음향</option>
											<option value="marketing">마케팅</option>
											<option value="translate">변역/통역</option> -->
											</c:forEach>
										</select>
									</div>
								</div>
								
								
								<%
					    	
					    	 int memberId=(int)session.getAttribute("login");
					    	AccountSettingDAO asDAO=new AccountSettingDAO();
					    	List<InterestVO> list3=asDAO.findinterest(memberId);
					    	pageContext.setAttribute("interest", list3);
					    	%>
							<div class="multi_select_box">
                        		<label for="username" class="section2-label">
                       			<span class="section2-span">관심사
		                        </span>	
		                        </label>
        					<select class="multi_select w-100"  name="interestcategory"
						        mutiple data-max-options="3" data-max-options-text="3개까지 선택 가능합니다." 
						        multiple title="관심사 3가지를 선택하세요.">
						        <c:forEach var="categorylist1" items="${categoryList }">
					            <option value="${categorylist1.categoryId }" <c:forEach var="inter" items="${ interest}"><c:if test="${inter.categoryId eq categorylist1.categoryId }"> selected="selected"</c:if></c:forEach>><c:out value="${categorylist1.categoryName }"/></option>
					            
					             
						<!-- 		<option value="media">영상/사진/음향</option>
								<option value="marketing">마케팅</option>
								<option value="translate">변역/통역</option>
								<option value="writing">문서/글쓰기</option>
								<option value="business">비즈니스컨설팅</option>
								<option value="twojob">투잡/노하우</option>
								<option value="luck">운세</option>
								<option value="capacity">직무역량</option>
								<option value="order">주문제작</option>
								<option value="hobby">취미</option>
								<option value="lifeservice">생활서비스</option>
								<option value="psychological">심리상담</option>
								<option value="VOD">VOD</option> -->
								</c:forEach>
					   		</select>
					    	</div>
					    
					    	
							
							</section>
						</section>
							<button  id="infobtn" type="button" data-testid="submit-button" class="submit-btn" style="float: right; margin-top: 10px">
							<span>확인</span>
							</button>
					</form>
					</div>
				</main>
			</div>
		</div>
		
	</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>