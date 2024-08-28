package com.farmstory.controller.mainIndex;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.ArticleDto;
import com.farmstory.dto.PageGroupDto;
import com.farmstory.dto.ProductDto;
import com.farmstory.service.ArticleService;
import com.farmstory.service.ProductService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/index.do")
public class IndexController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private ArticleService articleService = ArticleService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pg = req.getParameter("pg");
		String cate = req.getParameter("cate");
		
		// 현재 페이지 그룹 구하기
		int currentPage = service.getCurrentPage(pg);
		// 현재 페이지 그룹 구하기
		PageGroupDto pageGroup = service.getCurrentPageGroup(currentPage);
		// 전체 계시물 겟수 구하기
		int total = service.selectCountTotal();
		// 마지막 페이지 번호 구하기
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 시작번호 구하기
		int start = service.getStartNum(currentPage);
		
		List<ProductDto> products = service.selectProducts(start);
		List<ArticleDto> articles = articleService.selectArticles(start,cate);
		logger.info("Number of articles retrieved: " + articles.size());
		for (ArticleDto article : articles) {
		    logger.info("Article: " + article.toString());
		}
		
		int limit = 6;
		if(products.size() > limit) {
			products = products.subList(0, limit);
		}
		int limi = 5;
		if(articles.size() > limi) {
			articles = articles.subList(0, limi);
		}
		
		
		// 데이터 조회
		int PageStartNo = total - (currentPage - 1) * 10;
		for(ProductDto product : products) {
			product.setStartNo(PageStartNo --);
			
			int originalPrice = (int) product.getProPrice(); // 원래 가격
			int discountPercent = (int) product.getProSale(); // 할인 비율

			// 할인된 가격 계산
			int discountPrice = (int) (originalPrice * (1 - discountPercent / 100.0));
	        product.setsalePrice(discountPrice);
		}
		
		
		req.setAttribute("products", products);
		req.setAttribute("articles", articles);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);
	}
}
