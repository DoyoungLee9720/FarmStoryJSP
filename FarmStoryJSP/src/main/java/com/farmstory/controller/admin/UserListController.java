package com.farmstory.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.PageGroupDto;
import com.farmstory.dto.UserDto;
import com.farmstory.service.UserService;
import com.google.gson.JsonObject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin/user/list.do"})
public class UserListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private UserService service = UserService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pg = req.getParameter("page");

		int current = service.getCurrentPage(pg);
		PageGroupDto pageGroup = service.getCurrentPageGroup(current);
		PageGroupDto page = service.getPageList(current);

		int total = service.selectUserCount();
		int lastPage = service.getLastPage(total);
		
		logger.debug("total : "+total);
		logger.debug("current : "+current);
		logger.debug("last : "+lastPage);
		
		List<UserDto> users = service.selectPagedUsers(page);
		req.setAttribute("Users", users);
		req.setAttribute("Current", current);
		req.setAttribute("LastPage", lastPage);
		req.setAttribute("PageGroup", pageGroup);
		req.setAttribute("PageList", page);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/admin/user/list.jsp");
        dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String grade = req.getParameter("grade");
        
		logger.debug("id : "+id);
		logger.debug("grade : "+grade);
		
        // DB에서 해당 유저의 등급을 업데이트
        int result = service.updateUserGrade(id, grade);

        logger.debug("result : " + result);
        
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		

		PrintWriter printWriter = resp.getWriter();
		printWriter.print(json);
		printWriter.flush();
        
	}
}
