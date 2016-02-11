package com.angle.domain;

import java.io.Serializable;

public class PostTag extends Tag implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	// Post Join Info
	private int pNo;
	
	public PostTag() {
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

}