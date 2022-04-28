package com.kmong.vo.admin;

import java.util.Date;

public class AdminPostsVO {
	int rnum, post_id; 
	String category_name, title, email;
	Date post_date;
	
	public AdminPostsVO() {
	}
	
	public AdminPostsVO(int rnum, int post_id, String category_name, String title, String email, Date post_date) {
		this.rnum = rnum;
		this.post_id = post_id;
		this.category_name = category_name;
		this.title = title;
		this.email = email;
		this.post_date = post_date;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
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
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	@Override
	public String toString() {
		return "AdminPostsVO [rnum=" + rnum + ", post_id=" + post_id + ", category_name=" + category_name + ", title="
				+ title + ", email=" + email + ", post_date=" + post_date + "]";
	}
	
	
}
