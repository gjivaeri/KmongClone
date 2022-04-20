package com.kmong.vo;

public class PostAdminVO {

    private int postNo ;
    private String category,title,writer,writeDate;
	public int getPostNo() {
		return postNo;
	}
	public PostAdminVO(int postNo, String category, String title, String writer, String writeDate) {
		super();
		this.postNo = postNo;
		this.category = category;
		this.title = title;
		this.writer = writer;
		this.writeDate = writeDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

    
    

    
    
}
