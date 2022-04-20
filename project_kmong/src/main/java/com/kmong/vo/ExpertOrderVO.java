package com.kmong.vo;

public class ExpertOrderVO {
	
	private int orderId, memberId, postId;
	private String orderDate, memberNick, postImg, postTitle;
	private char orderStatus;
	
	
	public ExpertOrderVO() {
		super();
	}


	public ExpertOrderVO(int orderId, int memberId, int postId, String orderDate, String memberNick, String postImg,
			String postTitle, char orderStatus) {
		super();
		this.orderId = orderId;
		this.memberId = memberId;
		this.postId = postId;
		this.orderDate = orderDate;
		this.memberNick = memberNick;
		this.postImg = postImg;
		this.postTitle = postTitle;
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


	public String getMemberNick() {
		return memberNick;
	}


	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}


	public String getPostImg() {
		return postImg;
	}


	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}


	public String getPostTitle() {
		return postTitle;
	}


	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}


	public char getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(char orderStatus) {
		this.orderStatus = orderStatus;
	}


	@Override
	public String toString() {
		return "ExpertOrderVO [orderId=" + orderId + ", memberId=" + memberId + ", postId=" + postId + ", orderDate="
				+ orderDate + ", memberNick=" + memberNick + ", postImg=" + postImg + ", postTitle=" + postTitle
				+ ", orderStatus=" + orderStatus + "]";
	}
 
	
	

}
