package com.fpt.prj301.service.impl;

import com.fpt.prj301.model.ProductSize;
import com.fpt.prj301.repository.ProductSizeRepository;
import com.fpt.prj301.service.ProductSizeService;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductSizeServiceImpl implements ProductSizeService {
    
    private final ProductSizeRepository productSizeRepo = new ProductSizeRepository();

    @Override
    public List<ProductSize> GetProductSizeByCategory(int cId) {
        List<ProductSize> list = new ArrayList<>();
        try {
            list = this.productSizeRepo.getProductSizeByCategory(cId);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
}
