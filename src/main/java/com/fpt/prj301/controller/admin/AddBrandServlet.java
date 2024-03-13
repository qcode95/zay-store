package com.fpt.prj301.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.service.BrandService;
import com.fpt.prj301.service.impl.BrandServiceImpl;

public class AddBrandServlet extends HttpServlet {

	private static final long serialVersionUID = 6899942179581704319L;

	private BrandService brandService;

	@Override
	public void init() {
		brandService = new BrandServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("p_title");

		brandService.InsertBrand(name);
	}
}
