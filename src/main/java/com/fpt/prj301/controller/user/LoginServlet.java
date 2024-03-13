package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpt.prj301.model.User;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.UserServiceImpl;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = -4439222265612671221L;

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
            response.sendRedirect("./home");
        } else {
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            request.getRequestDispatcher("./views/login/Login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        Cookie erem = new Cookie("email", email);
        Cookie prem = new Cookie("password", password);
        if (remember != null) {
            erem.setMaxAge(60 * 60 * 24 * 7);
            prem.setMaxAge(60 * 60 * 24 * 7);
        } else {
            erem.setMaxAge(0);
            prem.setMaxAge(0);
        }
        response.addCookie(erem);
        response.addCookie(prem);

        User user = userService.LoginUser(new User(email, password));

        if (user != null) {
            if (user.getRole() == 1) {
                session.setAttribute("account", user);
                response.sendRedirect("./login-admin");
            } else {
                session.setAttribute("account", user);
                response.sendRedirect("./home");
            }
        } else {
            request.setAttribute("msg", "Wrong Email or Password !!");
            request.getRequestDispatcher("./views/login/Login.jsp").forward(request, response);
        }
    }

}
