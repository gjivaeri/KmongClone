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

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<!-- css 파일 -->
<link rel="stylesheet" type="text/css"  href="http://localhost/project_kmong/static/css/style1.css">
<!-- JS파일 -->
<script type="text/javascript" src="http://localhost/project_kmong/static/js/file.js"></script>
<!-- footer css -->
 <link rel='stylesheet' type='text/css' media='screen' href='http://localhost/project_kmong/static/css/footer.css'>
<script type="text/javascript">window.history.forward(1);</script>
</head>
<body>
<div id="wrap" >
    <%@include file="../common/header_member.jsp"%>
    


    <div class="body-container2">
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

                <div  style="width: 577px; height: 376px;">
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
        </div>

        <!-- ///////////////////// -->

        <div class="related-posts">
            <div style="padding-top: 100px;">
                <div style="margin-bottom:50px; font-size: 20px; font-weight:bold; color: #303441; font-family: 'Metro Sans',sans-serif;">
                 관심사가 비슷한 회원들이 본 서비스
                </div>
                
                <div class="service">
                    <%for(int i=0; i<8 ; i++){
                    	%>
                    	<article class="post-one-by-one">
                    	<a href="#void">
                    		<img src="http://localhost/project_kmong/static/images/adImg2.PNG" style="border-radius: 1px;"/>
                    		<h6 data-testid="title" class="css-10894jy ezeyqpv9" style="font-size: 13px;  margin-top: 8px;">
                    		로고 제작 공모전 488회 우승 명함이벤트 로고 제작해 드립니다.
                    		</h6>
                    		<div style="text-align: right; margin-top: 10px"><strong>30,000원~</strong></div>
                    		<div class="star-preview">
	                    		<span style="padding-right: 2px">★</span>
	                    		<span style="color:#333; padding-top:5px; font-size: 12px">5.0&nbsp;&nbsp;2개의 평가</span>
                    		</div>
                    		
                    		</a>
                    	</article>
                    	
                    <% 
                    }
                    %>

                </div>
                
            </div>
        </div>

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
                    <img src="http://localhost/project_kmong/static/images/logo.JPG" class="imgs"/>
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
                    <img src="http://localhost/project_kmong/static/images/will_replace.JPG"/>
                    <img src="http://localhost/project_kmong/static/images/will_replace.JPG"/>
                </div>
            </div>
        </div>
        <div style="width: 1200px; padding-top: 90px; margin: 0px auto;">
            <img src="http://localhost/project_kmong/static/images/adad.JPG" style="border-radius: 5px;"/>
        </div>
    </div>
    
   <%@include file="../common/footer.jsp"%>
</div>


</body>
</html>