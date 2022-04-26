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


<script type="text/javascript">
$(function() {
	 $("#contract").change(function() {
		 if ($("#contract").val() == "ordersReq") {
			 location.href="request_list.jsp?contractflag=or";
			 return;
		 }
		 if ($("#contract").val() == "ordersCancel") {
			 location.href="cancel_list.jsp?contractflag=oc";
			 return;
		 }
		 if ($("#contract").val() == "ordersList") {
			 location.href="history_list.jsp?contractflag=ol";
			 return;
		 }
	 });//change
});//ready

</script>

			
				<aside class="aside">
					<div>
						<div style="margin-top: 60p">
						<div class="side-menu-wrapper">
						<%
						
						 MemberVO mVO = OrdersDAO.getInstance().selectMemberById(sid);
						 String nick = mVO.getNick();
						 String img = mVO.getUser_img();
						
						%>
						<div id="side-menu-wrapper">
							<img src="<%= img==null? "https://kmong.com/img/tools/default_profile@2x.png" :img %>" title="컬러풀블루1395" class="profile-image img-responsive" style="width: 150px;">
						</div>
						<div id="nickname-div"><span style="text-align: center; font-size: 18px; font-weight: bold"><%= nick %></span></div>
						<div class="side-menu-title-wrapper" style="margin-top: 50px; font-weight: bold;">마이계약</div>
						<div class="menu-list-wrapper"></div>
						</div>
						</div>
					</div>
					<hr orientation="horizontal" style="height: 2px;">
					<div>
					<select class="input-textDiv" id="contract" style="cursor: pointer; font-size: 16px;">
						<option value="ordersMng" selected disabled hidden>계약관리</option>
						<option value="ordersReq"${ param.contractflag eq "or"?" selected='selected'":"" }>계약 요청</option>
						<option value="ordersCancel"${ param.contractflag eq "oc"?" selected='selected'":"" }>계약 철회</option>
						<option value="ordersList"${ param.contractflag eq "ol"?" selected='selected'":"" }>계약 리스트(현황)</option>
					</select>
					</div>
				</aside>
			

