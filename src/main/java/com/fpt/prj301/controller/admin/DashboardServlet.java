package com.fpt.prj301.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.User;
import com.fpt.prj301.service.OrderService;
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.TransactionService;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.OrderServiceImpl;
import com.fpt.prj301.service.impl.ProductServiceImpl;
import com.fpt.prj301.service.impl.TransactionServiceImpl;
import com.fpt.prj301.service.impl.UserServiceImpl;

public class DashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 2391215945233306994L;

    private ProductService productService;
    private OrderService orderService;
    private TransactionService transactionService;
    private UserService userService;

    @Override
    public void init() {
        productService = new ProductServiceImpl();
        orderService = new OrderServiceImpl();
        transactionService = new TransactionServiceImpl();
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login-admin");
        } else {
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            int countProduct = productService.CountProduct();
            int countOrder = orderService.CountOrder();
            int countTransaction = transactionService.CountTransaction();
            int countUser = userService.CountUser();

            int sumAmount = orderService.GetSumAmount();

            request.setAttribute("countProduct", countProduct);
            request.setAttribute("countUser", countUser);
            request.setAttribute("countOrder", countOrder);
            request.setAttribute("countTransaction", countTransaction);
            request.setAttribute("sumAmount", sumAmount);

            request.getRequestDispatcher("./views-admin/dashboard/Dashboard.jsp").forward(request, response);
        }
    }
}
