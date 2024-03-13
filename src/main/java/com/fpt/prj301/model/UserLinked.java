package com.fpt.prj301.model;

import java.io.Serializable;

public class UserLinked implements Serializable {

	private static final long serialVersionUID = 2575417537831284975L;

	private String firstName;
	private String lastName;
	private String headLine;
	private String id;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getHeadLine() {
		return headLine;
	}

	public void setHeadLine(String headLine) {
		this.headLine = headLine;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "UserLinked{" + "firstName=" + firstName + ", lastName=" + lastName + ", headLine=" + headLine + ", id="
				+ id + '}';
	}
}
