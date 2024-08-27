package com.farmstory.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.UserDto;
import com.farmstory.util.DBHelper;
import com.farmstory.util.SQL;

public class UserDao extends DBHelper{
	private static UserDao instance = new UserDao();
	public static UserDao getInstance() {
		return instance;
	}
	private UserDao() { }
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	public int selectUserCount() {
		int count = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_USERS_COUNT);
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return count;
	}
	
	
	public int selectCountCheckUser(String type, String value) {
		
		StringBuilder sql = new StringBuilder(SQL.SELECT_USERS_COUNT);
		if(type.equals("uid")) {
			sql.append(SQL.WHERE_UID);
		}else if(type.equals("nick")) {
			sql.append(SQL.WHERE_NICK);
		}else if(type.equals("email")) {
			sql.append(SQL.WHERE_EMAIL);
		}else if(type.equals("hp")) {
			sql.append(SQL.WHERE_HP);
		}
		logger.debug(sql.toString());
		
		int result = 0;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, value);
			logger.debug(psmt.toString());
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
	
		return result;
	}
	
	
	
	
	public void insertUser(UserDto user) {
		
	}
	public UserDto selectUser(String userId) {
		UserDto user = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_USERS);
			if(rs.next()) {
				user = new UserDto();
				user.setUserId(rs.getString(1));
				user.setUserPass(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserNick(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				user.setUserHp(rs.getString(6));
				user.setUserRole(rs.getString(7));
				user.setUserGrade(rs.getString(8));
				user.setUserZip(rs.getString(9));
				user.setUserAddr1(rs.getString(10));
				user.setUserAddr2(rs.getString(11));
				user.setUserPoint(rs.getString(12));
				user.setUserRegip(rs.getString(13));
				user.setUserRegdate(rs.getString(14));
			}
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return user;
	}
	public List<UserDto> selectUsers() {
		List<UserDto> users = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_USERS);
			while(rs.next()) {
				UserDto user = new UserDto();
				user.setUserId(rs.getString(1));
				user.setUserPass(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserNick(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				user.setUserHp(rs.getString(6));
				user.setUserRole(rs.getString(7));
				user.setUserGrade(rs.getString(8));
				user.setUserZip(rs.getString(9));
				user.setUserAddr1(rs.getString(10));
				user.setUserAddr2(rs.getString(11));
				user.setUserPoint(rs.getString(12));
				user.setUserRegip(rs.getString(13));
				user.setUserRegdate(rs.getString(14));
				users.add(user);
				logger.debug(user.toString());
			}
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		
		return users;
	}
	
	public void updateUser(UserDto user) {
		
	}
	public void deleteUser(String userId) {
		
	}
	
	
	
	
	
	
	
	
	
	
	

	
	
	
}
