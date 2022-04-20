package com.kmong.vo;

public class InterestVO {
	private int memberId, categoryId;

	public InterestVO() {
		super();
	}
	
	

	public InterestVO(int memberId, int categoryId) {
		super();
		this.memberId = memberId;
		this.categoryId = categoryId;
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
	
	

	@Override
	public String toString() {
		return "InterestVO [memberId=" + memberId + ", categoryId=" + categoryId + "]";
	}
	
	
	
}
