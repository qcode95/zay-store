package com.fpt.prj301.model;

public class Transaction extends User {

    private static final long serialVersionUID = -8479372337545608046L;

    private int transactionId;
    private int uId;
    private int oId;
    private int amount;
    private String date;

    public Transaction() {
    }

    public Transaction(int transactionId, int uId, int oId, int amount, String date) {
        super(uId);
        this.transactionId = transactionId;
        this.uId = uId;
        this.oId = oId;
        this.amount = amount;
        this.date = date;
    }

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public int getUid() {
        return uId;
    }

    public void setUid(int uId) {
        this.uId = uId;
    }

    public int getOid() {
        return oId;
    }

    public void setOid(int oId) {
        this.oId = oId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Transaction{" + "transactionId=" + transactionId + ", uId=" + uId + ", amount=" + amount + ", date=" + date + '}';
    }
}
