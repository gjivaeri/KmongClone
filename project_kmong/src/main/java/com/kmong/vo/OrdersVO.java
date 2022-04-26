package com.kmong.vo;

public class OrdersVO {

	private int orderId, memberId, postId;
	private String orderDate, orderImg, orderFinishDate;
	private String orderStatus;
	
	
	
	public OrdersVO() {
		super();
	}



	public OrdersVO(int orderId, int memberId, int postId, String orderDate, String orderImg, String orderFinishDate,
			String orderStatus) {
		super();
		this.orderId = orderId;
		this.memberId = memberId;
		this.postId = postId;
		this.orderDate = orderDate;
		this.orderImg = orderImg;
		this.orderFinishDate = orderFinishDate;
		this.orderStatus = orderStatus;
	}



	public int getOrderId() {
		return orderId;
	}



	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}



	public int getMemberId() {
		return memberId;
	}



	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}



	public int getPostId() {
		return postId;
	}



	public void setPostId(int postId) {
		this.postId = postId;
	}



	public String getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}



	public String getOrderImg() {
		return orderImg;
	}



	public void setOrderImg(String orderImg) {
		this.orderImg = orderImg;
	}



	public String getOrderFinishDate() {
		return orderFinishDate;
	}



	public void setOrderFinishDate(String orderFinishDate) {
		this.orderFinishDate = orderFinishDate;
	}



	public String getOrderStatus() {
		return orderStatus;
	}



	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}



	@Override
	public String toString() {
		return "OrdersVO [orderId=" + orderId + ", memberId=" + memberId + ", postId=" + postId + ", orderDate="
				+ orderDate + ", orderImg=" + orderImg + ", orderFinishDate=" + orderFinishDate + ", orderStatus="
				+ orderStatus + "]";
	}
	
	
	

}
