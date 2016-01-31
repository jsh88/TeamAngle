package com.angle.domain;

public class Post {

	private int pNo; 				// 포스트 번호
	private String title; 			// 포스트 제목
	private int mPage; 			// 페이지 수
	private String wDate; 		// 작성일시
	private String mDate; 		// 수정일시
	private String tDate;	 		// 임시저장일시
	private int good; 				// 추천수
	private boolean state; 	// 임시
	private int count;				// 포스트 조회수

	// Member Join Info
	private String id;
	private String nickName;
	private String image;
	
	// Log Join Info
	private int lCount;
	private String rdate;
	
	public Post() {		
	}
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image = image;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getmPage() {
		return mPage;
	}

	public void setmPage(int mPage) {
		this.mPage = mPage;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getmDate() {
		return mDate;
	}

	public void setmDate(String mDate) {
		this.mDate = mDate;
	}

	public String gettDate() {
		return tDate;
	}

	public void settDate(String tDate) {
		this.tDate = tDate;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
	public int getlCount() {
		return lCount;
	}
	
	public void setlCount(int lCount) {
		this.lCount = lCount;
	}
	
	public String getRdate() {
		return rdate;
	}
	
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

}