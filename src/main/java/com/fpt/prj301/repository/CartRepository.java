package com.fpt.prj301.repository;

import com.fpt.prj301.context.DBContext;
import com.fpt.prj301.model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartRepository {
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    static DBContext db = new DBContext();

    public int getTotalCartPrice(List<Cart> cartList) throws SQLException {
        int sum = 0;
        String query = "select price from products where id=?";
        try {
            if (cartList.size() > 0) {
                for (Cart cart : cartList) {
                    conn = db.getConnection();
                    pstm = conn.prepareStatement(query);
                    pstm.setInt(1, cart.getId());
                    rs = pstm.executeQuery();
                    while (rs.next()) {
                        sum += rs.getInt(1) * cart.getQuantity();
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return sum;
    }

    public List<Cart> getCartProducts(List<Cart> cartList) throws SQLException {
        List<Cart> carts = new ArrayList<>();
        String query = "select * from products where id=?";
        try {
            conn = db.getConnection();
            if (cartList.size() > 0) {
                for (Cart cart : cartList) {
                    pstm = conn.prepareStatement(query);
                    pstm.setInt(1, cart.getId());
                    rs = pstm.executeQuery();
                    while (rs.next()) {
                        Cart c = new Cart();
                        c.setId(rs.getInt(1));
                        c.setName(rs.getString(2));
                        c.setDescription(rs.getString(3));
                        c.setPrice(rs.getInt(4));
                        c.setColor(rs.getString(5));
                        c.setImage(rs.getString(7));
                        c.setRating(rs.getInt(8));
                        c.setQuantity(cart.getQuantity());
                        c.setSize(cart.getSize());
                        carts.add(c);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return carts;
    }
}
