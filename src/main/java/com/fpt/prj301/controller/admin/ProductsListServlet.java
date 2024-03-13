package com.fpt.prj301.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Product;
import com.fpt.prj301.model.User;
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.impl.ProductServiceImpl;

public class ProductsListServlet extends HttpServlet {

    private static final long serialVersionUID = 1003917667968610608L;

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        }

        List<Product> list = productService.GetProduct();

        request.setAttribute("list", list);
        request.getRequestDispatcher("./views-admin/products/ProductList.jsp").forward(request, response);
    }

}
