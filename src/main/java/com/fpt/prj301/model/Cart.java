package com.fpt.prj301.model;

public class Cart extends Product {

	private static final long serialVersionUID = 4757701943811908925L;

	private int quantity;
	private int size;

	public Cart() {
	}

	@Override
	public int getQuantity() {
		return quantity;
	}

	@Override
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

}
