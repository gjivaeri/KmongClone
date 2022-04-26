<%@page import="com.kmong.vo.ExpertOrderVO"%>
<%@page import="com.kmong.dao.orders.OrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
int id = Integer.parseInt(request.getParameter("id"));
OrdersDAO oDAO = OrdersDAO.getInstance();
ExpertOrderVO evo = new ExpertOrderVO();
evo.setOrderStatus("N");
evo.setOrderId(id);
oDAO.updateOrderStatus(evo);
%>