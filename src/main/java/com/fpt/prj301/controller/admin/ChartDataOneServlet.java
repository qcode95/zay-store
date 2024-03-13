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

public class ChartDataOneServlet extends HttpServlet {

	private static final long serialVersionUID = -8130630231427923505L;

	private OrderService orderService;

	@Override
	public void init() {
		orderService = new OrderServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Integer> data = orderService.GetOrderCountByMonth();

		String jsonData = new Gson().toJson(data);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonData);
	}
}
