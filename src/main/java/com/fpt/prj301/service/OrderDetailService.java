package com.fpt.prj301.service;

import com.fpt.prj301.model.OrderDetail;
import java.util.List;

public interface OrderDetailService {
        
    public int InsertOrderDetail(OrderDetail orderDetail);
    
    public List<OrderDetail> GetOrderDetailById(int id);
    
    public int CountProductByOrderId(int id);
    
    public int GetSumAmount(int id);
    
    public void CancelOrder(int id);
}
