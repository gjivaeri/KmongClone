package com.kmong.vo.admin;

import java.util.Date;

public class AdminPostsVO {
	int rnum, postId, price, categoryId;
	String categoryName, title, email, summary, description, img;
	Date postDate;

	public AdminPostsVO() {
	}

	public AdminPostsVO(int rnum, int postId, int price, int categoryId, String categoryName, String title,
			String email, String summary, String description, String img, Date postDate) {
		this.rnum = rnum;
		this.postId = postId;
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.title = title;
		this.email = email;
		this.summary = summary;
		this.description = description;
		this.img = img;
		this.postDate = postDate;
		this.price = price;
	}

	public int getRnum() {
		return rnum;
	}

	public int getPrice() {
		return price;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

}
