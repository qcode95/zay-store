package com.fpt.prj301.service;

import com.fpt.prj301.model.Transaction;
import java.util.List;

public interface TransactionService {
   
    public int InsertTransaction(Transaction transaction);
            
    public List<Transaction> GetAllTransaction();
    
    public Transaction GetTransactionByOrderId(int id);
    
    public int CountTransaction();    

    public void CancelTransaction(int id);
    
}
