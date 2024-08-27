package com.farmstory.dto;

public class ProductDto {
	private int proNo;
	private String proName;
	private String proType;
	private int proPrice;
	private int proPoint;
	private int proSale;
	private int proDeliveryfee;
	private int proStock;
	private String proImg1;
	private String proImg2;
	private String proImg3;
	private String proETC;
	private String proRdate;
	
	private int startNo;
	private int salePrice;
	
	
	
	@Override
	public String toString() {
		return "ProductDto [proNo=" + proNo + ", proName=" + proName + ", proType=" + proType + ", proPrice=" + proPrice
				+ ", proPoint=" + proPoint + ", proSale=" + proSale + ", proDeliveryfee=" + proDeliveryfee
				+ ", proStock=" + proStock + ", proImg1=" + proImg1 + ", proImg2=" + proImg2 + ", proImg3=" + proImg3
				+ ", proETC=" + proETC + ", proRdate=" + proRdate + ", startNo=" + startNo + ", salePrice=" + salePrice
				+ "]";
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProType() {
		return proType;
	}
	public void setProType(String proType) {
		this.proType = proType;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public void setProPrice(String proPrice) {
		if(proPrice!=null) this.proPrice = Integer.parseInt(proPrice);
		else this.proPrice = 0;
	}
	public int getProPoint() {
		return proPoint;
	}
	public void setProPoint(int proPoint) {
		this.proPoint = proPoint;
	}
	public void setProPoint(String proPoint) {
		if(proPoint!=null) this.proPoint = Integer.parseInt(proPoint);
		else this.proPoint = 0;
	}
	public int getProSale() {
		return proSale;
	}
	public void setProSale(int proSale) {
		this.proSale = proSale;
	}
	public void setProSale(String proSale) {
		if(proSale!=null) this.proSale = Integer.parseInt(proSale);
		else this.proSale = 0;
	}
	public int getProDeliveryfee() {
		return proDeliveryfee;
	}
	public void setProDeliveryfee(int proDeliveryfee) {
		this.proDeliveryfee = proDeliveryfee;
	}
	public void setProDeliveryfee(String proDeliveryfee) {
		if(proDeliveryfee!=null) this.proDeliveryfee = Integer.parseInt(proDeliveryfee);
		else this.proDeliveryfee = 0;
	}
	public int getProStock() {
		return proStock;
	}
	public void setProStock(int proStock) {
		this.proStock = proStock;
	}
	public void setProStock(String proStock) {
		if(proStock!=null) this.proStock = Integer.parseInt(proStock);
		else this.proStock = 0;
	}
	public String getProImg1() {
		return proImg1;
	}
	public void setProImg1(String proImg1) {
		this.proImg1 = proImg1;
	}
	public String getProImg2() {
		return proImg2;
	}
	public void setProImg2(String proImg2) {
		this.proImg2 = proImg2;
	}
	public String getProImg3() {
		return proImg3;
	}
	public void setProImg3(String proImg3) {
		this.proImg3 = proImg3;
	}
	public String getProETC() {
		return proETC;
	}
	public void setProETC(String proETC) {
		this.proETC = proETC;
	}
	public String getProRdate() {
		return proRdate;
	}
	public void setProRdate(String proRdate) {
		this.proRdate = proRdate;
	}

	
}