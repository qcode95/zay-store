package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Order;
import com.fpt.prj301.model.User;
import com.fpt.prj301.service.OrderService;
import com.fpt.prj301.service.impl.OrderServiceImpl;

public class OrderRefundServlet extends HttpServlet {

    private static final long serialVersionUID = 5856143041930376980L;

    private OrderService orderService;

    @Override
    public void init() {
        orderService = new OrderServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        } else {
            List<Order> list = orderService.UserOrdersRefund(user.getId());
            int countPending = orderService.CountOrderStatusUser(user.getId(), "Pending");
            int countShipping = orderService.CountOrderStatusUser(user.getId(), "Shipping");
            int countDelivered = orderService.CountOrderStatusUser(user.getId(), "Delivered");
            int countRefund = orderService.CountOrderStatusUser(user.getId(), "Refund");

            request.setAttribute("list", list);
            request.setAttribute("countPending", countPending);
            request.setAttribute("countShipping", countShipping);
            request.setAttribute("countDelivered", countDelivered);
            request.setAttribute("countRefund", countRefund);
            request.getRequestDispatcher("./views/order/OrderRefund.jsp").forward(request, response);
        }
    }
}
