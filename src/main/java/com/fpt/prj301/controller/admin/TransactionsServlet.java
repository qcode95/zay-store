package com.fpt.prj301.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Transaction;
import com.fpt.prj301.model.User;
import com.fpt.prj301.service.TransactionService;
import com.fpt.prj301.service.impl.TransactionServiceImpl;

public class TransactionsServlet extends HttpServlet {

    private static final long serialVersionUID = 8504560887181207978L;

    private TransactionService transactionService;

    @Override
    public void init() {
        transactionService = new TransactionServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        }

        List<Transaction> list = transactionService.GetAllTransaction();

        request.setAttribute("list", list);
        request.getRequestDispatcher("./views-admin/transaction/Transactions.jsp").forward(request, response);
    }
}
