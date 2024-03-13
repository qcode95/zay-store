package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Bill;
import com.fpt.prj301.model.Cart;
import com.fpt.prj301.model.Order;
import com.fpt.prj301.model.OrderDetail;
import com.fpt.prj301.model.Product;
import com.fpt.prj301.model.Transaction;
import com.fpt.prj301.model.User;
import com.fpt.prj301.service.BillService;
import com.fpt.prj301.service.OrderDetailService;
import com.fpt.prj301.service.OrderService;
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.TransactionService;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.BillServiceImpl;
import com.fpt.prj301.service.impl.OrderDetailServiceImpl;
import com.fpt.prj301.service.impl.OrderServiceImpl;
import com.fpt.prj301.service.impl.ProductServiceImpl;
import com.fpt.prj301.service.impl.TransactionServiceImpl;
import com.fpt.prj301.service.impl.UserServiceImpl;

public class CheckOutServlet extends HttpServlet {

	private static final long serialVersionUID = -3541474264896436731L;

	private ProductService productService;
	private OrderService orderService;
	private OrderDetailService orderDetailService;
	private TransactionService transactionService;
	private BillService billService;
	private UserService userService;

	@Override
	public void init() {
		productService = new ProductServiceImpl();
		orderService = new OrderServiceImpl();
		transactionService = new TransactionServiceImpl();
		orderDetailService = new OrderDetailServiceImpl();
		billService = new BillServiceImpl();
		userService = new UserServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) request.getSession().getAttribute("account");
		if (user == null) {
			response.sendRedirect("./login");
		} else {
			int total = Integer.parseInt(request.getParameter("total"));
			String[] sizes = request.getParameterValues("sizes");
			request.setAttribute("total", total);
			request.setAttribute("sizes", sizes);
			request.getRequestDispatcher("./views/check-out/CheckOut.jsp").forward(request, response);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// Base entity
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		Date date = new Date();
		ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("cartList");
		User user = (User) request.getSession().getAttribute("account");
		// End Base entity

		// Transaction entity
		int total = Integer.parseInt(request.getParameter("total"));
		String sizesParam = request.getParameter("sizes");
		String[] sizes = URLDecoder.decode(sizesParam, "UTF-8").split(",");

		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String name = firstName + lastName;

		String province = request.getParameter("province");
		String district = request.getParameter("district");
		String ward = request.getParameter("ward");
		String street = request.getParameter("street");
		String address = street + ", " + ward + ", " + district + ", " + province;

		int postCode = Integer.parseInt(request.getParameter("post-code"));
		int mobile = Integer.parseInt(request.getParameter("phone"));
		String email = request.getParameter("email");

		int delivery = Integer.parseInt(request.getParameter("delivery"));
		int code = Integer.parseInt(request.getParameter("code"));
		// End Transaction entity

		if (delivery != 1 && delivery != 2) {
			delivery = 1;
		}
                if (code == 1){
                    userService.UpdateDiscount(user.getId());
                }

		if (cartList != null) {

			Order order = new Order();
			order.setOrderId(orderService.GetOrderIdInserted());
			order.setUid(user.getId());
			order.setDate(formatter.format(date));
			order.setAmount(total);
			order.setStatus("Pending");
			order.setDeliveryId(delivery);
			order.setDiscountId(code);

			OrderDetail orderDetail = new OrderDetail();
			int orderDetailInsert = 0;
			int productUpdate = 0;
			for (int i = 0; i < cartList.size(); i++) {
				Cart c = cartList.get(i);
				orderDetail.setOrderId(order.getOrderId());
				orderDetail.setProductId(c.getId());
				orderDetail.setQuantity(c.getQuantity());
				orderDetail.setAmount(c.getPrice() * c.getQuantity());
				orderDetail.setSize(Integer.parseInt(sizes[i]));
				orderDetailInsert = orderDetailService.InsertOrderDetail(orderDetail);

				Product product = productService.GetProductById(c.getId());
				int quantity = product.getQuantity();
				int cQuantity = c.getQuantity();
				if (cQuantity > quantity) {
					cQuantity = quantity;
				}
				productUpdate = productService.UpdateNewQuantity(c.getId(), (quantity - cQuantity));
			}

			Transaction transaction = new Transaction();
			transaction.setUid(user.getId());
			transaction.setOid(order.getOrderId());
			transaction.setAmount(total);
			transaction.setDate(formatter.format(date));

			Bill bill = new Bill();
			bill.setOid(order.getOrderId());
			bill.setName(name);
			bill.setEmail(email);
			bill.setMobile(mobile);
			bill.setAddress(address);
			bill.setPostCode(postCode);

			int billInsert = billService.InsertBill(bill);
			int transactionInsert = transactionService.InsertTransaction(transaction);
			int orderInsert = orderService.InsertOrder(order);

			if (orderInsert == 0 || orderDetailInsert == 0 || transactionInsert == 0 || productUpdate == 0
					|| billInsert == 0) {
				return;
			}
			cartList.clear();
			response.sendRedirect("./order-user");
		} else {
			request.setAttribute("msg", "Your cart is empty so you can not check out !!");
			request.getRequestDispatcher("./views/cart/Cart.jsp").forward(request, response);
		}
	}

}
