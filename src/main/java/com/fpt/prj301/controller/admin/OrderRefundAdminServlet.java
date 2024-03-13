package com.fpt.prj301.controller.admin;

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

public class OrderRefundAdminServlet extends HttpServlet {

    private static final long serialVersionUID = -5038532532055545398L;

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
        }

        List<Order> list = orderService.GetAllOrderRefund();
        int countPending = orderService.CountOrderStatus("Pending");
        int countShipping = orderService.CountOrderStatus("Shipping");
        int countDelivered = orderService.CountOrderStatus("Delivered");
        int countRefund = orderService.CountOrderStatus("Refund");

        request.setAttribute("list", list);
        request.setAttribute("countPending", countPending);
        request.setAttribute("countShipping", countShipping);
        request.setAttribute("countDelivered", countDelivered);
        request.setAttribute("countRefund", countRefund);
        request.getRequestDispatcher("./views-admin/orders/OrdersRefund.jsp").forward(request, response);
    }
}
