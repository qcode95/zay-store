package com.fpt.prj301.repository;

import com.fpt.prj301.context.DBContext;
import com.fpt.prj301.model.Bill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BillRepository {
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    static DBContext db = new DBContext();
    
    public Bill getBillByOid(int id) throws SQLException {
        String query = "select * from bills where o_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setId(rs.getInt(1));
                bill.setOid(rs.getInt(2));
                bill.setName(rs.getString(3));
                bill.setEmail(rs.getString(4));
                bill.setMobile(rs.getInt(5));
                bill.setAddress(rs.getString(6));
                bill.setPostCode(rs.getInt(7));
                return bill;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return null;
    }    
    
    public int insertBill(Bill bill) throws SQLException {
        String query = "insert into bills(o_id, u_name, email, mobile, address, post_code) values (?, ?, ?, ?, ?, ?)";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, bill.getOid());
            pstm.setString(2, bill.getName());
            pstm.setString(3, bill.getEmail());
            pstm.setInt(4, bill.getMobile());
            pstm.setString(5, bill.getAddress());
            pstm.setInt(6, bill.getPostCode());
            int result = pstm.executeUpdate();
            return result;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return 0;
    }    
}
