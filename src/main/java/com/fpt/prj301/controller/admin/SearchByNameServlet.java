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
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.impl.ProductServiceImpl;

public class SearchByNameServlet extends HttpServlet {

    private static final long serialVersionUID = -1846913167681567631L;

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("search");
        int page = Integer.parseInt(request.getParameter("page"));

        if (page == 0) {
            page = 1;
        }

        List<Product> list = productService.SearchProductByNamePagination(name, page);
        List<Category> listCategory = productService.GetCategory();
        List<Brand> listBrand = productService.GetBrand();
        int count = productService.CountProductByName(name);

        int endPage = count / 9;
        int pageCount = count / 9;
        int start = ((page * 9) - 8);
        int end = (page * 9);
        if (count % 9 != 0) {
            endPage++;
            pageCount++;
        }

        request.setAttribute("list", list);
        request.setAttribute("listC", listCategory);
        request.setAttribute("listB", listBrand);
        request.setAttribute("endP", endPage);
        request.setAttribute("pageCount", pageCount);
        request.setAttribute("count", count);
        request.setAttribute("tag", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("txtS", name);

        request.getRequestDispatcher("./views-admin/products/ProductByName.jsp").forward(request, response);
    }

}
