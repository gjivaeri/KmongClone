<%@page import="com.kmong.vo.OrdersVO"%>
<%@page import="com.kmong.dao.orders.OrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
int id = Integer.parseInt(request.getParameter("id"));
OrdersDAO oDAO = OrdersDAO.getInstance();
OrdersVO ovo = new OrdersVO();
ovo.setOrderStatus("N");
ovo.setOrderId(id);
oDAO.updateOrdersCancel(ovo);
%>