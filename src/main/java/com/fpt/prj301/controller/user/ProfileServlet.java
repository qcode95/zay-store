package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.User;

public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 5059762017762105845L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        } else {
            request.getRequestDispatcher("./views/profile/Profile.jsp").forward(request, response);
        }
    }
}
