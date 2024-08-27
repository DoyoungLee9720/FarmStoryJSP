package com.farmstory.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dao.UserDao;
import com.farmstory.dto.PageGroupDto;
import com.farmstory.dto.UserDto;

public enum UserService {
	INSTANCE;
	private UserDao dao = UserDao.getInstance();
	private static final int MAXVIEW = 10; // 한 페이지에 표시할 인원 수
	private static final int MAXPAGE = 5; // 한 줄에 표시할 페이지 수
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int getLastPage(int total) {
		int lastPageNum = 0;
			if(total%MAXVIEW==0) lastPageNum = total/MAXVIEW;
			else lastPageNum = total/MAXVIEW + 1;
		return lastPageNum;
	}
	
	public int getCurrentPage(String pg) {
		int currentPage = 1;
			if(pg != null) currentPage = Integer.parseInt(pg);
		return currentPage;
	}
	public PageGroupDto getPageList(int currentPage) {
		int start = (currentPage-1)*MAXVIEW+1;
		int end = currentPage*MAXVIEW;
		return new PageGroupDto(start, end);
	}
	public PageGroupDto getCurrentPageGroup(int currentPage) {
		int currentPageGroup = (int)Math.ceil(currentPage/((double)MAXPAGE+0.0));
		logger.debug("currentPageGroup : " + currentPageGroup);
		int pageGroupStart = (currentPageGroup-1)*MAXPAGE +1;
		int pageGroupEnd = currentPageGroup*MAXPAGE;
		logger.debug("start : "+pageGroupStart+" / end : "+pageGroupEnd);
		return new PageGroupDto(pageGroupStart, pageGroupEnd);
	}
	public List<UserDto> selectPagedUsers(PageGroupDto page) {
		return dao.selectPagedUsers(page);
	}
	
	public int selectUserCount() {
		return dao.selectUserCount();
	}
	
	public void insertUser(UserDto user) {
		dao.insertUser(user);
	}
	public UserDto selectUser(String userId) {
		return dao.selectUser(userId);
	}
	public List<UserDto> selectUsers() {
		return dao.selectUsers();
	}
	public void updateUser(UserDto user) {
		dao.updateUser(user);
	}
	public void deleteUser(String userId) {
		dao.deleteUser(userId);
	}
}
