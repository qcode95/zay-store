package com.fpt.prj301.model;

import java.io.Serializable;

public class Bill implements Serializable {

	private static final long serialVersionUID = -3351199024932983715L;

	private int id;
	private int oId;
	private String name;
	private String email;
	private int mobile;
	private String address;
	private int postCode;

	public Bill() {
	}

	public Bill(int id, int oId, String name, String email, int mobile, String address, int postCode) {
		this.id = id;
		this.oId = oId;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.postCode = postCode;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOid() {
		return oId;
	}

	public void setOid(int oId) {
		this.oId = oId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMobile() {
		return mobile;
	}

	public void setMobile(int mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	@Override
	public String toString() {
		return "Bill{" + "id=" + id + ", oId=" + oId + ", name=" + name + ", email=" + email + ", mobile=" + mobile
				+ ", address=" + address + ", postCode=" + postCode + '}';
	}
}
