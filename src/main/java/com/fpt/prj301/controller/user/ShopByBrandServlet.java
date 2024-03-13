package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Brand;
import com.fpt.prj301.model.Category;
import com.fpt.prj301.model.Product;
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.impl.ProductServiceImpl;

public class ShopByBrandServlet extends HttpServlet {

    private static final long serialVersionUID = -1678520854937367038L;

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("bid"));
        int page = Integer.parseInt(request.getParameter("page"));
        if (page == 0) {
            page = 1;
        }

        int count = productService.CountProductByCategory(id);
        int endPage = count / 9;
        if (count % 9 != 0) {
            endPage++;
        }

        List<Product> listProduct = productService.GetProductByBrand(id, page);
        List<Category> listCategory = productService.GetCategory();
        List<Brand> listBrand = productService.GetBrand();

        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listBrand", listBrand);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", page);
        request.setAttribute("id", id);

        request.getRequestDispatcher("./views/shop/ShopBrand.jsp").forward(request, response);

    }
}
