package com.fpt.prj301.service;

import com.fpt.prj301.model.Order;
import java.util.List;

public interface OrderService {

    public List<Order> GetAllOrder();
    
    public Order GetOrderById(int id);
    
    public String GetStatusById(int id);
        
    public List<Order> GetOrderByStatus(String status, int page);
    
    public List<Order> GetAllOrderPending();
    
    public List<Order> GetAllOrderShipping();
    
    public List<Order> GetAllOrderDelivered();
    
    public List<Order> GetAllOrderRefund();

    public List<Order> UserOrders(int id);
    
    public List<Order> UserOrdersPending(int id);
    
    public List<Order> UserOrdersShipping(int id);
    
    public List<Order> UserOrdersDelivered(int id);
    
    public List<Order> UserOrdersRefund(int id);
    
    public String GetDateById(int id);
    
    public int GetAmountById(int id);
    
    public int GetUidById(int id);

    public int CountOrderPagination(int uId);
    
    public int CountOrder();

    public int CountOrderStatus(String status);
    
    public int CountOrderStatusUser(int id, String status);

    public int InsertOrder(Order order);
    
    public int GetOrderIdInserted();
    
    public int GetDelivery(int id);
    
    public int GetDiscount(int id);
    
    public int GetSumAmount();
    
    public void CancelOrder(int id);
    
    public List<Integer> GetAmountByMonth();
    
    public List<Integer> GetOrderCountByMonth();
}
