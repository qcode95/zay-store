package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VerifyTempPassServlet extends HttpServlet {

    private static final long serialVersionUID = 2601581645309401625L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String tempPass = request.getParameter("temp-pass");
        String tempPassValue = (String) session.getAttribute("temp-pass");

        if (tempPass.equalsIgnoreCase(tempPassValue)) {
            request.setAttribute("successMsg", "Verify Successfull !!");
            request.getRequestDispatcher("./views/forgot-password/NewPassword.jsp").forward(request, response);
        } else {
            request.setAttribute("passWrong", "Temporary Password is Wrong or Invalid !!");
            request.getRequestDispatcher("./views/forgot-password/ForgotVerify.jsp").forward(request, response);
        }
    }
}
