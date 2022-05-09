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

<style type="text/css">
#side_menu_wrapper .userprofile-info-wrapper .btn-wrapper .btn-toggle-set-seller-value {
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    padding: 2px;
    border-radius: 40px !important;
    font-size: 13px;
    line-height: 2.77;
}
.btn-navy {
    color: #fff;
    background-color: #27314c;
    border-color: #27314c;
}
}
</style>

<script type="text/javascript">
$(function() {
	$("#changeBtn").click(function() {
		location.href="http://211.63.89.132/templates/order_user/request_list.jsp"
	})
	$("#expertContract").change(function() {
		 if ($("#expertContract").val() == "ordersReq") {
			 location.href="http://211.63.89.132/templates/order_expert/management.jsp?contractflag=or";
			 return;
		 }
		 if ($("#expertContract").val() == "ordersComplete") {
			 location.href="http://211.63.89.132/templates/order_expert/success_list.jsp?contractflag=oce";
			 return;
		 }
		 if ($("#expertContract").val() == "canceList") {
			 location.href="http://211.63.89.132/templates/order_expert/fail_list.jsp?contractflag=oc";
			 return;
		 }
		 if ($("#expertContract").val() == "myService") {
			 location.href="http://211.63.89.132/templates/service_expert/service_list.jsp?contractflag=ms";
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
							<img src="<%= img==null? "https://kmong.com/img/tools/default_profile@2x.png" :"http://211.63.89.132/static/upload/"+img %>" class="profile-image img-responsive" style="width: 150px; border-radius: 80px; object-fit:cover; height:150px">
							<!-- <img src="https://kmong.com/img/tools/default_profile@2x.png" title="컬러풀블루1395" class="profile-image img-responsive" style="width: 150px;"> -->
						</div>
						<div id="nickname-div"><span style="text-align: center; font-size: 18px; font-weight: bold"><%= nick %></span></div>
						<div data-v-b711d792="" class="btn-wrapper" style="margin-top:15px; text-align: center;"><button data-v-b711d792="" class="btn btn-navy btn-toggle-set-seller-value" id="changeBtn"><img data-v-b711d792="" src="https://kmong.com/img/my_kmong/ic_switch_white@2x.png" alt="전환"> 의뢰인으로 전환
                </button></div>
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
			

