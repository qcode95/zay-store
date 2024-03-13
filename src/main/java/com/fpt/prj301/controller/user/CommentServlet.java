package com.fpt.prj301.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.User;
import com.fpt.prj301.service.ReviewService;
import com.fpt.prj301.service.impl.ReviewServiceImpl;

public class CommentServlet extends HttpServlet {

    private static final long serialVersionUID = -8893392312713899776L;

    private ReviewService reviewService;

    @Override
    public void init() {
        reviewService = new ReviewServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        User user = (User) request.getSession().getAttribute("account");
        if (user == null) {
            response.sendRedirect("./login");
        } else {
            String comment = request.getParameter("comment");
            int id = Integer.parseInt(request.getParameter("id"));
            int rating = Integer.parseInt(request.getParameter("rating"));

            int reviewInsert = reviewService.InsertReview(user.getId(), id, comment, rating);
            if (reviewInsert == 0) {
                response.sendRedirect("./shopping?id=" + id);
                return;
            }
            response.sendRedirect("./shopping?id=" + id);
        }
    }

}
