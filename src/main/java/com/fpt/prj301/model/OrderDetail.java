package com.fpt.prj301.model;

public class OrderDetail extends Order {

    private static final long serialVersionUID = -6221083107759786056L;

    private int id;
    private int orderId;
    private int productId;
    private int quantity;
    private int amount;
    private int size;

    public OrderDetail() {
    }

    public OrderDetail(int id, int orderId, int productId, int quantity, int amount, int size) {
        super(orderId);
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.amount = amount;
        this.size = size;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", orderId=" + orderId + ", productId=" + productId + ", quantity=" + quantity + ", amount=" + amount + ", size=" + size + '}';
    }
}
