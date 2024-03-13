package com.fpt.prj301.service.impl;

import com.fpt.prj301.repository.BrandRepository;
import com.fpt.prj301.service.BrandService;
import java.sql.SQLException;

public class BrandServiceImpl implements BrandService {
    
    private final BrandRepository brandRepo = new BrandRepository();

    @Override
    public void InsertBrand(String name) {
        try {
            this.brandRepo.insertBrand(name);
        } catch (SQLException e) {
            System.out.println("Error: "+e.getMessage());
        }
    }
    
}
