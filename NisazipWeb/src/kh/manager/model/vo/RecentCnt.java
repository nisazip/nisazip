package kh.manager.model.vo;

public class RecentCnt {
	private int Ccnt;
	private String vDate;
	
	public RecentCnt() {
		super();
	}
	
	public RecentCnt(int ccnt, String vDate) {
		super();
		Ccnt = ccnt;
		this.vDate = vDate;
	}

	public int getCcnt() {
		return Ccnt;
	}

	public void setCcnt(int ccnt) {
		Ccnt = ccnt;
	}

	public String getvDate() {
		return vDate;
	}

	public void setvDate(String vDate) {
		this.vDate = vDate;
	}

	@Override
	public String toString() {
		return "RecentCnt [Ccnt=" + Ccnt + ", vDate=" + vDate + "]";
	}
	
	
	
}
