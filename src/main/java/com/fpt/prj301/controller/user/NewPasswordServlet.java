package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.UserServiceImpl;

public class NewPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 6315786941573091637L;

    private UserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("forgot-email");

        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confirm-password");

        if (newPassword != null && confPassword != null && newPassword.equalsIgnoreCase(confPassword)) {
            int rowCount = userService.UpdatePassword(email, newPassword);
            if (rowCount > 0) {
                request.setAttribute("successMsg", "Your Password Was Reseted Successfully !!");
                request.getRequestDispatcher("./views/login/Login.jsp").forward(request, response);
            } else {
                request.setAttribute("failMsg", "Your Password Was Reseted Failed !!");
                request.getRequestDispatcher("./views/login/Login.jsp").forward(request, response);
            }
        }
    }

}
