package com.fpt.prj301.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Product;
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.impl.ProductServiceImpl;

public class SearchProductServlet extends HttpServlet {

    private static final long serialVersionUID = -8594307655139302798L;

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("txt");

        List<Product> list = productService.SearchProductByName(name);

        try (PrintWriter out = response.getWriter()) {
            for (Product product : list) {
                out.println("<div class=\"col-xxl-4 col-lg-6 col-md-6 col-12\">\n"
                        + "<!-- Single Product -->\n"
                        + "<div class=\"sherah-product-card sherah-product-card__v2  sherah-default-bg sherah-border mg-top-30\">\n"
                        + "<!-- Card Image -->\n"
                        + "<div class=\"sherah-product-card__img\">\n"
                        + "<img src=\"." + product.getImage() + "\" style=\"width: 400px; height: 350px; border-radius: 5px\">\n"
                        + "<div class=\"sherah-product-card__buttons\">\n"
                        + "<a class=\"sherah-product-card__buttons--single sherah-default-bg sherah-border\"\n"
                        + "href=\"update?id=" + product.getId() + "\">\n"
                        + "<svg class=\"sherah-default__fill\" xmlns=\"http://www.w3.org/2000/svg\" width=\"18\" height=\"20\" viewBox=\"0 0 18 20\">\n"
                        + "<g id=\"Com\" transform=\"translate(-0.268 0)\">\n"
                        + "<path id=\"Path_527\" data-name=\"Path 527\" d=\"M7.895.663a4.9,4.9,0,0,1-.024.662c-.012,0-.206.035-.425.082A8.8,8.8,0,0,0,.334,8.8,9.839,9.839,0,0,0,.45,11.808a8.86,8.86,0,0,0,3.875,5.507l.226.14.56-.413a6.464,6.464,0,0,0,.56-.436.953.953,0,0,0-.218-.136,7.762,7.762,0,0,1-1.934-1.524,7.446,7.446,0,0,1-1.878-3.917,9.631,9.631,0,0,1,0-2.085,7.5,7.5,0,0,1,1.116-2.95A7.776,7.776,0,0,1,5.751,3.352a8.609,8.609,0,0,1,2.017-.678l.127-.023V3.2a3.624,3.624,0,0,0,.02.546c.04,0,2.521-1.843,2.521-1.871S7.954,0,7.915,0A5.311,5.311,0,0,0,7.895.663Z\" transform=\"translate(0 0)\"/>\n"
                        + "<path id=\"Path_528\" data-name=\"Path 528\" d=\"M13.219,2.958a3.6,3.6,0,0,0-.54.44,1.467,1.467,0,0,0,.27.168,7.818,7.818,0,0,1,2.918,2.95,7.809,7.809,0,0,1,.842,2.615,8.959,8.959,0,0,1-.1,2.362,7.546,7.546,0,0,1-4.848,5.514,10.126,10.126,0,0,1-1.275.343c-.044,0-.056-.1-.056-.546a3.622,3.622,0,0,0-.02-.546c-.04,0-2.521,1.843-2.521,1.871S10.376,20,10.416,20a5.307,5.307,0,0,0,.02-.662v-.659l.151-.023a14,14,0,0,0,1.755-.468A8.765,8.765,0,0,0,18,11.154a9.922,9.922,0,0,0-.119-2.962,8.86,8.86,0,0,0-3.875-5.507l-.226-.14Z\" transform=\"translate(0.206)\"/>\n"
                        + "</g>\n"
                        + "</svg>\n"
                        + "</a>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "<!-- Card Content -->\n"
                        + "<div class=\"sherah-product-card__content sherah-dflex-column sherah-flex-gap-5\">\n"
                        + "<h4 class=\"sherah-product-card__title\">\n"
                        + "<a href=\"#\" class=\"sherah-pcolor\">" + product.getName() + "</a>\n"
                        + "</h4>\n"
                        + "<div class=\"sherah-product__bottom\">\n"
                        + "<div class=\"sherah-product__bottom--single\">\n"
                        + "<h5 class=\"sherah-product-card__price\">$" + product.getPrice() + "</h5>\n"
                        + "<div class=\"sherah-product-card__meta sherah-dflex sherah-flex-gap-30\">\n"
                        + "<div class=\"sherah-product-card__rating sherah-dflex sherah-flex-gap-5\">\n"
                );

                for (int i = 1; i <= product.getRating(); i++) {

                    out.println("<span class=\"sherah-color4\"><i class=\"fa fa-star\"></i></span>");

                }

                for (int i = 1; i <= 5 - product.getRating(); i++) {

                    out.println("<span class=\"sherah-color4\"><i class=\"fa-regular fa-star\"></i></span>");

                }
                out.println("</div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "<a href=\"delete?id=" + product.getId() + "\" class=\"sherah-btn default\">Delete</a>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "</div>\n"
                        + "<!-- End Single Product -->\n"
                        + "</div>"
                );
            }
        }
    }

}
