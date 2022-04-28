package com.kmong.vo;

import java.util.List;

public class MemberVO {
	
	private int memberId, categoryId;
	private String email, password, name, nick, tel, user_img, withdrawalReason, joinDate, ip;
	private String expert, withdrawalStatus, agreement;
	private String[] interestingList;
	
	
	public MemberVO() {
		super();
	}


	public MemberVO(int memberId, int categoryId, String email, String password, String name, String nick, String tel,
			String user_img, String withdrawalReason, String joinDate, String ip, String expert, String withdrawalStatus,
			String agreement, String[] interestingList) {
		super();
		this.memberId = memberId;
		this.categoryId = categoryId;
		this.email = email;
		this.password = password;
		this.name = name;
		this.nick = nick;
		this.tel = tel;
		this.user_img = user_img;
		this.withdrawalReason = withdrawalReason;
		this.joinDate = joinDate;
		this.ip = ip;
		this.expert = expert;
		this.withdrawalStatus = withdrawalStatus;
		this.agreement = agreement;
		this.interestingList = interestingList;
	}

	

	public int getMemberId() {
		return memberId;
	}


	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}


	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getNick() {
		return nick;
	}


	public void setNick(String nick) {
		this.nick = nick;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getUser_img() {
		return user_img;
	}


	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}


	public String getWithdrawalReason() {
		return withdrawalReason;
	}


	public void setWithdrawalReason(String withdrawalReason) {
		this.withdrawalReason = withdrawalReason;
	}


	public String getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}


	public String getIp() {
		return ip;
	}


	public void setIp(String ip) {
		this.ip = ip;
	}


	public String getExpert() {
		return expert;
	}


	public void setExpert(String expert) {
		this.expert = expert;
	}


	public String getWithdrawalStatus() {
		return withdrawalStatus;
	}


	public void setWithdrawalStatus(String withdrawalStatus) {
		this.withdrawalStatus = withdrawalStatus;
	}


	public String getAgreement() {
		return agreement;
	}


	public void setAgreement(String agreement) {
		this.agreement = agreement;
	}


	public String[] getInterestingList() {
		return interestingList;
	}


	public void setInterestingList(String[] interestingList) {
		this.interestingList = interestingList;
	}


	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", categoryId=" + categoryId + ", email=" + email + ", password="
				+ password + ", name=" + name + ", nick=" + nick + ", tel=" + tel + ", user_img=" + user_img
				+ ", withdrawalReason=" + withdrawalReason + ", joinDate=" + joinDate + ", ip=" + ip + ", expert="
				+ expert + ", withdrawalStatus=" + withdrawalStatus + ", agreement=" + agreement + ", interestingList="
				+ interestingList + "]";
	}
	
	
	

}
