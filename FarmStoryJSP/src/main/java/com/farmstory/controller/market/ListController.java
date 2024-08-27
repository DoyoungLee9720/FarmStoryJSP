package com.farmstory.controller.market;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.PageGroupDto;
import com.farmstory.dto.ProductDto;
import com.farmstory.service.ProductService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/market/list.do")
public class ListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private ProductService service = ProductService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pg = req.getParameter("pg");
		String proNo = req.getParameter("proNo");
		
		int currentPage = service.getCurrentPage(pg);
		
		PageGroupDto pageGroup = service.getCurrentPageGroup(currentPage);
		
		int total = service.selectCountTotal();
		
		int lastPageNum = service.getLastPageNum(total);
		
		int start = service.getStartNum(currentPage);
		
		List<ProductDto> products = new ArrayList<>();
		int PageStartNo = total - (currentPage - 1) * 10;
		for(ProductDto product : products) {
			product.setStartNo(PageStartNo --);
		}
				
				
		req.setAttribute("products", products);
		req.setAttribute("lastPageNum", lastPageNum );
		req.setAttribute("pageGroup", pageGroup);
		req.setAttribute("currentPage", currentPage);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/market/list.jsp");
		dispatcher.forward(req, resp);
	}

}
