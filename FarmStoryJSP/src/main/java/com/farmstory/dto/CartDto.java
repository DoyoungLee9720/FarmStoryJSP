package com.farmstory.dto;

public class CartDto {
	//카트정보
	private int cartno;
	private String cartuid;
	private int cartprono;
	private int cartstock;
	
	//상품 정보
	private String protype;
	private String proname;
	private int prosale;
	private int propoint;
	private int proprice;
	//상품 정보
	public String getProtype() {
		return protype;
	}
	public void setProtype(String protype) {
		this.protype = protype;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public int getProsale() {
		return prosale;
	}
	public void setProsale(int prosale) {
		this.prosale = prosale;
	}
	public int getPropoint() {
		return propoint;
	}
	public void setPropoint(int propoint) {
		this.propoint = propoint;
	}
	public int getProprice() {
		return proprice;
	}
	public void setProprice(int proprice) {
		this.proprice = proprice;
	}
	
	
	//카트정보
	public int getCartno() {
		return cartno;
	}
	public void setCartno(int cartno) {
		this.cartno = cartno;
	}
	public String getCartuid() {
		return cartuid;
	}
	public void setCartuid(String cartuid) {
		this.cartuid = cartuid;
	}
	public int getCartprono() {
		return cartprono;
	}
	public void setCartprono(int cartprono) {
		this.cartprono = cartprono;
	}
	public int getCartstock() {
		return cartstock;
	}
	public void setCartstock(int cartstock) {
		this.cartstock = cartstock;
	}
	
	@Override
	public String toString() {
		return "CartDto [cartno=" + cartno + ", cartuid=" + cartuid + ", cartprono=" + cartprono + ", cartstock="
				+ cartstock + "]";
	}
	
	
	
	
}
