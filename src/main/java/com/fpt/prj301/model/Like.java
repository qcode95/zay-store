package com.fpt.prj301.model;

public class Like extends Product {

	private static final long serialVersionUID = 643928130273286450L;

	private int lId;
	private int pId;
	private int uId;

	public Like() {
	}

	public Like(int id, int pId, int uId) {
		this.lId = id;
		this.pId = pId;
		this.uId = uId;
	}

	public int getLid() {
		return lId;
	}

	public void setLid(int lId) {
		this.lId = lId;
	}

	public int getPid() {
		return pId;
	}

	public void setPid(int pId) {
		this.pId = pId;
	}

	public int getUid() {
		return uId;
	}

	public void setUid(int uId) {
		this.uId = uId;
	}

	@Override
	public String toString() {
		return "Like{" + "lId=" + lId + ", pId=" + pId + ", uId=" + uId + '}';
	}
}
