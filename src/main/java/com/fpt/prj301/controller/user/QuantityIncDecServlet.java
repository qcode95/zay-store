package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpt.prj301.model.Cart;

public class QuantityIncDecServlet extends HttpServlet {

    private static final long serialVersionUID = -5215827345900656605L;

    @SuppressWarnings("unchecked")
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");

        if (action != null && id >= 1) {
            if (action.equals("inc")) {
                for (Cart c : cartList) {
                    if (c.getId() == id) {
                        int quantity = c.getQuantity();
                        quantity++;
                        c.setQuantity(quantity);
                        response.sendRedirect("./cart");
                    }
                }
            }

            if (action.equals("dec")) {
                for (Cart c : cartList) {
                    if (c.getId() == id && c.getQuantity() > 1) {
                        int quantity = c.getQuantity();
                        quantity--;
                        c.setQuantity(quantity);
                        break;
                    }
                }
                response.sendRedirect("./cart");
            }
        } else {
            response.sendRedirect("./cart");
        }
    }

}
