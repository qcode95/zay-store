package com.fpt.prj301.repository;

import com.fpt.prj301.context.DBContext;
import com.fpt.prj301.model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderRepository {

    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    static DBContext db = new DBContext();

    public List<Order> getAllOrder() throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "select * from orders";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public Order getOrderById(int id) throws SQLException {
        String query = "select * from orders where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                return order;
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return null;
    }

    public String getStatusById(int id) throws SQLException {
        String query = "select status from orders where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return null;
    }

    public List<Order> getOrderByStatus(String status, int page) throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "select * from orders where status = ? limit 5 offset ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, status);
            pstm.setInt(2, ((page - 1) * 5));
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Order> getAllOrderPending() throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "select * from orders where status like 'Pending'";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Order> getAllOrderShipping() throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "select * from orders where status like 'Shipping'";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Order> getAllOrderDelivered() throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "select * from orders where status like 'Delivered'";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Order> getAllOrderRefund() throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "select * from orders where status like 'Refund'";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Order> userOrders(int id) throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "select * from orders where u_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Order> userOrdersPending(int id) throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "select * from orders where u_id = ? and status like 'Pending'";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Order> userOrdersShipping(int id) throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "select * from orders where u_id = ? and status like 'Shipping'";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Order> userOrdersDelivered(int id) throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "select * from orders where u_id = ? and status like 'Delivered'";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Order> userOrdersRefund(int id) throws SQLException {
        List<Order> list = new ArrayList<>();
        String query = "select * from orders where u_id = ? and status like 'Refund'";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt(1));
                order.setUid(rs.getInt(2));
                order.setDate(rs.getString(3));
                order.setStatus(rs.getString(4));
                order.setAmount(rs.getInt(5));
                order.setDeliveryId(rs.getInt(6));
                order.setDiscountId(rs.getInt(7));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public String getDateById(int id) throws SQLException {
        String query = "select date from orders where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return null;
    }

    public int getAmountById(int id) throws SQLException {
        String query = "select amount from orders where id = ?";
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

    public int getUidById(int id) throws SQLException {
        String query = "select u_id from orders where id = ?";
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

    public int countOrderPagination(int uId) throws SQLException {
        String query = "select count(*) from orders where u_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, uId);
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

    public int countOrder() throws SQLException {
        String query = "select count(*) from orders";
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

    public int countOrderStatus(String status) throws SQLException {
        String query = "select count(*) from orders where status like ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, "%" + status + "%");
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

    public int countOrderStatusUser(int id, String status) throws SQLException {
        String query = "select count(*) from orders where u_id = ? and status like ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            pstm.setString(2, "%" + status + "%");
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

    public int insertOrder(Order order) throws SQLException {
        String query = "insert into orders (id, u_id, date, status, amount, de_id, di_id) values (?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, order.getOrderId());
            pstm.setInt(2, order.getUid());
            pstm.setString(3, order.getDate());
            pstm.setString(4, order.getStatus());
            pstm.setInt(5, order.getAmount());
            pstm.setInt(6, order.getDeliveryId());
            pstm.setInt(7, order.getDiscountId());
            int result = pstm.executeUpdate();
            return result;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        return 0;
    }

    public int getOrderIdInserted() throws SQLException {
        int id = 0;
        String query = "select id from orders order by id desc limit 1";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return id + 1;
    }

    public int getDelivery(int id) throws SQLException {
        String query = "select de_id from orders where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
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

    public int getDiscount(int id) throws SQLException {
        String query = "select di_id from orders where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
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
    
    public int getSumAmount() throws SQLException {
        String query = "select sum(amount) from orders";
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

    public void cancelOrder(int id) throws SQLException {
        String query = "delete from orders where id = ?";
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

    public List<Integer> getAmountByMonth() throws SQLException {
        List<Integer> data = new ArrayList<>();
        String query = "select date_format(date, '%Y-%m') as month, sum(amount) as totalAmount from orders group by month";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();

            Map<String, Integer> dataMap = new HashMap<>();
            for (int month = 0; month < 12; month++) {
                String monthString = String.format("%02d", month);
                dataMap.put(monthString, 0);
            }
            while (rs.next()) {
                String month = rs.getString("month");
                int totalAmount = rs.getInt("totalAmount");
                dataMap.put(month, totalAmount);
            }
            for (int month = 1; month <= 12; month++) {
                String monthString = String.format("%04d-%02d", 2023, month);
                data.add(dataMap.getOrDefault(monthString, 0));
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        } finally {
            db.closeConnection(conn);
            db.closeConnection(pstm);
        }
        return data;
    }

    public List<Integer> getOrderCountByMonth() throws SQLException {
        List<Integer> userData = new ArrayList<>();
        String query = "SELECT DATE_FORMAT(date, '%Y-%m') AS month, COUNT(id) AS orderNumbers FROM orders GROUP BY month";

        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();

            Map<String, Integer> userCountMap = new HashMap<>();
            for (int month = 0; month < 12; month++) {
                String monthString = String.format("%02d", month);
                userCountMap.put(monthString, 0);
            }

            while (rs.next()) {
                String month = rs.getString("month");
                int orderNumbers = rs.getInt("orderNumbers");

                userCountMap.put(month, orderNumbers);
            }

            for (int month = 1; month <= 12; month++) {
                String monthString = String.format("%04d-%02d", 2023, month);
                userData.add(userCountMap.getOrDefault(monthString, 0));
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        } finally {
            db.closeConnection(conn);
            db.closeConnection(pstm);
        }
        return userData;
    }

}
