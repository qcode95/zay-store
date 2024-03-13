package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpt.prj301.model.Cart;
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.impl.ProductServiceImpl;

public class AddToCartSingleServlet extends HttpServlet {

	private static final long serialVersionUID = 3952880799200194729L;

	private ProductService productService;

	@Override
	public void init() {
		productService = new ProductServiceImpl();
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");

		ArrayList<Cart> carts = new ArrayList<>();
		HttpSession session = request.getSession();                

		int id = Integer.parseInt(request.getParameter("id"));
		int size = Integer.parseInt(request.getParameter("size"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
                
		Cart c = new Cart();
                int pQuantity = productService.GetQuantityProductById(id);
                
                if(quantity > pQuantity){
                    quantity = pQuantity;
                }                    
		c.setId(id);
		c.setQuantity(quantity);
		c.setPrice(productService.GetPriceProductById(id));
		c.setSize(size);

		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
		if (cartList == null) {
			carts.add(c);
			session.setAttribute("cartList", carts);
			response.sendRedirect("./shopping?id=" + id);
		} else {
			carts = cartList;

			boolean exist = false;
			for (Cart cart : cartList) {
				if (cart.getId() == id) {
					if (cart.getSize() == size) {
						cart.setQuantity(cart.getQuantity() + 1);
						session.setAttribute("cartList", cartList);
						response.sendRedirect("./shopping?id=" + id);
						exist = true;
					}
				}
			}

			if (!exist) {
				carts.add(c);
				session.setAttribute("cartList", cartList);
				response.sendRedirect("./shopping?id=" + id);
			}
		}
	}
}
