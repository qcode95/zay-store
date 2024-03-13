package com.fpt.prj301.model;

import java.io.Serializable;

public class Brand implements Serializable {

	private static final long serialVersionUID = 9081089831144377807L;

	private int id;
	private String name;

	public Brand() {
	}

	public Brand(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Brand{" + "id=" + id + ", name=" + name + '}';
	}
}
