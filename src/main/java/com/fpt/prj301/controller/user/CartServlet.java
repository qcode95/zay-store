package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpt.prj301.model.Cart;

public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 4037466398908009590L;

    @SuppressWarnings("unchecked")
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Cart> list = (List<Cart>) session.getAttribute("cartList");
        if (list == null) {
            request.getRequestDispatcher("./views/cart/CartEmpty.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("./views/cart/Cart.jsp").forward(request, response);
        }
    }

}
