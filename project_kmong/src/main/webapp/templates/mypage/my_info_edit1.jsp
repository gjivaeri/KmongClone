<%@page import="com.kmong.vo.MemberVO"%>
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
	 int memberId=(int)session.getAttribute("login");
	 AccountSettingDAO asDAO=new AccountSettingDAO();
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

//app.use('/uploads', express.static('uploads'));
<%if(session.getAttribute("msg")!=null) {%>
	alert("변경이 완료되었습니다.");
<%
	session.removeAttribute("msg"); 
}

if(session.getAttribute("pwConfirmed")!=null){
	if(((String)session.getAttribute("pwConfirmed")).equals("info")){
		%>alert("비밀번호가 확인되었습니다.");
		<%
		session.setAttribute("pwConfirmed","done");
		session.setAttribute("confirmed", "info");
		}else if(!(((String)session.getAttribute("pwConfirmed")).equals("done"))
				||!(((String)session.getAttribute("confirmed")).equals("info"))){
			response.sendRedirect("http://localhost/project_kmong/templates/mypage/verification.jsp?service=info");
		
		}else if(!(((String)session.getAttribute("pwConfirmed")).equals("done"))
				&&(!((String)session.getAttribute("confirmed")).equals("info"))){
			response.sendRedirect("http://localhost/project_kmong/templates/mypage/verification.jsp?service=info");
		}
}else{
		response.sendRedirect("http://localhost/project_kmong/templates/mypage/verification.jsp?service=info");
}
%>


$(function() {
	
//$(document).ready(function(){
    $('.multi_select').selectpicker();
//})

	$("#infobtn").click(function() {
		
		$("#myfrm").submit();
	});//click

	$("#file-input").change(function(){
		
		var form=$("#profileFrm")[0];
		var formData=new FormData(form);
		
		formData.append("fileObj", $("#file-input")[0].files[0]);

		
		   $.ajax({
			   type: "POST",
			   dataType:"json",
		        enctype: 'multipart/form-data',
		        url: "http://localhost/project_kmong/templates/mypage/profile_process.jsp",
		        data: formData,
		        processData: false,
		        contentType: false,
		        cache: false,
		        timeout: 600000,
		        success: function (data) {
		        setTimeout(function() {
		        	location.href="http://localhost/project_kmong/templates/mypage/my_info_edit.jsp";	
		        	},3000);
		       // location.href="http://localhost/project_kmong/templates/mypage/my_info_edit.jsp";	
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		        }
	        }); // $.ajax 
	})

	/* $("#proImg").error( function () {
		alert("Asdfds");
	    $(this).attr("src", "default_profile.png");
	    location.href="http://localhost/project_kmong/templates/mypage/my_info_edit.jsp";	
	}); */
});//ready


function refresh(){
	//this.src = "default_profile.png";
	//$("#proImg").attr("src", "default_profile.png");  
	setTimeout(function() {
	location.href="http://localhost/project_kmong/templates/mypage/my_info_edit.jsp";	
	},2000);
	//location.href="http://localhost/project_kmong/templates/mypage/my_info_edit.jsp";	
}


</script>
</head>
<body >
 <%@include file="../common/header_member.jsp"%>
		<hr>
			<!-- main div -->
			<div id="aside-div">
				<aside class="aside">
					<div id="d">
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
						<section id="main-section1">
							<section id="main-section2">
								<div id="div-img">
								<%if(fileName==null){
									%><img src="http://localhost/project_kmong/static/upload/default_profile.png"
								alt="프로필 사진1" id="profile-img" style="object-fit: cover;" id="proImg1"/><%
								}else{

								%>		<img src="http://localhost/project_kmong/static/upload/<%=fileName%>"
								alt="" id="profile-img" style="object-fit: cover;" id="proImg" onerror="this.src='default_profile.png'; refresh()"/> <%
								}%>
										
					
						
								</div>
								<div style="margin-top: 10px;">
								
							
                          <form id="profileFrm" name="profileFrm" enctype="multipart/form-data" method="post"> 
									<button type="button" color="default" class="profile-btn" id="btnProfile">
										<span><label style="cursor: pointer;"" id="profileLabel" for="file-input">프로필 변경
										 <input  name="upFile" id="file-input" type="file" accept="image/gif, image/jpeg, image/jpg, image/png" style="display:none"> 
										</label>
										</span>
									</button>
							</form>
								</div>
							</section>
							<%
							
					List<MemberVO> list5=asDAO.selectinformation(memberId);
						pageContext.setAttribute("infor", list5);
							
							%>
							<section id="main-section2">
							<c:forEach var="info" items="${infor}">
								<div class="section2-div">
									<label for="username" class="section2-label">
									<span class="section2-span">이름
									</span>
									</label>
									<div class="input-textDiv" >
									<input type="text" placeholder="<c:out value="${info.name }"/>" maxlength="17" class="input-text" readonly="readonly"/>
									</div>
								</div>
								<div class="section2-div">
									<label for="username" class="section2-label">
									<span class="section2-span">전화번호
									</span>
									</label>
									<div class="input-textDiv" >
									<input type="text" placeholder="<c:out value="${info.tel }"/>" maxlength="17" class="input-text" readonly="readonly"/>
									</div>
								</div>
								<div class="section2-div">
									<label for="username" class="section2-label">
									<span class="section2-span">닉네임
									</span>
									</label>
									<div class="input-textDiv" >
									<input type="text" placeholder="<c:out value="${info.nick }"/>" maxlength="17" class="input-text" readonly="readonly"/>
									</div>
								</div>
								<div class="section2-div">
									<label for="username" class="section2-label">
									<span class="section2-span">이메일
									</span>
									</label>
									<div class="input-textDiv" >
									<input type="text" placeholder="<c:out value="${info.email }"/>" maxlength="17" class="input-text" readonly="readonly"/>
									</div>
								</div>
								</c:forEach>
								
						<form action="check_my_info_edit.jsp" id="myfrm" name="frm" method="get" >
								<div class="section2-div">
										<label for="username" class="section2-label">
											<span class="section2-span">비즈니스분야</span>
										</label>
								<div class="input-textDiv" >
								<select id="buCategoryId" name="buCategoryId" style="width: 500px;  height: 40px; border: 0px; font-size: 16px;">
<%
MenuDAO mnDAO=new MenuDAO();   
List<CategoryVO> list1=mnDAO.selectAllCategory();
pageContext.setAttribute("categoryList", list1);

int cateId=asDAO.selectCategoryid(memberId);
pageContext.setAttribute("cateId", cateId);

for(CategoryVO list : list1) {
	%>
	<option  value="<%=list.getCategoryId()%>"  <%if(list.getCategoryId() == cateId) { %>selected="selected" <%}%>> <%= list.getCategoryName() %></option> <% 
}
%>

										<%-- <c:forEach var="categorylist"  items="${categoryList }">   <!-- 왜 값 비교가 완될까....  <c:if test="${categorylist.categoryId}== <%= cateId %>   "> selected="selected"</c:if>>-->
											<option  value="${categorylist.categoryId } " <c:if test="${categorylist.categoryId eq  cateId}    "> selected="selected"</c:if>> <c:out value="${categorylist.categoryName}"/></option>
								<!-- 			<option value="design">디자인</option>
											<option value="media">영상/사진/음향</option>
											<option value="marketing">마케팅</option>
											<option value="translate">변역/통역</option> -->
											</c:forEach> --%>
										</select>
									</div>
								</div>
								
								
								<%
								
					    	
					    	
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
					            
					             
								</c:forEach>
					   		</select>
					    	</div>
					</form>
					    
					</section>
				</section>
							<button  id="infobtn" type="button" data-testid="submit-button" class="submit-btn" style="float: right; margin-top: 10px">
							<span>확인</span>
							</button>
					</div>
				</main>
			</div>
		</div>
		
	</div>

<%@include file="../common/footer.jsp"%>
</body>
</html>