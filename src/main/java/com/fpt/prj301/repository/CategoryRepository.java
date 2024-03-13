package com.fpt.prj301.repository;

import com.fpt.prj301.context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CategoryRepository {
    
    Connection conn = null;
    PreparedStatement pstm = null;
    static DBContext db = new DBContext();
    
    public void insertCategory(String name) throws SQLException {
        String query = "insert into categories (name) values (?)";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, name);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
    }
}
