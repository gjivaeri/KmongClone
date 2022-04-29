package com.kmong.vo.admin;

import java.util.Date;

public class AdminOrdersVO {
	int orderId, postId, price;
	String title, expert, user, status;
	Date orderDate;
	
	public AdminOrdersVO() {
	}
	
	public AdminOrdersVO(int orderId, int postId, int price, String title, String expert, String user, String status,
			Date orderDate) {

		this.orderId = orderId;
		this.postId = postId;
		this.price = price;
		this.title = title;
		this.expert = expert;
		this.user = user;
		this.status = status;
		this.orderDate = orderDate;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getExpert() {
		return expert;
	}
	public void setExpert(String expert) {
		this.expert = expert;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "AdminOrdersVO [orderId=" + orderId + ", postId=" + postId + ", price=" + price + ", title=" + title
				+ ", expert=" + expert + ", user=" + user + ", status=" + status + ", orderDate=" + orderDate + "]";
	}

	
}
