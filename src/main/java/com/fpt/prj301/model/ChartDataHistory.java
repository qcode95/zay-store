package com.fpt.prj301.model;

import java.util.List;

public class ChartDataHistory {
    
    private List<Integer> amountData;
    private List<Integer> orderData;

    public ChartDataHistory() {
    }
    
    public List<Integer> getAmountData() {
        return amountData;
    }

    public void setAmountData(List<Integer> amountData) {
        this.amountData = amountData;
    }

    public List<Integer> getOrderData() {
        return orderData;
    }

    public void setOrderData(List<Integer> orderData) {
        this.orderData = orderData;
    }

    @Override
    public String toString() {
        return "ChartDataHistory{" + "amountData=" + amountData + ", orderData=" + orderData + '}';
    }
}
