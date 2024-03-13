package com.fpt.prj301.service.impl;

import com.fpt.prj301.model.Bill;
import com.fpt.prj301.repository.BillRepository;
import com.fpt.prj301.service.BillService;
import java.sql.SQLException;

public class BillServiceImpl implements BillService {
    
    private final BillRepository billRepo = new BillRepository();
    
    @Override
    public Bill GetBillByOid(int id) {
        Bill bill = null;
        try {
            bill = this.billRepo.getBillByOid(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return bill;
    }
    
    @Override
    public int InsertBill(Bill bill) {
        int insert = 0;
        try {
            insert = this.billRepo.insertBill(bill);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return insert;
    }
    
}
