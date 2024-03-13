package com.fpt.prj301.repository;

import com.fpt.prj301.context.DBContext;
import com.fpt.prj301.model.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailRepository {
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    static DBContext db = new DBContext();
    
    public int insertOrderDetail(OrderDetail orderDetail) throws SQLException {
        String query = "insert into order_detail (o_id, p_id, quantity, amount, size) values(?, ?, ?, ?, ?)";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, orderDetail.getOrderId());
            pstm.setInt(2, orderDetail.getProductId());
            pstm.setInt(3, orderDetail.getQuantity());
            pstm.setInt(4, orderDetail.getAmount());
            pstm.setInt(5, orderDetail.getSize());
            int result = pstm.executeUpdate();
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        return 0;
    }
    
    public List<OrderDetail> getOrderDetailById(int id) throws SQLException {
        List<OrderDetail> list = new ArrayList<>();
        String query = "select * from order_detail where o_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setId(rs.getInt(1));
                orderDetail.setOrderId(rs.getInt(2));
                orderDetail.setProductId(rs.getInt(3));
                orderDetail.setQuantity(rs.getInt(4));
                orderDetail.setAmount(rs.getInt(5));
                orderDetail.setSize(rs.getInt(6));
                list.add(orderDetail);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }    
    
    public int countProductByOrderId(int id) throws SQLException {
        String query = "select count(p_id) from order_detail where o_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return 0;
    }
    
    public int getSumAmount(int id) throws SQLException {
        String query = "select sum(amount) from order_detail where o_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return 0;
    }    
    
    public void cancelOrder(int id) throws SQLException {
        String query = "delete from order_detail where o_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            pstm.execute();
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
    }
}
