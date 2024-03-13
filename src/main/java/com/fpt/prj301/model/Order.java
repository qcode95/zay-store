package com.fpt.prj301.model;

public class Order extends User {

    private static final long serialVersionUID = -1678112809773204496L;

    private int orderId;
    private int uid;
    private String date;
    private int amount;
    private String status;
    private int deliveryId;
    private int discountId;

    public Order() {
    }

    public Order(int orderId, int uid, String date, int amount, String status, int deliveryId, int discountId) {
        super(uid);
        this.orderId = orderId;
        this.uid = uid;
        this.date = date;
        this.amount = amount;
        this.status = status;
        this.deliveryId = deliveryId;
        this.discountId = discountId;
    }

    public Order(int orderId) {
        this.orderId = orderId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int id) {
        this.orderId = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(int deliveryId) {
        this.deliveryId = deliveryId;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", uid=" + uid + ", date=" + date + ", amount=" + amount + ", status=" + status + ", deliveryId=" + deliveryId + ", discountId=" + discountId + '}';
    }
}
