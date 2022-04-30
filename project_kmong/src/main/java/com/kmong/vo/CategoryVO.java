package com.kmong.vo;

public class CategoryVO {

	private int categoryId;
	private String categoryName, categoryImage, inputDate, categoryStatus;
	
	
	public CategoryVO() {
		super();
	}
	


	public CategoryVO(int categoryId, String categoryName, String categoryImage, String inputDate,
			String categoryStatus) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryImage = categoryImage;
		this.inputDate = inputDate;
		this.categoryStatus = categoryStatus;
	}
	
	


	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public String getCategoryImage() {
		return categoryImage;
	}


	public void setCategoryImage(String categoryImage) {
		this.categoryImage = categoryImage;
	}


	public String getInputDate() {
		return inputDate;
	}


	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}


	public String getCategoryStatus() {
		return categoryStatus;
	}


	public void setCategoryStatus(String categoryStatus) {
		this.categoryStatus = categoryStatus;
	}
	
	


	@Override
	public String toString() {
		return "CategoryVO [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryImage="
				+ categoryImage + ", inputDate=" + inputDate + ", categoryStatus=" + categoryStatus + "]";
	}
	
	
	
 
	
	
}
