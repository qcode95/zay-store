package com.fpt.prj301.repository;

import com.fpt.prj301.context.DBContext;
import com.fpt.prj301.model.ProductSize;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductSizeRepository {
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    static DBContext db = new DBContext();

    public List<ProductSize> getProductSizeByCategory(int cId) throws SQLException {
        List<ProductSize> list = new ArrayList<>();
        String query = "select * from product_size where c_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, cId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                ProductSize productSize = new ProductSize();
                productSize.setId(rs.getInt(1));
                productSize.setcId(rs.getInt(2));
                productSize.setName(rs.getString(3));
                productSize.setSize(rs.getInt(4));
                list.add(productSize);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }
}
