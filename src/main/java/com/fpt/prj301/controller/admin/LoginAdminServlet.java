package com.fpt.prj301.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpt.prj301.model.User;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.UserServiceImpl;

public class LoginAdminServlet extends HttpServlet {

    private static final long serialVersionUID = 2288147897370054087L;

    private UserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("account");
        if (user != null) {
            response.sendRedirect("./dashboard");
        } else {
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            request.getRequestDispatcher("./views-admin/login/Login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.LoginUser(new User(email, password));

        if (user != null && user.getRole() == 1) {
            session.setAttribute("account", user);
            response.sendRedirect("./dashboard");
        } else if (user != null && user.getRole() == 0) {
            response.sendRedirect("./login");
        } else {
            request.setAttribute("msg", "Wrong Email or Password !!");
            request.getRequestDispatcher("./views-admin/login/Login.jsp").forward(request, response);
        }
    }

}
