package com.angle.domain;

public class Member {

	private String id; 					// 아이디
	private String pw; 				// 비밀번호
	private String nickName;		// 별명
	private String jDate; 			// 가입일
	private String lDate; 			// 최종접속시간
	private int vCount; 				// 방문수
	private boolean state;	 		// 상태
	private String image; 			// 프로필 사진
	private String pComment; 	// 인사말

	public Member() {

	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getjDate() {
		return jDate;
	}

	public void setjDate(String jDate) {
		this.jDate = jDate;
	}

	public String getlDate() {
		return lDate;
	}

	public void setlDate(String lDate) {
		this.lDate = lDate;
	}

	public int getvCount() {
		return vCount;
	}

	public void setvCount(int vCount) {
		this.vCount = vCount;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getpComment() {
		return pComment;
	}

	public void setpComment(String pComment) {
		this.pComment = pComment;
	}

}