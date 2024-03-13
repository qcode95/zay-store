package com.fpt.prj301.model;

import java.io.Serializable;

public class Review implements Serializable {

	private static final long serialVersionUID = 5205146741646783835L;

	private int id;
	private int uId;
	private int pId;
	private String comment;
	private int rating;

	public Review() {
	}

	public Review(int id, int uId, int pId, String comment, int rating) {
		this.id = id;
		this.uId = uId;
		this.pId = pId;
		this.comment = comment;
		this.rating = rating;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uId;
	}

	public void setUid(int uId) {
		this.uId = uId;
	}

	public int getPid() {
		return pId;
	}

	public void setPid(int pId) {
		this.pId = pId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "Review{" + "id=" + id + ", uId=" + uId + ", pId=" + pId + ", comment=" + comment + ", rating=" + rating
				+ '}';
	}
}
