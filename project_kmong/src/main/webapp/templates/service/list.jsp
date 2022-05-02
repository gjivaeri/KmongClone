<%@page import="com.kmong.paging.PageImpl"%>
<%@page import="com.kmong.paging.Paging"%>
<%@page import="com.kmong.vo.PostVO"%>
<%@page import="com.kmong.vo.CategoryVO"%>
<%@page import="com.kmong.dao.account.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>



<% if(request.getQueryString()==null){
   response.sendRedirect("http://localhost/project_kmong/templates/service/list.jsp?categoryId=1");
   return;
}

%>
<title>Insert title here</title>
<!-- 공통CSS-->
<style type="text/css">
a {
   color: rgb(48 52 65);
    background-color: transparent;
}






/*nav  */

.categorybox{display:flex ;flex:0 0 200px;flex-direction: column}

/* menu */
.menu{display:flex; flex-direction: row}
.menucont{margin-left:20px;}
.ingi{display:flex;  justify-content: space-between }
.selectmenu{width:25%}
.price{display:flex; justify-content: space-between }
.startmenu{display:flex; flex-direction: row; flex-wrap: wrap}



/* footer */
.footer{width:1400px; display:flex; flex-direction: row;margin: 0px auto; justify-content: space-between;}



.css-mz86x3:hover {
font-weight: bold;
color:#333
}


</style>

<script type="text/javascript">
<%
if(session.getAttribute("loginMsg")!=null){
	%>alert("로그인이 성공적으로 완료되었습니다.")<%
	session.removeAttribute("loginMsg");
}%>

////////////////////(0430 정렬구현 추가 코드 - 확인하고 이 주석은 지워주세요)///////////////////////////////////////
//파라미터에서 원하는 쿼리의 원하는 값을 얻기 위한 함수
var getUrlParameter = function getUrlParameter(sParam) {
 //url parameter를 얻어온다, 그 후 대부분의 문자를 디코딩하는 함수 사용
 var sPageURL = decodeURIComponent(window.location.search.substring(1)),
     sURLVariables = sPageURL.split('&'),
     sParameterName,
     i;

     //window.location.search는 ?sort=post_date와 같은 쿼리스트링 부분을 가지고 온다.
     //substring(1)로 객체의 시작인덱스부터 가져옴

 for (i = 0; i < sURLVariables.length; i++) {
     sParameterName = sURLVariables[i].split('=');

     if (sParameterName[0] === sParam) {
         return sParameterName[1] === undefined ? true : sParameterName[1];
     }
 }
};

//select 옵션을 바꾸는 onchage를 감지하면 쿼리문과 함께 해당하는 URL로 이동한다
function sort(selectIdx){
   var page = getUrlParameter('p');
   var categoryId = getUrlParameter('categoryId');
   var nextURL = 'http://localhost/project_kmong/templates/service/list.jsp?categoryId='
      +categoryId+selectIdx;
   if(page!=undefined){
      nextURL = 'http://localhost/project_kmong/templates/service/list.jsp?'
         +'p='+page+'&categoryId='+categoryId+selectIdx;
   }
   window.location.href=nextURL; 
}

///detail.jsp로 넘어가는 postId///
function selectPostId( postId ){
	$("#selectPostId").val( postId );
	$("#postIdFrm").submit();
} 
/////////////////////////////////////////////////////////////////////////////////////////////////

$(function(){
   var bold="";
   
   $(".ebpz7lm6").hover(function() {
      $(this).css({"font-weight" : "bold" ,"color" : "#333"})
      
   }, function() {
      $(".ebpz7lm6").css({"font-weight" : "normal" ,"color" : "rgb(85, 89, 105)"}) 
      $(bold).css({"font-weight" : "bold" ,"color" : "#333"})
      
   });
      
   $(".ebpz7lm6").click(function() {
      bold=this;
      $(".ebpz7lm6").css({"font-weight" : "normal" ,"color" : "rgb(85, 89, 105)"}) 
      $(this).css({"font-weight" : "bold" ,"color" : "#333"})
   }); 
   
   function nextSubmit() {
      $("#nextFrm").submit();
   }
   
   function prevSubmit() {
      $("#prevFrm").submit();
   }
////////////////////(0430 정렬구현 추가 코드 - 확인하고 이 주석은 지워주세요)///////////////////////////////////////
//선택한 option값을 계속 selected시키기 위한 코드, 페이지가 시작하자마자 실행되어야함
   var sort = getUrlParameter('sort');
   if(sort == 'post_date'){
    $('.sort-date').prop('selected', 'selected')
   }else if(sort == 'star_avg'){
    $('.sort-star').prop('selected', 'selected')
   }else{
    $('.sort-date').prop('selected', 'selected')
   }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}); //ready



</script>

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
<!-- if session에서 로그인 확인되면 header_member.jsp(line replace)-->
<!-- -----------------------------------------------------------------  -->
<div style="width:100%">
<div style="width:1400px;margin:0px auto" class="menu">
<!-- 왼쪽 카테고리----nav-------------------------------------------------------------- -->

<%
MenuDAO mnDAO=new MenuDAO();   
List<CategoryVO> list1=mnDAO.selectAllCategory();
pageContext.setAttribute("categoryList", list1);


%>
<div class="categorybox">
<h1 class="css-1bmlbzf e18el20q0">카테고리</h1>
<hr style="border:2px solid RGB(252, 212, 0)"/>
<c:forEach var="categorylist" items="${categoryList}">

<div class="css-2p4obp ebpz7lm7"><a color="secondary" href="http://localhost/project_kmong/templates/service/list.jsp?categoryId=${categorylist.categoryId}" class="ebpz7lm6 css-1byqrox e1lsgt8r0" ><c:out value="${categorylist.categoryName }"/></a></div>

</c:forEach>


</div>

<!-- ........................................................................왼쪽 카테고리.................................................... -->
<!-- 메뉴페이지 시작..................................................................................................................... -->
<div class="menucont" style="width:100%">
<!-- 홈/디자인-->
<%
String query1=request.getParameter("categoryId");  // 쿼리스트링으로 categoryid 얻기
int query2=Integer.parseInt(query1);
String categoryname= mnDAO.selectCategoryName(query2);
%>



<a href="http://localhost/project_kmong/templates/home/index.jsp" class="css-mz86x3 e1rp7ga00">홈</a>

<span>></span>
<span><c:out value="<%=categoryname %>"/></span>


<!--인기순  -->
<div class="ingi" style="margin-top: 20px ; margin-bottom: 20px">
<div>

</div>
<div style="margin-right: 12px">
<!-- ////////////////////(0430 정렬구현 추가 코드 - 확인하고 이 주석은 지워주세요)/////////////////////////////////////// -->
<select name="sort-posts" onchange="sort(this.value)" class="form-select" aria-label="Default select example">
   <option class="sort-date" value="&sort=post_date">신규등록순</option>
   <option class="sort-star" value="&sort=star_avg">평점순</option>
</select>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
</div>
</div>
<!-- menu 시작 -->
<div class="startmenu">



<%   
////////////////////(0430 정렬구현 추가 코드 - 확인하고 이 주석은 지워주세요)///////////////////////////////////////

String sortIdx = request.getParameter("sort");
//페이지 이동해도 쿼리값을 유지시기키 위함
String sortQuery="&sort="+sortIdx;
request.setAttribute("catId", query1);
request.setAttribute("sortQuery", sortQuery);




List<PostVO> sortedList = mnDAO.selectDateMenu(query2, sortIdx);  //query2 는 195번째 줄에 있음
pageContext.setAttribute("categoryMenu", sortedList);
////////////////////////////////////////////////////////////////////////////////////////////////////////
Paging paging = new PageImpl(request,sortedList,12);
             
               
               int firstPage = paging.getFirstPage();
               int lastPage = paging.getLastPage();
               boolean isNext = paging.isNextPage();
               boolean isPrev = paging.isPrevPage();
               List<PostVO> result = paging.getVoAsPagePerRecord();
               int nextPage = paging.getNextPage();
               int prevPage = paging.getPrevPage();
               
               String param="";

               if (request.getQueryString() != null) {
                  if(request.getQueryString().indexOf("p") == -1){
                     //param = request.getQueryString();      
                     param = request.getQueryString().substring(request.getQueryString().indexOf("p")+1);
                  }   
               }

               pageContext.setAttribute("param",param);
               pageContext.setAttribute("isNextPage", isNext);
               pageContext.setAttribute("isPrevPage", isPrev);
               pageContext.setAttribute("firstPage", firstPage);
               pageContext.setAttribute("lastPage", lastPage);
               pageContext.setAttribute("next", nextPage);
               pageContext.setAttribute("prev", prevPage);
               pageContext.setAttribute("list", result);
               pageContext.setAttribute("size", result.size());
               
%>
<form action="detail.jsp" method="post" id="postIdFrm">
	<input type="hidden" name="selectPostId" id="selectPostId"/> 
</form>

 <c:forEach var="categoryMenu" items="${list}">

<article class="selectmenu" style="padding:0 12px; margin-bottom: 48px">
<a href="http://localhost/project_kmong/templates/service/detail.jsp?id=${categoryMenu.postId }" class="css-1mr8hr4 ezeyqpv17">
<div>
<img src="http://localhost/project_kmong/static/PostimgUpload/${categoryMenu.postImg }" onclick="selectPostId(${categoryMenu.postId})"  style="height:130px; width:100%"/>
</div>
<div>
<div style="margin-top: 10px">
<h3 data-testid="title" class="css-10894jy" ><c:out value="${categoryMenu.title}"/></h3>
</div>
<div class="price" style="margin-top: 10px">
<div>

</div>
<div class="css-1eoy87d ezeyqpv6">
  <div class="css-1ff36h2 ezeyqpv8"></div>
  <div class="css-s5xdrg ezeyqpv5">
    <div data-testid="price" class="css-1848xfl ezeyqpv4"><fmt:formatNumber value="${categoryMenu.price}" pattern="#,###"/>원</div>
  </div>
</div>


<c:set value="${categoryMenu.postId }" var="postId"/>
<%
String asd=pageContext.getAttribute("postId").toString();
int postId=Integer.parseInt(asd);
int count= mnDAO.commentcount(postId);


%>

</div>
<div class="css-mkpab3 ezeyqpv2">
  <span role="img" rotate="0" data-testid="rating-icon" class="ezeyqpv3 css-wlmn2t e181xm9y1">
  <svg width="12" height="12" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
      <path style="color: rgb(255, 212, 0)" d="M8.37094152,8.12482574 L2.52598096,8.59636398 L2.36821881,8.6135218 C0.881583763,8.81867772 0.513822851,10.1467426 1.72605142,11.1443161 L6.11068071,14.7526934 L4.80553251,20.0682859 L4.77348322,20.2161997 C4.50052597,21.673724 5.6402616,22.4726949 6.9887771,21.699537 L12.00271,18.8250573 L17.0166429,21.699537 L17.1506515,21.7715841 C18.4829447,22.4403279 19.5680516,21.5674348 19.1998875,20.0682859 L17.8937294,14.7526934 L22.2793686,11.1443161 L22.3984321,11.0405714 C23.4954951,10.0270601 23.0352205,8.72174778 21.479439,8.59636398 L15.6334685,8.12482574 L13.3880977,3.09014615 C12.7393731,1.6361626 11.2656405,1.63707337 10.6173223,3.09014615 L8.37094152,8.12482574 Z" ></path></svg></span>
      <c:out value="${categoryMenu.starAvg }"/><span class="css-p9bq5v ezeyqpv0"></span>
  <div class="css-0 ezeyqpv1"><%=count %>개의 평가</div>
</div>
</div>
</a>
</article>

</c:forEach> 




<!----------------------------------------- 메뉴페이지 끝 ----------------------------------------->
</div>
</div>
</div>
</div>
<!----------------------------------------- paging ----------------------------------------->
               <form id="prevFrm">
               <input type="hidden" value="${prev}" name="p">
               <input type="hidden" value="${catId }" name="categoryId"/>
               </form>
               <form id="nextFrm">
               <input type="hidden" value="${next }" name="p">
               <input type="hidden" value="${catId }" name="categoryId"/>
               </form>
               
               <div style="text-align:center;height: 40px;">
               <c:if test="${ isPrevPage }">
               <a href="#void" onclick="prevSubmit()">prev</a>
               </c:if>
               <c:forEach var="i" begin="${firstPage}" end="${lastPage}" step="1">
                  <a href="?p=${i}&categoryId=${catId}${sortQuery}">${i}</a>
               </c:forEach>
               <c:if test="${ isNextPage }">
               <a href="#void" onclick="nextSubmit()">next</a>
               </c:if>
               </div>
               
               <!----------------------------------------- paging ----------------------------------------->


<!----------------------------------------- footer ----------------------------------------->
<%@include file="../common/footer.jsp" %>


</body>
</html>