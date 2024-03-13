package com.fpt.prj301.model;

import java.io.Serializable;

public class Contact implements Serializable {

	private static final long serialVersionUID = 3315235248879524445L;

	private String name;
	private String email;
	private String subject;
	private String message;

	public Contact() {
	}

	public Contact(String name, String email, String subject, String message) {
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "Contact{" + "name=" + name + ", email=" + email + ", subject=" + subject + ", message=" + message + '}';
	}
}
