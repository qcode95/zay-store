package com.fpt.prj301.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.service.CategoryService;
import com.fpt.prj301.service.impl.CategoryServiceImpl;

public class AddCategoryServlet extends HttpServlet {

	private static final long serialVersionUID = -171591651955874917L;

	private CategoryService categoryService;

	@Override
	public void init() {
		categoryService = new CategoryServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("p_title");

		categoryService.InsertCategory(name);
	}
}
