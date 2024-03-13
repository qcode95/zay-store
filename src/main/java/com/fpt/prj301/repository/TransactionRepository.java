package com.fpt.prj301.repository;

import com.fpt.prj301.context.DBContext;
import com.fpt.prj301.model.Transaction;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TransactionRepository {
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    static DBContext db = new DBContext();
    
    public int insertTransaction(Transaction transaction) throws SQLException {
        String query = "insert into transactions (u_id, o_id, amount, date) values(?, ?, ?, ?)";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, transaction.getUid());
            pstm.setInt(2, transaction.getOid());
            pstm.setInt(3, transaction.getAmount());
            pstm.setString(4, transaction.getDate());
            int result = pstm.executeUpdate();
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        return 0;
    }
    
    public int countTransaction() throws SQLException {
        String query = "select count(*) from transactions";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return 0;
    }
        
    public List<Transaction> getAllTransaction() throws SQLException {
        List<Transaction> list = new ArrayList<>();
        String query = "select * from transactions";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt(1));
                transaction.setUid(rs.getInt(2));
                transaction.setOid(rs.getInt(3));
                transaction.setAmount(rs.getInt(4));
                transaction.setDate(rs.getString(5));
                list.add(transaction);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }
    
    public Transaction getTransactionByOrderId(int id) throws SQLException {
        String query = "select * from transactions where o_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt(1));
                transaction.setUid(rs.getInt(2));
                transaction.setOid(rs.getInt(3));
                transaction.setAmount(rs.getInt(4));
                transaction.setDate(rs.getString(5));
                return transaction;
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return null;
    }

    public void cancelTransaction(int id) throws SQLException {
        String query = "delete from transactions where o_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
    }
}
