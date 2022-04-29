package com.kmong.vo.admin;

import java.util.Date;

public class AdminMemberVO {
	int memberId;
	String email, nick, categoryName;
	Date joinDate;
	

	public AdminMemberVO() {
	}
	
	public AdminMemberVO(int memberId, String email, String nick, String categoryName, Date joinDate) {
		this.memberId = memberId;
		this.email = email;
		this.nick = nick;
		this.categoryName = categoryName;
		this.joinDate = joinDate;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "AdminUsersVO [memberId=" + memberId + ", email=" + email + ", nick=" + nick + ", categoryName="
				+ categoryName + ", joinDate=" + joinDate + "]";
	}
	
	
	
}
