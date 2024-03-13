package com.fpt.prj301.service.impl;

import com.fpt.prj301.model.Transaction;
import com.fpt.prj301.repository.TransactionRepository;
import com.fpt.prj301.service.TransactionService;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TransactionServiceImpl implements TransactionService {
    
    private final TransactionRepository transactionRepo = new TransactionRepository();

    @Override
    public int InsertTransaction(Transaction transaction) {
        int insert = 0;
        try {
            insert = this.transactionRepo.insertTransaction(transaction);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return insert;
    }

    @Override
    public List<Transaction> GetAllTransaction() {
        List<Transaction> list = new ArrayList<>();
        try {
            list = this.transactionRepo.getAllTransaction();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }

    @Override
    public Transaction GetTransactionByOrderId(int id) {
        Transaction transaction = new Transaction();
        try {
            transaction = this.transactionRepo.getTransactionByOrderId(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return transaction;
    }

    @Override
    public int CountTransaction() {
        int count = 0;
        try {
            count = this.transactionRepo.countTransaction();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    @Override
    public void CancelTransaction(int id) {
        try {
            this.transactionRepo.cancelTransaction(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
    
}
