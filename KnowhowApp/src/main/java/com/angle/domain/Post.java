package com.angle.domain;

import java.io.Serializable;
import java.util.List;

public class Post implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int pNo; // 포스트 번호
	private String title; // 포스트 제목
	private int mPage; // 페이지 수, CommentCount 임시 저장
	private String wDate; // 작성일시
	private String mDate; // 수정일시
	private String tDate; // 임시저장일시
	private int good; // 추천수
	private boolean state; // 임시
	private int count; // 포스트 조회수

	// Member Join Info
	private String id;
	private String nickName;
	private String image;

	// Log Join Info
	private int lCount;
	private String rDate;

	// postViewList Info
	private String content;
	private String media;
	private int cCount;
	private List<String> tList;

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

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMedia() {
		return media;
	}

	public void setMedia(String media) {
		this.media = media;
	}

	public List<String> gettList() {
		return tList;
	}

	public void settList(List<String> tList) {
		this.tList = tList;
	}

}