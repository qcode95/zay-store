package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.service.OrderDetailService;
import com.fpt.prj301.service.OrderService;
import com.fpt.prj301.service.TransactionService;
import com.fpt.prj301.service.impl.OrderDetailServiceImpl;
import com.fpt.prj301.service.impl.OrderServiceImpl;
import com.fpt.prj301.service.impl.TransactionServiceImpl;

public class CancelOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 6929653341883101095L;

    private OrderService orderService;
    private OrderDetailService orderDetailService;
    private TransactionService transactionService;

    @Override
    public void init() {
        orderService = new OrderServiceImpl();
        transactionService = new TransactionServiceImpl();
        orderDetailService = new OrderDetailServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null) {
            orderService.CancelOrder(Integer.parseInt(id));
            orderDetailService.CancelOrder(Integer.parseInt(id));
            transactionService.CancelTransaction(Integer.parseInt(id));
        }
        response.sendRedirect("./order-user");
    }
}
