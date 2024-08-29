package com.farmstory.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.CartDto;
import com.farmstory.util.DBHelper;
import com.farmstory.util.SQL;

public class CartDao extends DBHelper{
	private static CartDao instance = new CartDao();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	public static CartDao getInstance() {
		return instance;
	}

	private CartDao() {	}
	public void intsertCart(CartDto dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_CART);
			psmt.setString(1, dto.getCartuid());
			psmt.setInt(1, dto.getCartprono());
			psmt.setInt(1, dto.getCartstock());
			psmt.executeUpdate();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
	}
	public List<CartDto> selectCarts(String cartuid){
		List<CartDto> carts = new ArrayList<CartDto>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.GET_CARTS_PRODUCT);
			psmt.setString(1, cartuid);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CartDto dto = new CartDto();
				dto.setProtype(rs.getString(1));
				dto.setProname(rs.getString(2));
				dto.setCartstock(rs.getInt(3));
				dto.setProsale(rs.getInt(4));
				dto.setPropoint(rs.getInt(5));
				dto.setProprice(rs.getInt(6));
				carts.add(dto);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return carts;
	}
	public int deleteCart(String cartno,String cartuid) {
		int result = 0;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_CART);
			psmt.setString(1, cartno);
			psmt.setString(2, cartuid);
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return result;
	}
	public List<CartDto> selectCartForPay(String uid){
		List<CartDto> cart = new ArrayList<CartDto>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_USER_CART_PAY);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CartDto dto = new CartDto();
				dto.setProimg(rs.getString(1));
				dto.setProtype(rs.getString(2));
				dto.setProname(rs.getString(3));
				dto.setCartstock(rs.getInt(4));
				dto.setProsale(rs.getInt(5));
				dto.setPropoint(rs.getInt(6));
				dto.setProprice(rs.getInt(7));
				cart.add(dto);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return cart;
	}
	
}
