package com.farmstory.controller.article;

import java.io.IOException;

import com.farmstory.dto.ArticleDto;
import com.farmstory.service.ArticleService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/view.do")
public class ViewController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	//private CommentService commentService = CommentService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String type = "view";
		String group = (String) req.getAttribute("group");
		String cate = (String) req.getAttribute("cate");
		
		// 데이터 조회
		//ArticleDto articleDto = service.selectArticle(no);
		
		// 댓글 조회
		//List<CommentDto> comments = commentService.selectComments(no);
		
		// 공유 참조
		//req.setAttribute("articleDto", articleDto);
		req.setAttribute("type", type);
		
		// 포워드(화면출력)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/" + group + "/" + cate + ".jsp");
		dispatcher.forward(req, resp);
	}
	
}








