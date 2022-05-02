<%@page import="com.kmong.vo.OrdersVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.kmong.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>Insert title here</title>
<style type="text/css">





 

li{margin-bottom: 20px;}

/*  */
.main-purchase{width:100%}


/* footer */
.footer{width:1400px; display:flex; flex-direction: row;margin: 0px auto; justify-content: space-between;}








</style>

<script type="text/javascript">

$(function(){
   
});


</script>

</head>
<body>
<body>
<%@include file="../common/header_member.jsp"%>
<!-- if session에서 로그인 확인되면 header_member.jsp(line replace)-->
<hr/>

<div class="main-purchase">
<div style="width:1400px; margin:0px auto">

<div style="width:150px; height:100px; margin:auto;margin-bottom: 1px" >
<img src="http://localhost/project_kmong/static/images/img_logo2.png" style="width: 150px; height:80px; margin:0px auto; margin-top: 10px"/>
</div>

<%
request.setCharacterEncoding("UTF-8");

System.out.println("post_id: "+request.getParameter("postId2"));
System.out.println("memberId : "+(Integer)session.getAttribute("login"));

int postId = Integer.parseInt(request.getParameter("postId2"));
PostDAO pDAO = PostDAO.getInstance();
List<Map<String, String>> list = pDAO.selectPost(postId);

int memberId = (Integer)session.getAttribute("login");

OrdersVO oVO = new OrdersVO();
oVO.setPostId(postId);
oVO.setMemberId(memberId);
System.out.println(oVO);
pDAO.insertOrder(oVO);
%>

<div>

<div style="border-radius :25px; display:flex;width:650px ;margin:0px auto;height:700px ;align-items: center; justify-content: center; background-color:#FFE302">
   <div>
      <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16" style="display : block; margin : auto">
        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
      </svg><br/>
      <h1 class="h1"><strong>구매가 완료 되었습니다.</strong></h1><br/>
      <ul type="none">
         <li><strong>주문번호</strong> <input type="text" class="form-control" readonly="readonly" value="2"/><%= list.get(0).get("order_id") %></li>
         <li><strong>결제금액</strong> <input type="text" class="form-control" readonly="readonly" value="<%= list.get(0).get("price") %>"/></li>
         <li><strong>상품명</strong> <input type="text" class="form-control" readonly="readonly" value="<%= list.get(0).get("title") %>"/></li>

      </ul>
   </div>
</div>
</div>

<div style="margin:0px auto; width:150px;height:100px; margin-top: 30px">
<button class="btn btn-warning" style="width:120px;height:80px;"><strong>이전으로</strong></button>
</div>

</div>
</div>


<!--  footer-->
<%@include file="../common/footer.jsp" %>

</body>
</html>