package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Product;
import com.fpt.prj301.model.ProductSize;
import com.fpt.prj301.model.Review;
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.ProductSizeService;
import com.fpt.prj301.service.ReviewService;
import com.fpt.prj301.service.impl.ProductServiceImpl;
import com.fpt.prj301.service.impl.ProductSizeServiceImpl;
import com.fpt.prj301.service.impl.ReviewServiceImpl;

public class ShoppingServlet extends HttpServlet {

    private static final long serialVersionUID = 397926654189624502L;

    private ProductService productService;
    private ProductSizeService productSizeService;
    private ReviewService reviewService;

    @Override
    public void init() {
        productService = new ProductServiceImpl();
        productSizeService = new ProductSizeServiceImpl();
        reviewService = new ReviewServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.GetProductById(id);
        List<ProductSize> list = productSizeService.GetProductSizeByCategory(product.getCategory());
        List<Review> listReview = reviewService.GetAllReview(id);
        int count = reviewService.CountReviewProduct(id);
        int count5 = reviewService.CountReviewRating5(id);
        int count4 = reviewService.CountReviewRating4(id);
        int count3 = reviewService.CountReviewRating3(id);
        int count2 = reviewService.CountReviewRating2(id);
        int count1 = reviewService.CountReviewRating1(id);

        request.setAttribute("product", product);
        request.setAttribute("list", list);
        request.setAttribute("listR", listReview);
        request.setAttribute("count", count);
        request.setAttribute("count5", count5);
        request.setAttribute("count4", count4);
        request.setAttribute("count3", count3);
        request.setAttribute("count2", count2);
        request.setAttribute("count1", count1);
        request.getRequestDispatcher("./views/product-single/ProductSingle.jsp").forward(request, response);
    }
}
