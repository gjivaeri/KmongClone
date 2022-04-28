<%@page import="com.kmong.vo.CategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>kmong</title>

<style type="text/css">
 img{
    image-rendering: auto;
    image-rendering: crisp-edges;
    image-rendering: pi;
}



</style>

<SCRIPT type="text/javascript">
   window.history.forward();
   function noBack() { window.history.forward(); }
</SCRIPT>


<%-- <script type="text/javascript">
 <%
 
 if((String)session.getAttribute("join")!=null){ //회원가입 과정을 거치고 정상적으로 완료됐을 시 세션 삭제
	 session.removeAttribute("join");
} 
 if((String)session.getAttribute("setPass")!=null){
	 %>alert("비밀번호가 성공적으로 변경되었습니다.");<%
	 session.removeAttribute("setPass");
} 
%>
	
	
$(function(){
	$(".login-btn").click(function(){
	$("#modal").css("display","flex")
})

$("#closeBtn").click(function(){
	$("#modal").css("display","none")
})
$("#bg").click(function(){
	$("#modal").css("display","none")
})
});//

</script> --%>
</head>

<body onload="noBack();" 
   onpageshow="if (event.persisted) noBack();" onunload="">
<div id="wrap">
<%@include file="../common/header.jsp"%>



    <div class="body-container">
        <div class="ad-body">
          
            <div class="ad-div">
                <div class="ad-box1">
                    <span>
                        <h1 class="ad-text">프리랜서 마켓 No.1 크몽에서<br/>원하는 전문가를 찾아보세요!</h1>
                    </span>

                   <form class="ad-box1-form">
                       <div class="ad-search2">
                           <div class="ad-search">
                           
                            <form>
                            <div class="typewriter"><input type="text" value="웹페이지 제작" id="mainInput"
                            style="width:150px; border-top:0px; border-left:0px;border-bottom:0px;">
                            </div>
<!--                             <div class="typewriter"><h5>웹페이지 제작</h5></div> -->
                            <!-- <div class="typewriter">
                                <h1>The cat and the hat.</h1>
                              </div> -->
                              
                               <div class="white-search-btn">
                               </div>
                               
                              </form>
                           </div>
                           
                        </div>
                    </form> 
                    <div class="tag-box">
                        <div class="tags"><a style="opacity: unset;" href="#void">#웹페이지제작</a></div>
                        <div class="tags"><a href="#void">#로고</a></div>
                        <div class="tags"><a href="#void">#인스타</a></div>
                        <div class="tags"><a href="#void">#일러스트</a></div>
                        <div class="tags"><a href="#void">#영상편집</a></div>

                    </div>
                </div>

<!-- //////////////////////////////////////-->

            





<!--////////////////////////////////////-->

                  <!-- style="width: 577px; height: 376px; border: 1px solid #333;"> -->
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                        </div>
                        
                         <div class="carousel-inner" style="height: 375px; border-radius: 8px;">
                         <div class="carousel-item active">
                            <img src="http://localhost/project_kmong/static/images/adImg1.PNG" class="d-block w-100" style="height: 375px;  width: 540px; object-fit: cover;">
                          </div>
                          <div class="carousel-item">
                            <img src="http://localhost/project_kmong/static/images/adImg2.PNG" class="d-block w-100" style="height: 375px;  width: 540px; object-fit: cover;">
                          </div>
                          <div class="carousel-item">
                            <img src="http://localhost/project_kmong/static/images/adImg3.PNG" class="d-block w-100" style="height: 375px;  width: 540px; object-fit: cover;">
                          </div>
                          <div class="carousel-item">
                            <img src="http://localhost/project_kmong/static/images/adImg4.PNG" class="d-block w-100" style="height: 375px;  width: 540px; object-fit: cover;">
                          </div> 
                        </div>
                        
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                          <span class="carousel-control-next-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Next</span>
                        </button>
                      
                      
                </div>
            </div>
        </div>



        <div class="main-category-img">
            <div style="padding-top: 70px;">
                <span style="font-size: 20px; font-weight:bold; color: #303441; font-family: 'Metro Sans',sans-serif;">
                 카테코리에서 원하는 서비스를 찾아보세요!
                </span>
            </div>
            
            <!-- 카테고리 이미지 들어가는 부분-DB작업 들어감. -->
            <div class="main-category-img-collection">
                <div style=" font-size: 14px; font-weight: bold; height: 20px;">비즈니스</div>
               
               
                <div class="articles">
                
               <!-- 파일명 가져와서 이미지 넣기 수행/ 이미지 리사이징 해야함-->
                <% 
               
                List<CategoryVO> cVOlist=mpDAO.selectAllCategory();
                String categoryName="";
                String categoryImg="";
                
                if(cVOlist!=null){
                	for(int i=0;i<cVOlist.size();i++){
                		
                		categoryName=cVOlist.get(i).getCategoryName();
                		categoryImg=cVOlist.get(i).getCategoryImage();
                		
                		%>
                		<div class="article-squre">
                        <a href="#void" >
                            <img src="http://localhost/project_kmong/static/images/test.JPG" />
                            <div class="main-span1"><%= categoryName%></div>
                        </a>
                        </div>
                		<%
                		
                	}//end for
                }//end if
                %>
                  
                </div>
            
            </div>
        </div>
        
        <!-- 더미 -->
        <div class="main-page-img2">
            <div>
                <span style="font-size: 20px; font-weight:bold; color: #303441; font-family: 'Metro Sans',sans-serif;">크몽에서 가장 인기있어요!</span>
            </div>
            <div class="bigger-img">
            
            <%for(int i=0; i<5; i++){
            	%>
            	<div class="images">
                    <a href="#void">
                    <img src="http://localhost/project_kmong/static/images/logo.JPG" class="imgs"/>
                    </a>
                </div>
            <% 	
            } 
            %>
            
            </div>
        </div>
        
        <!-- 빠른 커뮤니케이션 더미 부분 -->
        <div style="display: flex; align-items:center; margin-top:70px; height:300px; background-color: antiquewhite;" >
            <div style="display: flex; margin:0px auto;">
                <div style="display: flex; width: 1168px; height: 175px; grid-gap:15px;">
                	<%for(int i=0; i<3; i++){
                		%>
                		<img src="http://localhost/project_kmong/static/images/will_replace.JPG"/>
                		
                		<%
                	}
                	%>
                	
                    
                </div>
            </div>
        </div>
        <div style="width: 1200px; padding-top: 100px; margin: 0px auto;">
            <img src="http://localhost/project_kmong/static/images/adad.JPG" style="border-radius: 5px;"/>
        </div>
    </div>
    
    
	<%@include file="../common/footer.jsp"%>
        

</div>

<!-- <script type="text/javascript">
if(${param.hid eq 'login'}){
document.getElementById("modal").style.display='flex';
}//end if
</script> -->
</body>
</html>