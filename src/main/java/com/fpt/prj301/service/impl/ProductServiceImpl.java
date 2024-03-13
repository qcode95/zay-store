package com.fpt.prj301.service.impl;

import com.fpt.prj301.model.Brand;
import com.fpt.prj301.model.Category;
import com.fpt.prj301.model.Product;
import com.fpt.prj301.repository.ProductRepository;
import com.fpt.prj301.service.ProductService;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProductServiceImpl implements ProductService {
    
    private final ProductRepository productRepo = new ProductRepository();
        
    @Override
    public List<Product> GetProduct(){
        List<Product> list = new ArrayList<>();
        try {
            list = this.productRepo.getProduct();
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public List<Product> GetProductHome() {
        List<Product> list = new ArrayList<>();
        try {
            list = this.productRepo.getProductHome();
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public Product GetProductById(int id) {
        Product product = new Product();
        try {
            product = this.productRepo.getProductById(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return product;
    }

    @Override
    public String GetNameProductById(int id) {
        String name = null;
        try {
            name = this.productRepo.getNameProductById(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return name;
    }

    @Override
    public String GetDescriptionProductById(int id) {
        String description = null;
        try {
            description = this.productRepo.getDescriptionProductById(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return description;
    }

    @Override
    public int GetPriceProductById(int id) {
        int price = 0;
        try {
            price = this.productRepo.getPriceProductById(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return price;
    }

    @Override
    public String GetColorProductById(int id) {
        String color = null;
        try {
            color = this.productRepo.getColorProductById(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return color;
    }

    @Override
    public int GetCategoryProductById(int id) {
        int category = 0;
        try {
            category = this.productRepo.getCategoryProductById(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return category;
    }

    @Override
    public String GetImageProductById(int id) {
        String image = null;
        try {
            image = this.productRepo.getImageProductById(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return image;
    }

    @Override
    public int GetRatingProductById(int id) {
        int rating = 0;
        try {
            rating = this.productRepo.getRatingProductById(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return rating;
    }

    @Override
    public int GetQuantityProductById(int id) {
        int quantity = 0;
        try {
            quantity = this.productRepo.getQuantityProductById(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return quantity;
    }

    @Override
    public List<Product> GetRelatedProduct(int cId) {
        List<Product> list = new ArrayList<>();
        try {
            list = this.productRepo.getRelatedProduct(cId);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public int InsertProduct(String name, String description, int price, String color, 
            int category, String image, int rating, int quantity, int brand) {
        int insert = 0;
        try {
            insert = this.productRepo.insertProduct(name, description, price, color, category, image, rating, quantity, brand);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return insert;
    }

    @Override
    public List<Product> SearchProductByName(String name) {
        List<Product> list = new ArrayList<>();
        try {
            list = this.productRepo.searchProductByName(name);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }
    
    @Override
    public List<Product> SearchProductByNamePagination(String name, int page) {
        List<Product> list = new ArrayList<>();
        try {
            list = this.productRepo.searchProductByNamePagination(name, page);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public int UpdateProduct(int id, String name, String description, int price, String color, 
            int category, String image, int rating, int quantity, int brand) {
        int update = 0;
        try {
            update = this.productRepo.updateProduct(id, name, description, price, color, category, image, rating, quantity, brand);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return update;
    }

    @Override
    public int UpdateNewQuantity(int id, int quantity) {
        int update = 0;
        try {
            update = this.productRepo.updateNewQuantity(id, quantity);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return update;
    }

    @Override
    public int CountProduct() {
        int count = 0;
        try {
            count = this.productRepo.countProduct();
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int CountProductByCategory(int id) {
        int count = 0;
        try {
            count = this.productRepo.countProductByCategory(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int CountProductByBrand(int id) {
        int count = 0;
        try {
            count = this.productRepo.countProductByBrand(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int CountProductByName(String name) {
        int count = 0;
        try {
            count = this.productRepo.countProductByName(name);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return count;
    }

    @Override
    public List<Product> PaginationProduct(int page) {
        List<Product> list = new ArrayList<>();
        try {
            list = this.productRepo.paginationProduct(page);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public List<Product> GetProductByCategory(int id, int page) {
        List<Product> list = new ArrayList<>();
        try {
            list = this.productRepo.getProductByCategory(id, page);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public List<Product> GetProductByBrand(int id, int page) {
        List<Product> list = new ArrayList<>();
        try {
            list = this.productRepo.getProductByBrand(id, page);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public List<Product> PaginationProductHome(int page) {
        List<Product> list = new ArrayList<>();
        try {
            list = this.productRepo.paginationProductHome(page);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public void DeleteProduct(int id) {
        try {
            this.productRepo.deleteProduct(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
    }

    @Override
    public List<Category> GetCategory() {
        List<Category> list = new ArrayList<>();
        try {
            list = this.productRepo.getCategory();
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public String GetCategoryName(int id) {
        String name = null;
        try {
            name = this.productRepo.getCategoryName(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return name;
    }

    @Override
    public List<Brand> GetBrand() {
        List<Brand> list = new ArrayList<>();
        try {
            list = this.productRepo.getBrand();
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public String GetBrandName(int id) {
        String name = null;
        try {
            name = this.productRepo.getBrandName(id);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return name;
    }
    
}
