package com.farmstory.service;

import java.util.List;

import com.farmstory.dao.UserDao;
import com.farmstory.dto.UserDto;

public enum UserService {
	INSTANCE;
	private UserDao dao = UserDao.getInstance();
	private static final int MAXVIEW = 30; // 한 페이지에 표시할 인원 수
	
	public int getLastPageNum(int total) {
		int lastPageNum = 0;
			if(total%MAXVIEW==0) lastPageNum = total/MAXVIEW;
			else lastPageNum = total/MAXVIEW + 1;
		return lastPageNum;
	}
	public int getStartNum(int currentPage) {
		return (currentPage-1)*MAXVIEW;
	}
	
	public int getCurrentPage(String pg) {
		int currentPage = 1;
			if(pg != null) currentPage = Integer.parseInt(pg);
		return currentPage;
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
