package com.fpt.prj301.service;

public interface DeliveryService {

    public void UpdateOrderStatusShip(int id);
    
    public void UpdateOrderStatusDeliver(int id);
    
    public void UpdateOrderStatusRefund(int id);
    
}
