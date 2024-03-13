package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.UserServiceImpl;
import com.fpt.prj301.util.mail.JavaMailUtil;
import com.fpt.prj301.util.mail.MailMessage;

public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 8061670948278246706L;

    private UserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./views/forgot-password/ForgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        HttpSession session = request.getSession();

        if (userService.CheckAccount(email) != null) {

            String tempPassValue = new JavaMailUtil().randomAlphaNumeric(8);

            MailMessage.forgetVerifySuccess(email, tempPassValue);

            int start = Math.min(4, email.length());
            int end = Math.max(10, email.length() - 10);

            String maskEmail = maskString(email, start, end);

            request.setAttribute("maskedEmail", maskEmail);
            request.getRequestDispatcher("./views/forgot-password/ForgotVerify.jsp").forward(request, response);
            session.setAttribute("temp-pass", tempPassValue);
            session.setAttribute("forgot-email", email);
            session.setMaxInactiveInterval(5 * 60);
        } else {
            request.setAttribute("msg", "Email not exist !");
            request.getRequestDispatcher("./views/forgot-password/ForgotPassword.jsp").forward(request, response);
        }
    }

    private String maskString(String str, int start, int end) {
        if (str == null || str.isEmpty()) {
            return str;
        }

        StringBuilder maskedString = new StringBuilder(str);
        for (int i = start; i < end; i++) {
            maskedString.setCharAt(i, '*');
        }

        return maskedString.toString();
    }

}
