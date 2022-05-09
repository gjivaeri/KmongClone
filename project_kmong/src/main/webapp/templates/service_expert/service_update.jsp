<%@page import="java.util.List"%>
<%@page import="com.kmong.dao.MyServiceDAO"%>
<%@page import="com.kmong.vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%session.setAttribute("updateImgFlag", false); %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>kmong</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script type="text/javascript">
$(function() {
	
	$("#serviceUpdate").change(function() {
		   readURL(this);
		});
	
	  $('#summernote').summernote({
		width: 800,	  
		height: 200,
		toolbar: [
			['style',['bold', 'italic', 'underline']]
		]
	  });
	  
	  $("#lengthNum1").keyup(function(evt){
		  var inputTxt = $(this).val().length
		  $("#output1").html("("+inputTxt+" / 30)");
		  
		  if(!(inputTxt <= 30)){
			  return;
		  }
	  })
	  $("#lengthNum2").keyup(function(evt){
		  var inputTxt = $(this).val().length
		  $("#output2").html("("+inputTxt+" / 20)");
		  
		  if(!(inputTxt <= 20)){
			  return;
		  }
	  })
	  $("#explain-ta").keyup(function(evt){
		  var inputTxt = $(this).val().length
		  $("#output3").html("("+inputTxt+" / 60)");
		  
		  if(!(inputTxt <= 60)){
			  return;
		  }
	  })
});//ready


function readURL(input) {
	   if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function(e) {
	         $('#serviceImg2').attr('src', e.target.result);
	      }
	      reader.readAsDataURL(input.files[0]);
	   }
	}
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
                        
                        <img src="http://211.63.89.132/static/images/profile.JPG" class="profile" style="width: 40px; height: 40px; object-fit: cover; border-radius: 50px; transition: border 0.2s ease 0s;"/>
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
         
			<div id="aside-div" style="flex-direction: row">
				<aside class="aside">
					<a href="#void" class="a-order">
					<span class="span-order">1</span>
					<h2 class="span-h2">기본정보</h2></a>
					<a href="#void" class="a-order">
					<span class="span-order">2</span> 
					<h2 class="span-h2">가격설정</h2></a>
					<a href="#void" class="a-order">
					<span class="span-order">3</span>
					<h2 class="span-h2">서비스 설명</h2></a>
					<a href="#void" class="a-order">
					<span class="span-order">4</span>
					<h2 class="span-h2">이미지</h2></a>
					<a href="#void" class="a-order">
					<span class="span-order">5</span>
					<h2 class="span-h2">요청사항</h2></a>
				</aside>
			<%
			System.out.println("post==id : "+request.getParameter("postId2"));
			int postId = Integer.parseInt(request.getParameter("postId2"));
			
			MyServiceDAO msDAO = MyServiceDAO.getInstance();
			List<PostVO> list = msDAO.selectUpdateMyServiceList(postId);
			//System.out.println(list);
			
			pageContext.setAttribute("list", list);
			%>	
         	<form action="service_update_proc.jsp" method="post" enctype="multipart/form-data">
         	<c:forEach items="${list}" var="items"> 
			<div class="main-div" style="flex-direction: column;">
			 <div style="margin-bottom: 5px;">
			 <div style="float: right;">
              <button role="button" type="submit" class="submitBtn" style=" width: 90px; height: 50px; font-size: 18px; background-color: #00CC99; color: #FFFFFF; border: #00946F; margin-right: 5px">
               <span><strong>수정하기</strong></span>
               </button>
               <input type="hidden" value="${items.postId }" name="postId"/>
               <!-- <button role="button" type="submit" class="submitBtn" style="width: 90px; height: 50px; font-size: 18px; background-color: #e4e5ed; color: #727585; border: #e4e5ed">
               <span>등록하기</span>
               </button> -->
			 </div>
         	</div>
         		<div style="flex-direction: row">
				<div class="main-div">		
					<span class="main-span">
					<span class="span-name">제목</span>
					</span> 
					<div class="div-element">
					<input value="${items.title }" maxlength="30" type="text" autocomplete="off" class="input-element" id="lengthNum1" name="title"/> 
					<span id="output1"></span>
					</div>
				</div>
				<div class="main-div">
					<span class="main-span">
					<span class="span-name">카테고리</span>
					<div style="display: flex; background-color: #fafafc; padding: 4px 8px 4px 16px; align-items: center; flex-direction: row; border-radius: 4px;">
					<label style="font-size: 18px; min-width: 120px; color: #303441;">상위카테고리</label></div>
					<div>
					<select id="category" name="categoryId" style="width: 500px; height: 40px; border: 0px; font-size: 16px;">
											<option selected="selected" value="${items.categoryId }">${items.categoryId }</option>
											<option value="1">디자인</option>
											<option value="2">IT프로그래밍</option>
											<option value="3">영상·사진·음향</option>
											<option value="4">마케팅</option>
											<option value="5">번역·통역</option>
										</select>
					</div>
					</span> 
				</div>
				<!-- <div style="flex-direction: row"> -->
					<!-- <div class="main-div">
						<span class="main-span">
						<span class="span-name">제목</span>
						</span> 
					<div class="div-element">
						<input placeholder="기업웹사이트" maxlength="30" type="text" autocomplete="off" class="input-element" id="lengthNum2" name="title"/> 
						<span id="output2"></span>
					</div> 
					</div> -->
				<div class="main-div">
					<span class="main-span">
					<span class="span-name">설명</span>
					</span> 
					<div class="div-element">
					<textarea placeholder="- 메인페이지 시안 1개 제공 &#13;&#10;- 공지사항,FAQ페이지 &#13;&#10;- SNS로그인 연동" maxlength="60" autocomplete="off" id="explain-ta" name="summary"/>${items.summary}</textarea>
					<span id="output3"></span>
					</div> 
					</div>
				<div class="main-div">
					<span class="main-span">
					<span class="span-name">금액(VAT포함)</span>
					</span> 
					<div class="div-element">
					<input value="${items.price }" maxlength="30" type="text" autocomplete="off" class="input-element" name="price"/> 
					<span>원</span>
					</div> 
					</div>
				<div class="main-div">
					<span class="main-span">
					<span class="span-name">작업기간</span>
					</span> 
					<div class="div-element">
					<select id="term" name="term" style="width: 500px; height: 40px; border: 0px; font-size: 16px;">
											<option value="${items.term }" selected="selected">${items.term }</option>
											<%for(int i=1; i<31;i++){ %>
											<option value="<%= i %>"><%= i+"일" %></option>
											<%} %>
										</select>
					</div> 
					</div>
				<div class="main-div">
					<span class="main-span">
					<span class="span-name">서비스 설명</span>
					</span> 
					<div class="div-element" >
					<textarea id="summernote" style="overflow: auto" name="description"/>
					${items.description }
					</textarea>
					</div> 
					</div>	
						
				</div>			
				<!-- <span class="main-span"> -->
					<span class="span-name" style="flex-direction: column;">메인 이미지 등록(필수)
					<!-- </span> --> 
					
					<input type=file name='file1' style='display: none;' id='serviceUpdate'> 
					<div name='file2' id='file2' style="border: 1px solid #CCCCCC; width: 300px; margin-top: 10px">
					<!-- <input type='text' name='file2' id='file2' class="input-text"> --> 
					<img src="http://211.63.89.132/static/PostimgUpload/${items.postImg }" border='0' style="width: 176px; height: 128px; cursor: pointer; object-fit:cover" id="serviceImg2"
					onclick='document.all.file1.click(); document.all.file2.value=document.all.file1.value'/> 
					</div>

					</span>
				
					<div class="img-guide">
						<span>TIP</span>
						<div style="margin-left: 10px;"><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/pages/my-kmong/gig-form/main_image_example.png" width="auto" height="auto" alt="가이드이미지"></div>
						<div style="margin-left: 10px;">
							<div><span>• </span> 
								<span>이미지 권장 사이즈: 652 x 488px (4:3 비율)</span></div>
							<div><span>• </span> <span><b>사용 제한 이미지</b><br>
								&nbsp;&nbsp;&nbsp;저작권 침해 (무단복제, 도용) 이미지<br>
								&nbsp;&nbsp;&nbsp;프로필 사진과 동일한 이미지<br>
								&nbsp;&nbsp;&nbsp;가격, 연락처, 서비스와 관련 없는 홍보성 문구<br>
								&nbsp;&nbsp;&nbsp;임의로 제작된 인증 마크, 라벨, 할인표기<br>
								&nbsp;&nbsp;&nbsp;검증 불가 내용 (최초, 유일, 무제한, 1위, 누적의뢰 수/금액 표기 등)<br><br>
								※ 등록하신 이미지는 이용약관에 의거, 판매 활성화를 위한 광고 소재로 활용될 수 있습니다.</span></div>
							<div>
								<a referrerpolicy="no-referrer" href="https://support.kmong.com/hc/ko/articles/360029331931" target="_blank">
								이미지 가이드라인 (자세히보기 &gt;)</a></div>
						</div>
					</div>
					
					</div>
					</c:forEach>
					</form>
				</div>	
		</div>
		
<%@include file="../common/footer.jsp"%>
</body>
</html>