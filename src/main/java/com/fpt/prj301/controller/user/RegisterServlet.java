package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpt.prj301.model.User;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.UserServiceImpl;
import com.fpt.prj301.util.mail.JavaMailUtil;
import com.fpt.prj301.util.mail.MailMessage;
import com.fpt.prj301.util.verify.VerifyUtil;

public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 56928767784003387L;

    private UserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./views/register/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int mobile = Integer.parseInt(request.getParameter("mobile"));
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("re-pass");

        JavaMailUtil sm = new JavaMailUtil();
        String codeString = sm.getRandom();
        int code = Integer.parseInt(codeString);

        if (!password.equals(confirmPassword)) {
            request.setAttribute("failedMsg", "Password and Confirm Password must to be similar !!");
            request.getRequestDispatcher("./views/register/Register.jsp").forward(request, response);
        } else {
            boolean valid;
            String captcha = request.getParameter("g-recaptcha-response");
            System.out.println("gRecaptchaResponse=" + captcha);
            valid = VerifyUtil.verify(captcha);

            if (!valid) {
                request.setAttribute("captchaMsg", "Captcha Invalid !!");
                request.getRequestDispatcher("./views/register/Register.jsp").forward(request, response);
            } else {
                User user = new User();
                user.setEmail(email);
                user.setName(name);
                user.setAvatar("/files/avt_def.jpg");
                user.setMobile(mobile);
                user.setAddress(address);
                user.setPassword(password);
                user.setCode(code);
                user.setRole(0);
                user.setDiscountId(2);

                User check = userService.CheckAccount(user.getEmail());
                if (check != null) {
                    request.setAttribute("failedMsg", "Email Already Exist !!");
                    request.getRequestDispatcher("./views/register/Register.jsp").forward(request, response);
                } else {

                    MailMessage.registrationSuccess(user);

                    session.setAttribute("user-code", user.getCode());
                    session.setAttribute("registered", user);
                    session.setMaxInactiveInterval(5 * 60); //session will be killed after 5 min

                    request.getRequestDispatcher("./views/register/Verify.jsp").forward(request, response);
                }
            }
        }
    }
}
