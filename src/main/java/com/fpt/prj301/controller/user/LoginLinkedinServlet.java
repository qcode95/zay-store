package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpt.prj301.model.User;
import com.fpt.prj301.model.UserLinked;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.UserServiceImpl;
import com.fpt.prj301.util.linkedin.LinkedinPostUtil;

public class LoginLinkedinServlet extends HttpServlet {

    private static final long serialVersionUID = 5323177129824665214L;

    private UserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String code = request.getParameter("code");

        LinkedinPostUtil post = new LinkedinPostUtil();
        if (code == null || code.isEmpty()) {
            response.sendRedirect("./login");
        } else {
            try {
                UserLinked linkedProfile = post.sendPost(code);

                String name = linkedProfile.getFirstName() + linkedProfile.getLastName();

                User user = new User();
                user.setAddress("Quy Nhon");
                user.setAvatar("/files/avt_def.jpg");
                user.setEmail("test.account@gmail.com");
                user.setMobile(398973408);
                user.setName(name);
                user.setCode(0);
                user.setRole(0);

                userService.InsertAccount(user);
                session.setAttribute("account", user);
                response.sendRedirect("./home");

            } catch (Exception e) {
                System.out.println("Error" + e.getMessage());
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
