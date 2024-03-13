package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Product;
import com.fpt.prj301.model.User;
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.impl.ProductServiceImpl;

public class BuyNowServlet extends HttpServlet {

    private static final long serialVersionUID = -6902711760911971825L;

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Base entity
        User user = (User) request.getSession().getAttribute("account");

        // Check out
        if (user != null) {
            int productId = Integer.parseInt(request.getParameter("id"));
            int price = Integer.parseInt(request.getParameter("price"));
            int size = Integer.parseInt(request.getParameter("size"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            Product product = productService.GetProductById(productId);
            int pQuantity = product.getQuantity();

            if (quantity > pQuantity) {
                quantity = pQuantity;
            }
            int total = (price * quantity) + 5;

            request.setAttribute("productId", productId);
            request.setAttribute("total", total);
            request.setAttribute("size", size);
            request.setAttribute("quantity", quantity);
            request.getRequestDispatcher("./views/check-out/CheckOutBuyNow.jsp").forward(request, response);
        } else {
            response.sendRedirect("./login");
        }
    }

}
