package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpt.prj301.model.User;
import com.fpt.prj301.util.facebook.FacebookGraphUtil;
import com.fpt.prj301.util.facebook.FacebookUtil;

public class LoginFacebookServlet extends HttpServlet {

    private static final long serialVersionUID = 7425805630704274697L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            response.sendRedirect("./login");
        } else {
            FacebookUtil fbUtil = new FacebookUtil();
            String accessToken = fbUtil.getAccessToken(code);

            FacebookGraphUtil fbGraph = new FacebookGraphUtil(accessToken);
            String graph = fbGraph.getFBGraph();

            Map<String, String> fbProfileData = fbGraph.getGraphData(graph);

            User user = new User();
            user.setAddress("Quy Nhon");
            user.setAvatar("/files/avt_def.jpg");
            user.setEmail(fbProfileData.get("email"));
            user.setMobile(398973408);
            user.setName(fbProfileData.get("first_name"));
            user.setRole(0);

            session.setAttribute("account", user);
            response.sendRedirect("./home");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
