package com.fpt.prj301.service.impl;

import com.fpt.prj301.repository.CategoryRepository;
import com.fpt.prj301.service.CategoryService;
import java.sql.SQLException;

public class CategoryServiceImpl implements CategoryService {
    
    private final CategoryRepository cateRepo = new CategoryRepository();

    @Override
    public void InsertCategory(String name) {
        try {
            this.cateRepo.insertCategory(name);
        } catch (SQLException e) {
            System.out.println("Error: "+e.getMessage());
        }
    }
}
