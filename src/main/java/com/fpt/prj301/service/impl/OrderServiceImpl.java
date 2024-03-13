package com.fpt.prj301.service.impl;

import com.fpt.prj301.model.Order;
import com.fpt.prj301.repository.OrderRepository;
import com.fpt.prj301.service.OrderService;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepo = new OrderRepository();
    
    @Override
    public List<Order> GetAllOrder() {
        List<Order> list = new ArrayList<>();
        try {
            list = this.orderRepo.getAllOrder();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public Order GetOrderById(int id) {
        Order order = null;
        try {
            order = this.orderRepo.getOrderById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return order;
    }
    
    @Override
    public String GetStatusById(int id) {
        String status = null;
        try {
            status = this.orderRepo.getStatusById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return status;
    }

    @Override
    public List<Order> GetOrderByStatus(String status, int page) {
        List<Order> list = new ArrayList<>();
        try {
            list = this.orderRepo.getOrderByStatus(status, page);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public List<Order> GetAllOrderPending() {
        List<Order> list = new ArrayList<>();
        try {
            list = this.orderRepo.getAllOrderPending();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public List<Order> GetAllOrderShipping() {
        List<Order> list = new ArrayList<>();
        try {
            list = this.orderRepo.getAllOrderShipping();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public List<Order> GetAllOrderDelivered() {
        List<Order> list = new ArrayList<>();
        try {
            list = this.orderRepo.getAllOrderDelivered();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public List<Order> GetAllOrderRefund() {
        List<Order> list = new ArrayList<>();
        try {
            list = this.orderRepo.getAllOrderRefund();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }

    @Override
    public List<Order> UserOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            list = this.orderRepo.userOrders(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public List<Order> UserOrdersPending(int id) {
        List<Order> list = new ArrayList<>();
        try {
            list = this.orderRepo.userOrdersPending(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public List<Order> UserOrdersShipping(int id) {
        List<Order> list = new ArrayList<>();
        try {
            list = this.orderRepo.userOrdersShipping(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public List<Order> UserOrdersDelivered(int id) {
        List<Order> list = new ArrayList<>();
        try {
            list = this.orderRepo.userOrdersDelivered(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public List<Order> UserOrdersRefund(int id) {
        List<Order> list = new ArrayList<>();
        try {
            list = this.orderRepo.userOrdersRefund(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }

    @Override
    public String GetDateById(int id) {
        String date = null;
        try {
            date = this.orderRepo.getDateById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return date;
    }

    @Override
    public int GetAmountById(int id) {
        int amount = 0;
        try {
            amount = this.orderRepo.getAmountById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return amount;
    }
    
    @Override
    public int GetUidById(int id) {
        int uId = 0;
        try {
            uId = this.orderRepo.getUidById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return uId;
    }
    
    @Override
    public int CountOrder() {
        int count = 0;
        try {
            count = this.orderRepo.countOrder();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int CountOrderPagination(int uId) {
        int count = 0;
        try {
            count = this.orderRepo.countOrderPagination(uId);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }    

    @Override
    public int CountOrderStatus(String status) {
        int count = 0;
        try {
            count = this.orderRepo.countOrderStatus(status);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }
    
    @Override
    public int CountOrderStatusUser(int id, String status) {
        int count = 0;
        try {
            count = this.orderRepo.countOrderStatusUser(id, status);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int InsertOrder(Order order) {
        int insert = 0;
        try {
            insert = this.orderRepo.insertOrder(order);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return insert;
    }

    @Override
    public int GetOrderIdInserted() {
        int id = 0;
        try {
            id = this.orderRepo.getOrderIdInserted();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return id;
    }
    
    @Override
    public int GetDelivery(int id) {
        int delivery = 0;
        try {
            delivery = this.orderRepo.getDelivery(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return delivery;
    }
    
    @Override
    public int GetDiscount(int id) {
        int discount = 0;
        try {
            discount = this.orderRepo.getDiscount(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return discount;
    }
    
    @Override
    public int GetSumAmount() {
        int amount = 0;
        try {
            amount = this.orderRepo.getSumAmount();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return amount;
    }

    @Override
    public void CancelOrder(int id) {
        try {
            this.orderRepo.cancelOrder(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
    
    @Override
    public List<Integer> GetAmountByMonth() {
        List<Integer> data = new ArrayList<>();
        try {
            data = this.orderRepo.getAmountByMonth();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return data;
    }
    
    @Override
    public List<Integer> GetOrderCountByMonth() {
        List<Integer> data = new ArrayList<>();
        try {
            data = this.orderRepo.getOrderCountByMonth();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return data;
    }
}
