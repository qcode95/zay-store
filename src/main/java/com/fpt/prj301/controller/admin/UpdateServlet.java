package com.fpt.prj301.controller.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.fpt.prj301.model.Product;
import com.fpt.prj301.model.User;
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.impl.ProductServiceImpl;

@MultipartConfig()
public class UpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 5060385507281317299L;

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

        Product product = productService.GetProductById(id);

        request.setAttribute("product", product);
        request.getRequestDispatcher("./views-admin/update/Update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        }

        // Set Tiếng Việt
        request.setCharacterEncoding("UTF-8");

        // Take input from URL
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.GetProductById(id);
        String imageInsert = product.getImage();
        
        // Take input from form jsp
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
        String color = request.getParameter("color");
        int category = Integer.parseInt(request.getParameter("category"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int brand = Integer.parseInt(request.getParameter("brand"));

        if (category == 0) {
            category = 1;
        }
        if (brand == 0) {
            brand = 1;
        }

        Part imagePart = request.getPart("image");

        if (imagePart.getSize() > 0) {
            // Upload file
            String folderUpload = "/files";
            String pathUploadFolder = request.getServletContext().getRealPath(folderUpload);
            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(pathUploadFolder))) {
                Files.createDirectories(Paths.get(pathUploadFolder));
            }
            String urlImage = pathUploadFolder + "/" + fileName;
            imagePart.write(urlImage);

            imageInsert = folderUpload + "/" + fileName;
        }
        int result = productService.UpdateProduct(id, name, description, price, color, category, imageInsert, rating, quantity, brand);
            if (result > 0) {
                response.sendRedirect("./products?page=1");
                return;
            }
            response.sendRedirect("./products?page=1");
    }
}
