package com.farmstory.controller.market;

import java.io.IOException;

import com.farmstory.dto.ProductDto;
import com.farmstory.service.ProductService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/market/view.do")
public class ViewController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService productservice = ProductService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//int no = Integer.parseInt(req.getParameter("no"));
		//ProductDto ProductDto = productservice.selectProduct(no);
		//req.setAttribute("ProductDto", ProductDto);
		ProductDto ProductDto = new ProductDto();
		ProductDto.setProPrice(2000);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/market/view.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
