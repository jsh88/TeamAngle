package com.angle.domain;

public class PostContent {

	private int page;				// 페이지 번호
	private String content;		// 페이지 내용
	private String media;		// 페이지 이미지나 동영상 url
	
	// Post Join Info
	private int pNo;
	
	public PostContent() {
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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}	
	
}