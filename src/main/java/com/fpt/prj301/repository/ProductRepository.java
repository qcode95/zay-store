package com.fpt.prj301.repository;

import com.fpt.prj301.context.DBContext;
import com.fpt.prj301.model.Brand;
import com.fpt.prj301.model.Category;
import com.fpt.prj301.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository {

    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    static DBContext db = new DBContext();

    public List<Product> getProduct() throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "select * from products";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getInt(4));
                product.setColor(rs.getString(5));
                product.setCategory(rs.getInt(6));
                product.setImage(rs.getString(7));
                product.setRating(rs.getInt(8));
                product.setQuantity(rs.getInt(9));
                product.setBrand(rs.getInt(10));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Product> getProductHome() throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "select * from products order by id desc limit 8";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getInt(4));
                product.setColor(rs.getString(5));
                product.setCategory(rs.getInt(6));
                product.setImage(rs.getString(7));
                product.setRating(rs.getInt(8));
                product.setQuantity(rs.getInt(9));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public Product getProductById(int id) throws SQLException {
        String query = "select * from products where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getInt(4));
                product.setColor(rs.getString(5));
                product.setCategory(rs.getInt(6));
                product.setImage(rs.getString(7));
                product.setRating(rs.getInt(8));
                product.setQuantity(rs.getInt(9));
                return product;
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return null;
    }

    public String getNameProductById(int id) throws SQLException {
        String name = null;
        String query = "select name from products where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return name;
    }

    public String getDescriptionProductById(int id) throws SQLException {
        String description = null;
        String query = "select description from products where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                description = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return description;
    }

    public int getPriceProductById(int id) throws SQLException {
        int price = 0;
        String query = "select price from products where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                price = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return price;
    }

    public String getColorProductById(int id) throws SQLException {
        String color = null;
        String query = "select color from products where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                color = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return color;
    }

    public int getCategoryProductById(int id) throws SQLException {
        int category = 0;
        String query = "select c_id from products where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                category = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return category;
    }

    public String getImageProductById(int id) throws SQLException {
        String image = null;
        String query = "select image from products where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                image = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return image;
    }

    public int getRatingProductById(int id) throws SQLException {
        int rating = 0;
        String query = "select rating from products where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                rating = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return rating;
    }

    public int getQuantityProductById(int id) throws SQLException {
        int quantity = 0;
        String query = "select quantity from products where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                quantity = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return quantity;
    }

    public List<Product> getRelatedProduct(int cId) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "select * from products where c_id = ? limit 3";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, cId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getInt(4));
                product.setColor(rs.getString(5));
                product.setImage(rs.getString(7));
                product.setRating(rs.getInt(8));
                product.setQuantity(rs.getInt(9));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public int insertProduct(String name, String description, int price,
            String color, int category, String image, int rating, int quantity, int brand) throws SQLException {

        String query = "insert into products (name, description, price, color, c_id, image, rating, quantity, b_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, name);
            pstm.setString(2, description);
            pstm.setInt(3, price);
            pstm.setString(4, color);
            pstm.setInt(5, category);
            pstm.setString(6, image);
            pstm.setInt(7, rating);
            pstm.setInt(8, quantity);
            pstm.setInt(9, brand);

            int rowInserted = pstm.executeUpdate();
            return rowInserted;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        return 0;
    }

    public List<Product> searchProductByName(String name) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "select * from products\n"
                + "where name like ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, "%" + name + "%");
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getInt(4));
                product.setColor(rs.getString(5));
                product.setCategory(rs.getInt(6));
                product.setImage(rs.getString(7));
                product.setRating(rs.getInt(8));
                product.setQuantity(rs.getInt(9));
                product.setBrand(rs.getInt(10));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Product> searchProductByNamePagination(String name, int page) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "select * from products\n"
                + "where name like ?\n"
                + "limit 9 offset ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, "%" + name + "%");
            pstm.setInt(2, ((page - 1) * 9));
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getInt(4));
                product.setColor(rs.getString(5));
                product.setCategory(rs.getInt(6));
                product.setImage(rs.getString(7));
                product.setRating(rs.getInt(8));
                product.setQuantity(rs.getInt(9));
                product.setBrand(rs.getInt(10));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public int updateProduct(int id, String name, String description, int price,
            String color, int category, String image, int rating, int quantity, int brand) throws SQLException {
        String query = "update products set name = ?, description = ?, price = ?, color = ?, c_id = ?, image = ?, rating = ?, quantity = ?, b_id = ? \n"
                + "where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            // Thiết lập các tham số trong truy vấn
            pstm.setString(1, name);
            pstm.setString(2, description);
            pstm.setInt(3, price);
            pstm.setString(4, color);
            pstm.setInt(5, category);
            pstm.setString(6, image);
            pstm.setInt(7, rating);
            pstm.setInt(8, quantity);
            pstm.setInt(9, brand);
            pstm.setInt(10, id);

            // Thực hiện update
            int rowsUpdated = pstm.executeUpdate();
            return rowsUpdated;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        return 0;
    }

    public int updateNewQuantity(int id, int quantity) throws SQLException {
        String query = "update products set quantity = ? where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, quantity);
            pstm.setInt(2, id);
            int rowUpdated = pstm.executeUpdate();
            return rowUpdated;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        return 0;
    }

    public int countProduct() throws SQLException {
        String query = "select count(*) from products";
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

    public int countProductByCategory(int id) throws SQLException {
        String query = "select count(*) from products where c_id = ?";
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

    public int countProductByBrand(int id) throws SQLException {
        String query = "select count(*) from products where b_id = ?";
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

    public int countProductByName(String name) throws SQLException {
        String query = "select count(*) from products\n"
                + "where name like ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, "%" + name + "%");
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

    public List<Product> paginationProduct(int page) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "select * from products\n"
                + "order by id\n"
                + "limit 9 offset ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, ((page - 1) * 9));
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getInt(4));
                product.setColor(rs.getString(5));
                product.setCategory(rs.getInt(6));
                product.setImage(rs.getString(7));
                product.setRating(rs.getInt(8));
                product.setQuantity(rs.getInt(9));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Product> getProductByCategory(int id, int page) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "select * from products where c_id = ? limit 9 offset ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            pstm.setInt(2, (((page - 1) * 9)));
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getInt(4));
                product.setColor(rs.getString(5));
                product.setCategory(rs.getInt(6));
                product.setImage(rs.getString(7));
                product.setRating(rs.getInt(8));
                product.setQuantity(rs.getInt(9));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Product> getProductByBrand(int id, int page) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "select * from products where b_id = ? limit 9 offset ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            pstm.setInt(2, (((page - 1) * 9)));
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getInt(4));
                product.setColor(rs.getString(5));
                product.setCategory(rs.getInt(6));
                product.setImage(rs.getString(7));
                product.setRating(rs.getInt(8));
                product.setQuantity(rs.getInt(9));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public List<Product> paginationProductHome(int page) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "select * from products\n"
                + "order by id\n"
                + "limit 9 offset ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, ((page - 1) * 9));
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getInt(4));
                product.setColor(rs.getString(5));
                product.setCategory(rs.getInt(6));
                product.setImage(rs.getString(7));
                product.setRating(rs.getInt(8));
                product.setQuantity(rs.getInt(9));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public void deleteProduct(int id) throws SQLException {
        String query = "delete from products where id = ?";
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
    }

    public List<Category> getCategory() throws SQLException {
        List<Category> list = new ArrayList<>();
        String query = "select * from categories";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt(1));
                category.setName(rs.getString(2));
                list.add(category);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public String getCategoryName(int id) throws SQLException {
        String query = "select name from categories where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return null;
    }

    public List<Brand> getBrand() throws SQLException {
        List<Brand> list = new ArrayList<>();
        String query = "select * from brands";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand();
                brand.setId(rs.getInt(1));
                brand.setName(rs.getString(2));
                list.add(brand);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return list;
    }

    public String getBrandName(int id) throws SQLException {
        String query = "select name from brands where id = ?";
        try {
            conn = db.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        db.closeConnection(conn);
        db.closeConnection(pstm);
        db.closeConnection(rs);
        return null;
    }
}
