<%@page import="com.kmong.dao.admin.AdminOrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
int orderId = Integer.parseInt(request.getParameter("orderId"));
AdminOrderDAO aoDAO = AdminOrderDAO.getInstance();
boolean result = aoDAO.deleteOrder(orderId);
%>
<script>
if(!<%=result%>){alert("주문 취소에 실패했습니다")}
alert("주문이 취소되었습니다");
location.href="http://211.63.89.132/admin/pages/orders/orders_detail.jsp?id=<%=orderId%>";
</script>
</body>
</html>