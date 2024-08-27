package com.farmstory.controller.market;

import java.io.IOException;

import com.farmstory.dto.ProductDto;
import com.farmstory.service.ProductService;
import com.farmstory.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/market/order.do")
public class OrderController extends HttpServlet{

	private static final long serialVersionUID = -5384513430322205886L;
	UserService userservice = UserService.INSTANCE;
	ProductService productservice = ProductService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String quantity = req.getParameter("quantity");
		String proNo = req.getParameter("proNo");
		ProductDto prodto = productservice.selectProduct(Integer.parseInt(proNo));
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
