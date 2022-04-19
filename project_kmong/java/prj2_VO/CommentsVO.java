package prj2_VO;

public class CommentsVO {
	
	private int commentId, memberId, postId;
	private String  review;
	private double star;
	
	
	
	public CommentsVO() {
		super();
	}



	public CommentsVO(int commentId, int memberId, int postId, String review, double star) {
		super();
		this.commentId = commentId;
		this.memberId = memberId;
		this.postId = postId;
		this.review = review;
		this.star = star;
	}



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



	@Override
	public String toString() {
		return "CommentsVO [commentId=" + commentId + ", memberId=" + memberId + ", postId=" + postId + ", review="
				+ review + ", star=" + star + "]";
	}
	
	
	
	
	


}
