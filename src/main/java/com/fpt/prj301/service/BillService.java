package com.fpt.prj301.service;

import com.fpt.prj301.model.Bill;

public interface BillService {
    
    public Bill GetBillByOid(int id);
    
    public int InsertBill(Bill bill);
}
