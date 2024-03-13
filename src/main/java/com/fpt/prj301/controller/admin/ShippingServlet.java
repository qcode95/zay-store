package com.fpt.prj301.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.User;
import com.fpt.prj301.service.DeliveryService;
import com.fpt.prj301.service.OrderService;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.DeliveryServiceImpl;
import com.fpt.prj301.service.impl.OrderServiceImpl;
import com.fpt.prj301.service.impl.UserServiceImpl;
import com.fpt.prj301.util.mail.MailMessage;

public class ShippingServlet extends HttpServlet {

    private static final long serialVersionUID = -4850018976172716912L;

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
        User user = userService.GetUserById(uId);

        MailMessage.shippingSuccess(user);

        deliveryService.UpdateOrderStatusShip(id);
        response.sendRedirect("./orders");
    }

}
