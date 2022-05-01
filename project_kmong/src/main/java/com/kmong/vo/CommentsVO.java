package com.kmong.vo;

public class CommentsVO {
	
	private int commentId, memberId, postId;
	private String  review,nick,inputDate;
	private double star;
	
	public CommentsVO() {}
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
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
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	
	
	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	@Override
	public String toString() {
		return "CommentsVO [commentId=" + commentId + ", memberId=" + memberId + ", postId=" + postId + ", nick=" + nick
				+ ", review=" + review + ", star=" + star + "]";
	}

	public CommentsVO(int commentId, int memberId, int postId, String review, String nick, String inputDate,
			double star) {
		super();
		this.commentId = commentId;
		this.memberId = memberId;
		this.postId = postId;
		this.review = review;
		this.nick = nick;
		this.inputDate = inputDate;
		this.star = star;
	}
	

	
	
	
	
	
	
	


}
