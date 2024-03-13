package com.fpt.prj301.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.service.OrderService;
import com.fpt.prj301.service.impl.OrderServiceImpl;
import com.google.gson.Gson;

public class ChartDataServlet extends HttpServlet {

	private static final long serialVersionUID = 766439212479421432L;

	private OrderService orderService;

	@Override
	public void init() {
		orderService = new OrderServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Integer> amountData = orderService.GetAmountByMonth();

		String jsonData = new Gson().toJson(amountData);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonData);
	}
}
