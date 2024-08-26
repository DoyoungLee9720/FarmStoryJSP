
  package com.farmstory.dao;
  
  import java.util.List;
  
  
  import com.farmstory.dto.ProductDto; import com.farmstory.util.DBHelper;
  import com.farmstory.util.SQL;
  
  public class ProductDao extends DBHelper {
  
  
  private static ProductDao instance = new ProductDao(); public static
  ProductDao getInstance() { return instance; } private ProductDao() {}
  
  public void insertProduct(ProductDto dto) {
  
  } public int selectCountTotal(int proNo) { int total = 0; try { conn =
  getConnection(); stmt = conn.createStatement(); rs =
  stmt.executeQuery(SQL.SELECT_COUNT_TOTAL);
  
  if(rs.next()) { total = rs.getInt(1); } } catch (Exception e) {
  e.printStackTrace(); }finally { closeAll(); } return total; } public
  ProductDto selectProduct(int proNo) { return null; } public List<ProductDto>
  selectProducts(int proNo) { return null; } public void
  updateProduct(ProductDto dto) {
  
  } public void deleteProduct(int proNo) {
  
  } }
 