package com.fpt.prj301.repository;

import com.fpt.prj301.context.DBContext;
import com.fpt.prj301.model.Review;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReviewRepository {
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    static DBContext db = new DBContext();

    public List<Review> getAllReview(int id) throws SQLException {
        List<Review> list = new ArrayList<>();
        String query = "select * from reviews where p_id = ? limit 8";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){
                Review review = new Review();
                review.setId(rs.getInt(1));
                review.setUid(rs.getInt(2));
                review.setPid(rs.getInt(3));
                review.setComment(rs.getString(4));
                review.setRating(rs.getInt(5));
                list.add(review);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        return list;
    }
    
    public int countReviewProduct(int id) throws SQLException {
        String query = "select count(*) from reviews where p_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        return 0;
    }
    public int countReviewRating5(int id) throws SQLException {
        String query = "select count(*) from reviews where rating = 5 and p_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        return 0;
    }
    public int countReviewRating4(int id) throws SQLException {
        String query = "select count(*) from reviews where rating = 4 and p_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        return 0;
    }
    public int countReviewRating3(int id) throws SQLException {
        String query = "select count(*) from reviews where rating = 3 and p_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        return 0;
    }
    
    public int countReviewRating2(int id) throws SQLException {
        String query = "select count(*) from reviews where rating = 2 and p_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        return 0;
    }
    
    public int countReviewRating1(int id) throws SQLException {
        String query = "select count(*) from reviews where rating = 1 and p_id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        return 0;
    }

    public int insertReview(int uId, int pId, String text, int rating) throws SQLException {
        String query = "insert into reviews(u_id, p_id, comment, rating) values (?, ?, ?, ?)";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, uId);
            pstm.setInt(2, pId);
            pstm.setString(3, text);
            pstm.setInt(4, rating);
            int rowInsert = pstm.executeUpdate();
            return rowInsert;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        return 0;
    }
}
