package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Order;
import com.fpt.prj301.model.User;
import com.fpt.prj301.service.DeliveryService;
import com.fpt.prj301.service.OrderService;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.DeliveryServiceImpl;
import com.fpt.prj301.service.impl.OrderServiceImpl;
import com.fpt.prj301.service.impl.UserServiceImpl;
import com.fpt.prj301.util.mail.MailMessage;

public class RefundServlet extends HttpServlet {

    private static final long serialVersionUID = 5994918583068895286L;

    private DeliveryService deliveryService;
    private OrderService orderService;
    private UserService userService;

    @Override
    public void init() {
        deliveryService = new DeliveryServiceImpl();
        orderService = new OrderServiceImpl();
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        int uId = orderService.GetUidById(id);
        Order order = orderService.GetOrderById(id);
        User user = userService.GetUserById(uId);

        MailMessage.refundSuccess(user, order);

        deliveryService.UpdateOrderStatusRefund(id);
        response.sendRedirect("./order-user");
    }

}
