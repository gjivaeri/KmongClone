<%@page import="com.kmong.vo.PostVO"%>
<%@page import="com.kmong.dao.login.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.kmong.vo.InterestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
#mainInput::placeholder {
  color: #FFFFFF;
}
</style>


<SCRIPT type="text/javascript">
   
   $(function(){
	var colorArr=["rgb(5, 68, 78)","rgb(67, 20, 133)","rgb(6, 87, 203)","rgb(229, 125, 99)"];
	var myCarousel = document.getElementById('carouselExampleIndicators')
	
	myCarousel.addEventListener('slide.bs.carousel', function (e) {
	   
	   for(var i=0; i<4 ; i++){
		   if(e.to==i){
			   $(".ad-body").css("background-color",colorArr[i]);
		   }
	   }
	})
		
		$("#searchBtnInAD").click(function() {
			//alert($("#mainInput").val())
			var inputText=$("#mainInput").val();
			location.href="http://localhost/project_kmong/templates/service/search_result.jsp?search_input1="+inputText;
		});

		
	});//ready
</SCRIPT>
</head>
<body>
<div id="wrap">
<%
if(session.getAttribute("login")==null) {
	%><%@include file="../common/header.jsp"%>
<%
}else{
	%><%@include file="../common/header_member.jsp"%>
	
<%
}
%>
    


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
                           
                            
                            <form action="http://localhost/project_kmong/templates/service/search_result.jsp?search_input1=">
                            <div class="typewriter">
                            <input type="text"  id="mainInput" placeholder="웹페이지 제작"
                            style="width:150px; border-top:0px; border-left:0px;border-bottom:0px;">
                            </div>
                              
                               <div class="white-search-btn" id="searchBtnInAD">
                               </div>
                               
                              </form>
                              
                           </div>
                           
                        </div>
                    </form> 
                    <div class="tag-box">
                        <div class="tags"><a style="opacity: unset;" href="http://localhost/project_kmong/templates/service/search_result.jsp?search_input1=웹페이지제작">#웹페이지제작</a></div>
                        <div class="tags"><a href="http://localhost/project_kmong/templates/service/search_result.jsp?search_input1=로고">#로고</a></div>
                        <div class="tags"><a href="http://localhost/project_kmong/templates/service/search_result.jsp?search_input1=인스타">#인스타</a></div>
                        <div class="tags"><a href="http://localhost/project_kmong/templates/service/search_result.jsp?search_input1=일러스트">#일러스트</a></div>
                        <div class="tags"><a href="http://localhost/project_kmong/templates/service/search_result.jsp?search_input1=영상편집">#영상편집</a></div>

                    </div>
                </div>

                <div  style="width: 577px; height: 376px; z-index: 0;">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" >
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
                            <img src="http://localhost/project_kmong/static/images/adImg6.PNG" class="d-block w-100" style="height: 375px;  width: 540px; object-fit: cover;">
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
        </div>

        <!-- ///////////////////// -->
		<%
		if(session.getAttribute("login")==null){ //로그인이 안됐을 때 메인에 보여줄 페이지
			
			%>
			
			<div class="main-category-img">
            <div style="padding-top: 70px;">
                <span style="font-size: 20px; font-weight:bold; color: #303441; font-family: 'Metro Sans',sans-serif;">
                 카테코리에서 원하는 서비스를 찾아보세요!
                </span>
            </div>
            
            <!-- 카테고리 이미지 들어가는 부분-DB작업 들어감. -->
            <div class="main-category-img-collection" style="background-color: rgb(250, 250, 252); border-radius: 20px;">
                <div style=" font-size: 14px; font-weight: bold; height: 20px;">비즈니스</div>
               
               
                <div class="articles">
                
               <!-- 파일명 가져와서 이미지 넣기 수행/ 이미지 리사이징 해야함-->
                <% 
               
                List<CategoryVO> cVOlist=MainPageDAO.getInstance().selectAllCategory();
                String categoryName="";
                String categoryImg="";
                
                if(cVOlist!=null){
                	for(int i=0;i<cVOlist.size();i++){
                		
                		categoryName=cVOlist.get(i).getCategoryName();
                		categoryImg=cVOlist.get(i).getCategoryImage();
                		
                		%>
                		<div class="article-squre">
                        <a href="http://localhost/project_kmong/templates/service/list.jsp?categoryId=<%=cVOlist.get(i).getCategoryId() %>" >
                            <img src="http://localhost/project_kmong/static/<%=categoryImg %>" />
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
			
			<%
			
		}else{
		
			%>
			
        <div class="related-posts">
            <div style="padding-top: 100px;">
                <div style="margin-bottom:50px; font-size: 20px; font-weight:bold; color: #303441; font-family: 'Metro Sans',sans-serif;">
                 관심사가 비슷한 회원들이 본 서비스
                </div>
                <c:catch var="e">
                <div class="service">
                <%
                int member_id=(int)session.getAttribute("login");
                
                List<Integer> categoryList=new ArrayList<Integer>(); //관심사 VO 리스트
                
                //세션으로 받아온 회원의 멤버 아이디 넣고 관심사 카테고리 아이디 얻기
                categoryList=MainPageDAO.getInstance().selectInterests(member_id);
                int num=(int)(Math.random()*categoryList.size());//리스트가 3개라면 123중 랜덤으로 하나를 고름
                
                //고른 수에 해당하는 리스트 방에서 category id를 가져옴
                List<PostVO> postList=new ArrayList<PostVO>();
                postList=MainPageDAO.getInstance().selectPosts(categoryList.get(num));
                
                for(int i=0; i<postList.size() ; i++){
                    	%>
                    	<article class="post-one-by-one">
                    	<a href="http://localhost/project_kmong/templates/service/detail.jsp?id=<%= postList.get(i).getPostId()%>">
                    		<img src="http://localhost/project_kmong/static/PostimgUpload/<%=postList.get(i).getPostImg()%>" style="border-radius: 1px;"/>
                    		<h6 data-testid="title" class="css-10894jy ezeyqpv9" style="font-size: 13px;  margin-top: 8px;">
                    		<%=postList.get(i).getSummary()%>
                    		</h6>
                    		<div style="text-align: right; margin-top: 10px">
                    		<strong><fmt:formatNumber value="<%=postList.get(i).getPrice()%>" pattern="#,###,###"/>원</strong>
                    		</div>
                    		<div class="star-preview">
	                    		<span style="padding-right: 2px">★</span>
	                    		<span style="color:#333; padding-top:5px; font-size: 12px"><%=postList.get(i).getStarAvg()%>&nbsp;&nbsp;2개의 평가</span>
                    		</div>
                    		
                    		</a>
                    	</article>
                    	
                    <% 
                    }
                    %>
                    </div>
				</c:catch>
				<c:if test="${not empty e }">
				오류
				</c:if>
                </div>
                
            </div>
        </div>
		<% }%>

		<!-- ///////////////////// -->

        <div class="main-page-img2" style="margin-top:80px;">
            <div>
                <span style="font-size: 20px; font-weight:bold; color: #303441; 
                		font-family: 'Metro Sans',sans-serif; margin-top:50px;">크몽에서 가장 인기있어요!</span>
            </div>
            <div class="bigger-img">
                
            <%for(int i=0; i<5; i++){
            	%>
            	<div class="images">
                    <a href="#void">
                    <img src="http://localhost/project_kmong/static/images/mainImg<%=i+1%>.PNG" class="imgs"/>
                    </a>
                </div>
            <% 	
            } 
            %>
            </div>
        </div>
        
        
        <div style="display: flex; align-items:center; margin-top:70px; height:300px; background-color: antiquewhite;" >
            <div style="display: flex; margin:0px auto;">
                <div style="display: flex; width: 1168px; height: 175px; grid-gap:15px;">
                    <img src="http://localhost/project_kmong/static/images/will_replace.JPG"/>
                    <img src="http://localhost/project_kmong/static/images/dummy1.png"/>
                    <img src="http://localhost/project_kmong/static/images/dummy2.png"/>
                </div>
            </div>
        </div>
        <div style="display: flex; justify-content:center; align-items:center; width: 100%; margin-top: 90px;margin-bottom: 90px;">
            <img src="http://localhost/project_kmong/static/images/adad.JPG" style="border-radius: 5px;"/>
        </div>
    </div>
    
   <%@include file="../common/footer.jsp"%>
</div>


</body>
</html>