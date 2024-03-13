package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpt.prj301.model.User;
import com.fpt.prj301.model.UserGoogle;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.UserServiceImpl;
import com.fpt.prj301.util.google.GoogleUtil;

public class LoginGoogleServlet extends HttpServlet {

    private static final long serialVersionUID = 2605384135529891218L;

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

        if (code == null || code.isEmpty()) {
            response.sendRedirect("./login");
        } else {
            try {
                String accessToken = GoogleUtil.getToken(code);
                UserGoogle userGoogle = GoogleUtil.getUserInfo(accessToken);

                String email = userGoogle.getEmail();
                String name = userGoogle.getGiven_name();

                User check = userService.CheckAccount(email);
                if (check != null) {
                    userService.LoginUser(check);
                    session.setAttribute("account", check);
                    response.sendRedirect("./home");
                } else {
                    User user = new User();
                    user.setEmail(email);
                    user.setName(name);
                    user.setAvatar("/files/avt_def.jpg");
                    user.setMobile(398973408);
                    user.setAddress("Quy Nhon");
                    user.setPassword("123");
                    user.setCode(0);
                    user.setRole(0);

                    userService.InsertAccount(user);
                    session.setAttribute("account", user);
                    response.sendRedirect("./home");
                }
            } catch (Exception e) {
                System.out.println("Error: " + e.getMessage());
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
