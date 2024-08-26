
  package com.farmstory.service;
  
  import java.util.List;
  
  import com.farmstory.dao.ProductDao; 
  import com.farmstory.dto.ProductDto;
  
  public enum ProductService { INSTANCE; private ProductDao dao =
  ProductDao.getInstance();
  
  /*public PageGroupDto getCurrentPageGroup(int currentPage) { 
	  int currentPageGroup = (int) Math.ceilDiv(currentPage / 10.0); 
	  int pageGroupStart = (currentPageGroup - 1) * 10 + 1; 
	  int pageGroupEnd = currentPageGroup * 10;
	  int total = selectCountTotal(); }
  public int selectCountTotal() { 
	  return dao.selectCountTotal(); 
  } 
  */
  public void insertProduct(ProductDto dto) { dao.insertProduct(dto); }
  public ProductDto selectProduct(int proNo) { 
	  return dao.selectProduct(proNo); 
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
 