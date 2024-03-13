package com.fpt.prj301.service.impl;

import com.fpt.prj301.repository.DeliveryRepository;
import com.fpt.prj301.service.DeliveryService;
import java.sql.SQLException;

public class DeliveryServiceImpl implements DeliveryService {
    
    private final DeliveryRepository deliveryRepo = new DeliveryRepository();

    @Override
    public void UpdateOrderStatusShip(int id) {
        try {
            this.deliveryRepo.updateOrderStatusShip(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    @Override
    public void UpdateOrderStatusDeliver(int id) {
        try {
            this.deliveryRepo.updateOrderStatusDeliver(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    @Override
    public void UpdateOrderStatusRefund(int id) {
        try {
            this.deliveryRepo.updateOrderStatusRefund(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
    
}
