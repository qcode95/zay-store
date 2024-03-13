package com.fpt.prj301.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Brand;
import com.fpt.prj301.model.Category;
import com.fpt.prj301.model.Product;
import com.fpt.prj301.model.User;
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.impl.ProductServiceImpl;

public class ProductsByCategoryServlet extends HttpServlet {

    private static final long serialVersionUID = -7496933177797940077L;

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

        int id = Integer.parseInt(request.getParameter("id"));
        int page = Integer.parseInt(request.getParameter("page"));

        int count = productService.CountProductByCategory(id);
        int endPage = count / 9;
        int start = ((page * 9) - 8);
        int end = (page * 9);
        if (count % 9 != 0) {
            endPage++;
        }

        List<Product> list = productService.GetProductByCategory(id, page);
        List<Category> listCategory = productService.GetCategory();
        List<Brand> listBrand = productService.GetBrand();

        request.setAttribute("list", list);
        request.setAttribute("listC", listCategory);
        request.setAttribute("listB", listBrand);
        request.setAttribute("endP", endPage);
        request.setAttribute("count", count);
        request.setAttribute("tag", page);
        request.setAttribute("id", id);
        request.setAttribute("start", start);
        request.setAttribute("end", end);

        request.getRequestDispatcher("./views-admin/products/ProductsByCategory.jsp").forward(request, response);
    }
}
