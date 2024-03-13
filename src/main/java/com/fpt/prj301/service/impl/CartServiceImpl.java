package com.fpt.prj301.service.impl;

import com.fpt.prj301.model.Cart;
import com.fpt.prj301.repository.CartRepository;
import com.fpt.prj301.service.CartService;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartServiceImpl implements CartService {
    
    private final CartRepository cartRepo = new CartRepository();

    @Override
    public int GetTotalCartPrice(List<Cart> cartList) {
        int total = 0;
        try {
            total = this.cartRepo.getTotalCartPrice(cartList);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return total;
    }

    @Override
    public List<Cart> GetCartProducts(List<Cart> cartList) {
        List<Cart> list = new ArrayList<>();
        try {
            list = this.cartRepo.getCartProducts(cartList);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
}
