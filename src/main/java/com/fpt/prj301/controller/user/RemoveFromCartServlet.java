package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Cart;

public class RemoveFromCartServlet extends HttpServlet {

	private static final long serialVersionUID = -8047113891021290117L;

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id != null) {
			ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("cartList");
			if (cartList != null) {
				for (Cart c : cartList) {
					if (c.getId() == Integer.parseInt(id)) {
						if (cartList.size() == 1) {
							cartList.remove(cartList.indexOf(c));
							request.getSession().setAttribute("cartList", null);
						} else {
							cartList.remove(cartList.indexOf(c));
							request.getSession().setAttribute("cartList", cartList);
						}
						break;
					}
				}
			}
			response.sendRedirect("./cart");
		} else {
			response.sendRedirect("./cart");
		}
	}
}
