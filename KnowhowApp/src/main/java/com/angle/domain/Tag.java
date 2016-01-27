package com.angle.domain;

public class Tag {

	private String tag;		// 태그
	private int count;			// 태그개수 or 조회수 or 유입수
	private int weight;		// 가중치 : 해당 태그가 가지는 중요지수
	private String fDate;		//	최초 생성,작성,조회 일시
	private String rDate;		// 최근 유입,작성,조회 일시

	public Tag() {
	}
	
	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getfDate() {
		return fDate;
	}

	public void setfDate(String fDate) {
		this.fDate = fDate;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

}