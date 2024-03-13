package com.fpt.prj301.repository;

import com.fpt.prj301.context.DBContext;
import com.fpt.prj301.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;

public class UserRepository {
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    static DBContext db = new DBContext();

    public List<User> getAllUser() throws SQLException {
        List<User> list = new ArrayList<>();
        String query = "select * from users where role = 0";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setEmail(rs.getString(2));
                user.setName(rs.getString(3));
                user.setAvatar(rs.getString(4));
                user.setMobile(rs.getInt(5));
                user.setAddress(rs.getString(6));
                user.setCode(rs.getInt(8));
                user.setRole(rs.getInt(9));
                user.setDiscountId(rs.getInt(10));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public int countUser() throws SQLException {
        String query = "select count(*) from users where role = 0";
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

    public User loginUser(User user) throws SQLException {
        String query = "select * from users\n"
                + "where email = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, user.getEmail());

            rs = pstm.executeQuery();
            while (rs.next()) {
                if (BCrypt.checkpw(user.getPassword(), rs.getString(7))) {
                    return new User(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getInt(8),
                            rs.getInt(9),
                            rs.getInt(10));
                }
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return null;
    }
    
    public User getUserById(int id) throws SQLException {
        String query = "select * from users\n"
                + "where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);

            rs = pstm.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getInt(8),
                            rs.getInt(9),
                            rs.getInt(10));
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return null;
    }

    public String getEmailById(int id) throws SQLException {
        String name = null;
        String query = "select email from users\n"
                + "where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return name;
    }
    
    public String getNameById(int id) throws SQLException {
        String name = null;
        String query = "select name from users\n"
                + "where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return name;
    }
    
    public String getAvatarById(int id) throws SQLException {
        String avatar = null;
        String query = "select avatar from users\n"
                + "where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                avatar = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return avatar;
    }
    
    public String getMobileById(int id) throws SQLException {
        String avatar = null;
        String query = "select mobile from users\n"
                + "where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                avatar = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return avatar;
    }
    
    public String getAddressById(int id) throws SQLException {
        String avatar = null;
        String query = "select address from users\n"
                + "where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                avatar = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return avatar;
    }

    public int insertAccount(User user) throws SQLException {
        String query = "insert into users (email, name, avatar, mobile, address, password, code, role, di_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String hashPass = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, user.getEmail());
            pstm.setString(2, user.getName());
            pstm.setString(3, user.getAvatar());
            pstm.setInt(4, user.getMobile());
            pstm.setString(5, user.getAddress());
            pstm.setString(6, hashPass);
            pstm.setInt(7, user.getCode());
            pstm.setInt(8, user.getRole());
            pstm.setInt(9, user.getDiscountId());

            int rowInserted = pstm.executeUpdate();
            return rowInserted;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        return 0;
    }

    public User checkAccount(String email) throws SQLException {
        String query = "select * from users\n"
                + "where email = ?\n";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, email);

            rs = pstm.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getInt(8),
                            rs.getInt(9),
                            rs.getInt(10));
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return null;
    }

    public int UpdateUser(int id, String email, String name, int mobile, String address) throws SQLException {
        String query = "update users set email = ?, name = ?, mobile = ?, address = ? where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, email);
            pstm.setString(2, name);
            pstm.setInt(3, mobile);
            pstm.setString(4, address);
            pstm.setInt(5, id);

            int rowsUpdated = pstm.executeUpdate();
            return rowsUpdated;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return 0;
    }

    public int UpdatePassword(String email, String password) throws SQLException {
        String query = "update users set password = ? where email = ?";
        String hashPass = BCrypt.hashpw(password, BCrypt.gensalt(12));
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, hashPass);
            pstm.setString(2, email);

            int rowsUpdated = pstm.executeUpdate();
            return rowsUpdated;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return 0;
    }
    
    public int UpdateInformation(String email, String name, String avatar, int phone, int id) throws SQLException {
        String query = "update users set email = ?, name = ?, avatar = ?, mobile = ? where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, email);
            pstm.setString(2, name);
            pstm.setString(3, avatar);
            pstm.setInt(4, phone);
            pstm.setInt(5, id);

            int rowsUpdated = pstm.executeUpdate();
            return rowsUpdated;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return 0;
    }
    
    public int UpdateDiscount(int id) throws SQLException {
        String query = "update users set di_id = 1 where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);

            int rowsUpdated = pstm.executeUpdate();
            return rowsUpdated;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return 0;
    }
}
