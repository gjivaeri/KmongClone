<%@page import="com.kmong.vo.MemberVO"%>
<%@page import="com.kmong.dao.orders.OrdersDAO"%>
<%@page import="com.kmong.paging.PageImpl"%>
<%@page import="com.kmong.paging.Paging"%>
<%@page import="com.kmong.vo.ExpertOrderVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>kmong</title>



<script type="text/javascript">
$(function() {
	$("#expertContract").change(function() {
		 if ($("#expertContract").val() == "ordersReq") {
			 location.href="http://localhost/project_kmong/templates/order_expert/management.jsp?contractflag=or";
			 return;
		 }
		 if ($("#expertContract").val() == "ordersComplete") {
			 location.href="http://localhost/project_kmong/templates/order_expert/success_list.jsp?contractflag=oce";
			 return;
		 }
		 if ($("#expertContract").val() == "canceList") {
			 location.href="http://localhost/project_kmong/templates/order_expert/fail_list.jsp?contractflag=oc";
			 return;
		 }
		 if ($("#expertContract").val() == "myService") {
			 location.href="http://localhost/project_kmong/templates/service_expert/service_list.jsp?contractflag=ms";
			 return;
		 }
	});
});//ready

</script>

			
				<aside class="aside">
					<div>
						<div style="margin-top: 60px">
						<div class="side-menu-wrapper">
						<%
						 MemberVO mVO = OrdersDAO.getInstance().selectMemberById(sid);
						 String nick = mVO.getNick();
						 String img = mVO.getUser_img();
						
						%>
						<div id="side-menu-wrapper">
							<img src="<%= img==null? "https://kmong.com/img/tools/default_profile@2x.png" :img %>" title="컬러풀블루1395" class="profile-image img-responsive" style="width: 150px;">
							<!-- <img src="https://kmong.com/img/tools/default_profile@2x.png" title="컬러풀블루1395" class="profile-image img-responsive" style="width: 150px;"> -->
						</div>
						<div id="nickname-div"><span style="text-align: center; font-size: 18px; font-weight: bold"><%= nick %></span></div>
						<div class="side-menu-title-wrapper" style="margin-top: 50px; font-weight: bold;">마이계약</div>
						<div class="menu-list-wrapper"></div>
						</div>
						</div>
					</div>
					<hr orientation="horizontal" style="height: 2px;">
					<div>
					<select class="input-textDiv" id="expertContract" style="cursor: pointer; font-size: 16px;">
						<option value="ordersMng" selected disabled hidden>계약관리</option>
						<option value="ordersReq"${ param.contractflag eq "or"?" selected='selected'":"" }>계약 요청 승인</option>
						<option value="ordersComplete"${ param.contractflag eq "oce"?" selected='selected'":"" }>완료된 계약</option>
						<option value="canceList"${ param.contractflag eq "oc"?" selected='selected'":"" }>철회된 계약</option>
						<option value="myService"${ param.contractflag eq "ms"?" selected='selected'":"" }>나의 서비스</option>
					</select>
					</div>
				</aside>
			

