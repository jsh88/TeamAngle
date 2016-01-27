package com.angle.domain;

public class MemberTag extends Tag {

	// Member Join Info
	private String id;
	private String nickName;

	public MemberTag() {
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

}