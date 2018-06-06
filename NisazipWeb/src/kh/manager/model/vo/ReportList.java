package kh.manager.model.vo;

public class ReportList {
	private int userNo;
	private String userId;
	private int reCount;
	
	public ReportList() {
	}

	public ReportList(int userNo,String userId, int reCount) {
		this.userNo= userNo;
		this.userId = userId;
		this.reCount = reCount;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getReCount() {
		return reCount;
	}

	public void setReCount(int reCount) {
		this.reCount = reCount;
	}
	

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "ReportList [userNo="+userNo+", userId=" + userId + ", reCount=" + reCount + "]";
	}
	
	
	
}
