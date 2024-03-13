package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.User;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.UserServiceImpl;

public class VerifyOTPServlet extends HttpServlet {

    private static final long serialVersionUID = 2005666663030379941L;

    private UserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("registered");

        String first = request.getParameter("first");
        String second = request.getParameter("second");
        String third = request.getParameter("third");
        String fourth = request.getParameter("fourth");
        String fifth = request.getParameter("fifth");
        String sixth = request.getParameter("sixth");

        String otpString = first + second + third + fourth + fifth + sixth;

        try {
            int otp = Integer.parseInt(otpString);
            int otpValue = (int) request.getSession().getAttribute("user-code");

            if (otp == otpValue) {
                int registered = userService.InsertAccount(user);
                if (registered > 0) {
                    request.setAttribute("successMsg", "Register Successfully !!");
                    request.getRequestDispatcher("./views/login/Login.jsp").forward(request, response);
                } else {
                    request.setAttribute("failedMsg", "Register Failed !!");
                    request.getRequestDispatcher("./views/register/Register.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("OTPWrong", "OTP is invalid or OTP is wrong !!");
                request.getRequestDispatcher("./views/register/Verify.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            // Handle the case where the entered OTP is not a valid integer
            request.setAttribute("OTPWrong", "Invalid OTP format");
            request.getRequestDispatcher("./views/register/Verify.jsp").forward(request, response);
        }

    }

}
