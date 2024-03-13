package com.fpt.prj301.model;

import java.io.Serializable;

public class ProductSize implements Serializable {

	private static final long serialVersionUID = -3543005697631774829L;

	private int id;
	private int cId;
	private String name;
	private int size;

	public ProductSize() {
	}

	public ProductSize(int id, int cId, String name, int size) {
		this.id = id;
		this.cId = cId;
		this.name = name;
		this.size = size;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "ProductSize{" + "id=" + id + ", cId=" + cId + ", name=" + name + ", size=" + size + '}';
	}
}
