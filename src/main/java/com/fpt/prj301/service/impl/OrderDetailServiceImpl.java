package com.fpt.prj301.service.impl;

import com.fpt.prj301.model.OrderDetail;
import com.fpt.prj301.repository.OrderDetailRepository;
import com.fpt.prj301.service.OrderDetailService;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailServiceImpl implements OrderDetailService {
    
    private final OrderDetailRepository orderDetailRepo = new OrderDetailRepository();
    
    @Override
    public List<OrderDetail> GetOrderDetailById(int id) {
        List<OrderDetail> list = new ArrayList<>();
        try {
            list = this.orderDetailRepo.getOrderDetailById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }

    @Override
    public int InsertOrderDetail(OrderDetail orderDetail) {
        int insert = 0;
        try {
            insert = this.orderDetailRepo.insertOrderDetail(orderDetail);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return insert;
    }

    @Override
    public int CountProductByOrderId(int id) {
        int count = 0;
        try {
            count = this.orderDetailRepo.countProductByOrderId(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int GetSumAmount(int id) {
        int sum = 0;
        try {
            sum = this.orderDetailRepo.getSumAmount(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return sum;
    }

    @Override
    public void CancelOrder(int id) {
        try {
            this.orderDetailRepo.cancelOrder(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
