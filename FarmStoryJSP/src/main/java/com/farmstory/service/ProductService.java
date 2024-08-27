
package com.farmstory.service;

import java.util.List;

import com.farmstory.dao.ProductDao;
import com.farmstory.dto.PageGroupDto;
import com.farmstory.dto.ProductDto;

public enum ProductService {
	INSTANCE;

	private ProductDao dao = ProductDao.getInstance();
	
	public int getLastPageNum(int total) {
		int lastPageNum = 0;
		if(total % 10 == 0) {
			lastPageNum = total /10;
		}else {
			lastPageNum = total + 1;
		}
		return lastPageNum;
	}
	public int getStartNum(int currentPage) {
		return (currentPage - 1) * 10;
	}
	public int getCurrentPage(String pg) {
		int currentPage = 1;
		
		if(pg != null){
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	
	public PageGroupDto getCurrentPageGroup(int currentPage) {
		int currentPageGroup = (int) Math.ceil(currentPage / 10.0);
		int pageGroupStart = (currentPageGroup - 1) * 10 + 1;
		int pageGroupEnd = currentPageGroup * 10;
		int total = selectCountTotal();
		int pageGroupTotal = (int) Math.ceil(total / 10.0);

		if (pageGroupEnd > pageGroupTotal) {
			pageGroupEnd = pageGroupTotal;
		}
		return new PageGroupDto(pageGroupStart, pageGroupEnd, pageGroupTotal);
	}

	public void insertProduct(ProductDto dto) {

		dao.insertProduct(dto);
	}

	public ProductDto selectProduct(int proNo) {
		return dao.selectProduct(proNo);
	}

	public int selectCountTotal() {
		return dao.selectCountTotal();
	}

	public List<ProductDto> selectProducts(int proNo) {
		return dao.selectProducts(proNo);
	}

	public void updateProduct(ProductDto dto) {
		dao.updateProduct(dto);
	}

	public void deleteProduct(int proNo) {
		dao.deleteProduct(proNo);
	}
}
