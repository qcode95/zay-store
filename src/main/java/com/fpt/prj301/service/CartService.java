package com.fpt.prj301.service;

import com.fpt.prj301.model.Cart;
import java.util.List;

public interface CartService {

    public int GetTotalCartPrice(List<Cart> cartList);

    public List<Cart> GetCartProducts(List<Cart> cartList);
    
}
