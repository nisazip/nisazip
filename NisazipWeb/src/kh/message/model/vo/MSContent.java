package kh.message.model.vo;

public class MSContent {
	private int mNo ;
	private String sender;
	private String reciver;
	private String content;
	
	
	public MSContent() {
		super();
	}


	public MSContent(int mNo, String sender, String reciver, String content) {
		super();
		this.mNo = mNo;
		this.sender = sender;
		this.reciver = reciver;
		this.content = content;
	}


	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public String getSender() {
		return sender;
	}


	public void setSender(String sender) {
		this.sender = sender;
	}


	public String getReciver() {
		return reciver;
	}


	public void setReciver(String reciver) {
		this.reciver = reciver;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	@Override
	public String toString() {
		return "MSContent [mNo=" + mNo + ", sender=" + sender + ", reciver=" + reciver + ", content=" + content + "]";
	}
	
	
}
