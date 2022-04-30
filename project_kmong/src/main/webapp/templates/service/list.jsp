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
	
	
}); //ready

/* function bold(this){
	
	$(this).css("font-weight" , "bold")
	
}//bold */

</script>

</head>
<body>

<%@include file="../common/header.jsp"%>
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
<!-- <div class="css-2p4obp ebpz7lm7"><a color="secondary" href="#void" class="ebpz7lm6 css-1byqrox e1lsgt8r0">문서 번역</a></div>
<div class="css-2p4obp ebpz7lm7"><a color="secondary" href="#void" class="ebpz7lm6 css-1byqrox e1lsgt8r0">ABCDE</a></div>
<div class="css-2p4obp ebpz7lm7"><a color="secondary" href="#void" class="ebpz7lm6 css-1byqrox e1lsgt8r0">FGHIJ</a></div>
<div class="css-2p4obp ebpz7lm7"><a color="secondary" href="#void" class="ebpz7lm6 css-1byqrox e1lsgt8r0">KLMNOP</a></div> -->

</div>

<!-- ........................................................................왼쪽 카테고리.................................................... -->
<!-- 메뉴페이지 시작..................................................................................................................... -->
<div class="menucont" style="width:100%">
<!-- 홈/디자인-->

<a href="http://localhost/project_kmong/templates/home/index.jsp" class="css-mz86x3 e1rp7ga00">홈</a>
<span>></span>
<%
String query1=request.getParameter("categoryId");



%>
<a href="http://localhost/project_kmong/templates/service/list.jsp" class="css-mz86x3 e1rp7ga00"><c:out value="${categorylist.categoryName }"/></a>


<!--인기순  -->
<div class="ingi" style="margin-top: 20px ; margin-bottom: 20px">
<div>

</div>
<div style="margin-right: 12px">
<select name="defaultFilter" class="form-select" aria-label="Default select example">
	<option value="평점순">평점순</option>
	<option value="신규등록순">신규등록순</option>
</select>

</div>
</div>
<!-- menu 시작 -->
<div class="startmenu">



<%   
if(query1==null) {    
	response.sendRedirect("http://localhost/project_kmong/templates/service/list.jsp");
}
int query2=Integer.parseInt(query1);
//int query=Integer.parseInt(request.getParameter("categoryId")); 
List<PostVO> list2=mnDAO.selectCategoryMenu(query2);  /*  카테고리 클릭했을때 쿼리스트링으로 얻어서  매개변수에 넣은다음 메뉴들 찾아오는건데  처음이 null이라 list.jsp가 오류남*/
pageContext.setAttribute("categoryMenu", list2);

Paging paging = new PageImpl(request,list2);
					paging.setPagePerRecord(12);
					
					int firstPage = paging.getFirstPage();
					int lastPage = paging.getLastPage();
					boolean isNext = paging.isNextPage();
					boolean isPrev = paging.isPrevPage();
					List<PostVO> result = paging.getVoAsPagePerRecord();
					int nextPage = paging.getNextPage();
					int prevPage = paging.getPrevPage();
					

					
					pageContext.setAttribute("isNextPage", isNext);
					pageContext.setAttribute("isPrevPage", isPrev);
					pageContext.setAttribute("firstPage", firstPage);
					pageContext.setAttribute("lastPage", lastPage);
					pageContext.setAttribute("next", nextPage);
					pageContext.setAttribute("prev", prevPage);
					pageContext.setAttribute("list", result);
					pageContext.setAttribute("size", result.size());
%>

 <c:forEach var="categoryMenu" items="${list}">
<article class="selectmenu" style="padding:0 12px; margin-bottom: 48px">
<a href="http://localhost/project_kmong/templates/service/detail.jsp?id=${categoryMenu.postId }" class="css-1mr8hr4 ezeyqpv17">
<div>
<img src="${categoryMenu.postImg }" style="height:130px; width:100%"/>
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

</div>
<div class="css-mkpab3 ezeyqpv2">
  <span role="img" rotate="0" data-testid="rating-icon" class="ezeyqpv3 css-wlmn2t e181xm9y1">
  <svg width="12" height="12" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
      <path d="M8.37094152,8.12482574 L2.52598096,8.59636398 L2.36821881,8.6135218 C0.881583763,8.81867772 0.513822851,10.1467426 1.72605142,11.1443161 L6.11068071,14.7526934 L4.80553251,20.0682859 L4.77348322,20.2161997 C4.50052597,21.673724 5.6402616,22.4726949 6.9887771,21.699537 L12.00271,18.8250573 L17.0166429,21.699537 L17.1506515,21.7715841 C18.4829447,22.4403279 19.5680516,21.5674348 19.1998875,20.0682859 L17.8937294,14.7526934 L22.2793686,11.1443161 L22.3984321,11.0405714 C23.4954951,10.0270601 23.0352205,8.72174778 21.479439,8.59636398 L15.6334685,8.12482574 L13.3880977,3.09014615 C12.7393731,1.6361626 11.2656405,1.63707337 10.6173223,3.09014615 L8.37094152,8.12482574 Z" ></path></svg></span>
      <c:out value="${category.starAvg }"/><span class="css-p9bq5v ezeyqpv0"></span>
  <div class="css-0 ezeyqpv1">2개의 평가</div>
</div>
</div>
</a>
</article>
</c:forEach> 





<!-- -------------------------------메뉴페이지 끝--------------------------------------------- -->
</div>
</div>
</div>
</div>
<!-- paging -->
					<form id="prevFrm">
					<input type="hidden" value="${prev}" name="p">
					</form>
					<form id="nextFrm">
					<input type="hidden" value="${next }" name="p">
					</form>
					
					<div style="text-align:center;height: 40px;">
					<c:if test="${ isPrevPage }">
					<a href="#void" onclick="prevSubmit()">prev</a>
					</c:if>
					<c:forEach var="i" begin="${firstPage}" end="${lastPage}" step="1">
					<a href="?p=${i}">${i}</a>
					</c:forEach>
					<c:if test="${ isNextPage }">
					<a href="#void" onclick="nextSubmit()">next</a>
					</c:if>
					</div>
					
					<!-- paging -->	


<!--  footer-->
<%@include file="../common/footer.jsp" %>


</body>
</html>