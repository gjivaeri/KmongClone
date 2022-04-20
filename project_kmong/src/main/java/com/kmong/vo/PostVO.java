package com.kmong.vo;

public class PostVO {
	
	private int postId, memberId, price, term, categoryId;
	private String title, summary, postDate, description, postImg;
	private char status;
	private double starAvg;
	
	
	public PostVO() {
		super();
	}
	


	public PostVO(int postId, int memberId, int price, int term, int categoryId, String title, String summary,
			String postDate, String description, String postImg, char status, double starAvg) {
		super();
		this.postId = postId;
		this.memberId = memberId;
		this.price = price;
		this.term = term;
		this.categoryId = categoryId;
		this.title = title;
		this.summary = summary;
		this.postDate = postDate;
		this.description = description;
		this.postImg = postImg;
		this.status = status;
		this.starAvg = starAvg;
	}



	public int getPostId() {
		return postId;
	}



	public void setPostId(int postId) {
		this.postId = postId;
	}



	public int getMemberId() {
		return memberId;
	}



	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public int getTerm() {
		return term;
	}



	public void setTerm(int term) {
		this.term = term;
	}



	public int getCategoryId() {
		return categoryId;
	}



	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getSummary() {
		return summary;
	}



	public void setSummary(String summary) {
		this.summary = summary;
	}



	public String getPostDate() {
		return postDate;
	}



	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getPostImg() {
		return postImg;
	}



	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}



	public char getStatus() {
		return status;
	}



	public void setStatus(char status) {
		this.status = status;
	}



	public double getStarAvg() {
		return starAvg;
	}



	public void setStarAvg(double starAvg) {
		this.starAvg = starAvg;
	}



	@Override
	public String toString() {
		return "PostVO [postId=" + postId + ", memberId=" + memberId + ", price=" + price + ", term=" + term
				+ ", categoryId=" + categoryId + ", title=" + title + ", summary=" + summary + ", postDate=" + postDate
				+ ", description=" + description + ", postImg=" + postImg + ", status=" + status + ", starAvg="
				+ starAvg + "]";
	}
	
	
	
	
	

}
