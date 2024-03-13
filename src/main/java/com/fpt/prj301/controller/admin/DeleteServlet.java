package com.fpt.prj301.controller.admin;

import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.impl.ProductServiceImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteServlet extends HttpServlet {

    private static final long serialVersionUID = 7331396665195437037L;

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        productService.DeleteProduct(id);

        response.sendRedirect("./products?page=1");
    }
}
