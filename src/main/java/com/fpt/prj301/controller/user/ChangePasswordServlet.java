package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import com.fpt.prj301.model.User;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.UserServiceImpl;

public class ChangePasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 7455105484977306201L;

    private UserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("account");

        String email = request.getParameter("email");
        String oldPassword = request.getParameter("old-password");
        String newPassword = request.getParameter("new-password");
        String reNewPassword = request.getParameter("re-new-password");

        if (!BCrypt.checkpw(oldPassword, user.getPassword())) {
            request.setAttribute("wrongMsg", "Old Password not correct !!");
            request.getRequestDispatcher("./views/profile/Profile.jsp").forward(request, response);
        } else {
            if (newPassword != null && reNewPassword != null && newPassword.equalsIgnoreCase(reNewPassword)) {

                int rowCount = userService.UpdatePassword(email, newPassword);

                if (rowCount > 0) {
                    request.setAttribute("successMsg", "Your Password Was Changed Successfully !!");
                    request.getSession().removeAttribute("account");
                    request.getRequestDispatcher("./views/login/Login.jsp").forward(request, response);
                } else {
                    request.setAttribute("failedMsg", "Your Password Was Reseted Failed !!");
                    request.getRequestDispatcher("./views/profile/Profile.jsp").forward(request, response);
                }
            }
        }
    }

}
