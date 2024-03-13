package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Bill;
import com.fpt.prj301.model.OrderDetail;
import com.fpt.prj301.model.Transaction;
import com.fpt.prj301.model.User;
import com.fpt.prj301.service.BillService;
import com.fpt.prj301.service.OrderDetailService;
import com.fpt.prj301.service.OrderService;
import com.fpt.prj301.service.TransactionService;
import com.fpt.prj301.service.impl.BillServiceImpl;
import com.fpt.prj301.service.impl.OrderDetailServiceImpl;
import com.fpt.prj301.service.impl.OrderServiceImpl;
import com.fpt.prj301.service.impl.TransactionServiceImpl;

public class OrderDetailUserServlet extends HttpServlet {

    private static final long serialVersionUID = 6623781271346373067L;

    private OrderService orderService;
    private OrderDetailService orderDetailService;
    private TransactionService transactionService;
    private BillService billService;

    @Override
    public void init() {
        orderService = new OrderServiceImpl();
        orderDetailService = new OrderDetailServiceImpl();
        transactionService = new TransactionServiceImpl();
        billService = new BillServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        }

        int id = Integer.parseInt(request.getParameter("id"));

        List<OrderDetail> list = orderDetailService.GetOrderDetailById(id);
        int count = orderDetailService.CountProductByOrderId(id);

        String date = orderService.GetDateById(id);
        int amount = orderService.GetAmountById(id);

        int delivery = orderService.GetDelivery(id);
        int discount = orderService.GetDiscount(id);

        Transaction transaction = transactionService.GetTransactionByOrderId(id);
        Bill bill = billService.GetBillByOid(id);

        request.setAttribute("list", list);
        request.setAttribute("id", id);
        request.setAttribute("date", date);
        request.setAttribute("amount", amount);
        request.setAttribute("count", count);
        request.setAttribute("delivery", delivery);
        request.setAttribute("discount", discount);
        request.setAttribute("transaction", transaction);
        request.setAttribute("bill", bill);
        request.getRequestDispatcher("./views/order-detail/OrderDetail.jsp").forward(request, response);
    }
}
