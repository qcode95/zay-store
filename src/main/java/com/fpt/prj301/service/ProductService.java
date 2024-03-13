package com.fpt.prj301.service;

import com.fpt.prj301.model.Brand;
import com.fpt.prj301.model.Category;
import com.fpt.prj301.model.Product;
import java.util.List;

public interface ProductService {

    public List<Product> GetProduct();
    
    public List<Product> GetProductHome();

    public Product GetProductById(int id);

    public String GetNameProductById(int id);

    public String GetDescriptionProductById(int id);

    public int GetPriceProductById(int id);

    public String GetColorProductById(int id);

    public int GetCategoryProductById(int id);

    public String GetImageProductById(int id);
    
    public int GetRatingProductById(int id);
    
    public int GetQuantityProductById(int id);
    
    public List<Product> GetRelatedProduct(int cId);
    
    public int InsertProduct(String name, String description, int price, 
            String color, int category, String image, int rating, int quantity, int brand);
        
    public List<Product> SearchProductByName(String name);
    
    public List<Product> SearchProductByNamePagination(String name, int page);
        
    public int UpdateProduct(int id, String name, String description, int price, 
            String color, int category, String image, int rating, int quantity, int brand);
    
    public int UpdateNewQuantity(int id, int quantity);
    
    public int CountProduct();

    public int CountProductByCategory(int id);
    
    public int CountProductByBrand(int id);

    public int CountProductByName(String name);
    
    public List<Product> PaginationProduct(int page);
    
    public List<Product> GetProductByCategory(int id, int page);
    
    public List<Product> GetProductByBrand(int id, int page);

    public List<Product> PaginationProductHome(int page);
    
    public void DeleteProduct(int id);

    public List<Category> GetCategory();

    public String GetCategoryName(int id);
    
    public List<Brand> GetBrand();
    
    public String GetBrandName(int id);

}
