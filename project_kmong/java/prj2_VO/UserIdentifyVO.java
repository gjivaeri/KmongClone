package prj2_VO;

public class UserIdentifyVO {
	
	private String memberId, email;

	public UserIdentifyVO() {
		super();
	}
	
	

	public UserIdentifyVO(String memberId, String email) {
		super();
		this.memberId = memberId;
		this.email = email;
	}
	
	

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	

	@Override
	public String toString() {
		return "userIdentifyVO [memberId=" + memberId + ", email=" + email + "]";
	}
	
	

}
