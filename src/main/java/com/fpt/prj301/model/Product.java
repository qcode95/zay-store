package com.fpt.prj301.model;

import java.io.Serializable;

public class Product implements Serializable {

	private static final long serialVersionUID = -1354511339789127854L;

	private int id;
	private String name;
	private String description;
	private int price;
	private String color;
	private int category;
	private String image;
	private int rating;
	private int quantity;
	private int brand;

	public Product() {
	}

	public Product(int id, String name, String description, int price, String color, String image, int rating,
			int quantity, int brand) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.color = color;
		this.image = image;
		this.rating = rating;
		this.quantity = quantity;
		this.brand = brand;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getBrand() {
		return brand;
	}

	public void setBrand(int brand) {
		this.brand = brand;
	}

	@Override
	public String toString() {
		return "Product{" + "id=" + id + ", name=" + name + ", description=" + description + ", price=" + price
				+ ", color=" + color + ", category=" + category + ", image=" + image + ", rating=" + rating
				+ ", quantity=" + quantity + ", brand=" + brand + '}';
	}

}
