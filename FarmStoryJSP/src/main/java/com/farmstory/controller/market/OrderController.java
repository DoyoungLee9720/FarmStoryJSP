package com.farmstory.controller.market;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.farmstory.dto.CartDto;
import com.farmstory.dto.ProductDto;
import com.farmstory.dto.UserDto;
import com.farmstory.service.CartService;
import com.farmstory.service.ProductService;
import com.farmstory.service.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/market/order.do")
public class OrderController extends HttpServlet{

	private static final long serialVersionUID = -5384513430322205886L;
	UserService userservice = UserService.INSTANCE;
	ProductService productservice = ProductService.INSTANCE;
	CartService cartservice = CartService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//세션에서 아이디 정보 받아오기
		String uid = req.getParameter("uid");
		HttpSession session = req.getSession();
		session.setAttribute("sessUser",uid);
		
		//어떤 주문 인지 확인 하기 위한 정보 가져오기
		String ordercheck = req.getParameter("ordercheck");
		
		//view 에서 바로구매 버튼을 눌렀을때 동작
		if(ordercheck.equals("1")) {
			String quantity = req.getParameter("quantity");
			String proNo = req.getParameter("proNo");
			ProductDto dto = productservice.selectProduct(Integer.parseInt(proNo));
			dto.setCartstock(Integer.parseInt(quantity));
			req.setAttribute("dto", dto);
		}
		
		//장바구니에서 구매 버튼을 눌렀을때만 동작
		else if(ordercheck.equals("2")) {
			// 선택된 상품의 ID 리스트
			String[] prodto = req.getParameterValues("selectedItems");
			
			// CartDto를 통해 사용자의 장바구니 정보를 가져옵니다.
		    List<CartDto> cartList = cartservice.selectCarts(uid);
			
			// 선택된 상품 번호 리스트를 생성
		    Set<Integer> selectedProductIds = new HashSet<>();
		    for (String id : prodto) {
		        selectedProductIds.add(Integer.parseInt(id));
		    }
		    
		    // 선택된 상품 정보를 저장할 리스트
		    List<ProductDto> dto = new ArrayList<>();
		    
		    // 장바구니 리스트에서 선택된 상품의 정보만 필터링
		    for (CartDto cart : cartList) {
		        if (selectedProductIds.contains(cart.getCartprono())) {
		            ProductDto product = new ProductDto();
		            product.setProNo(cart.getCartprono());
		            product.setCartstock(cart.getCartstock());
		            product.setProSale(cart.getProsale());
		            product.setProPoint(cart.getPropoint());
		            product.setProPrice(cart.getProprice());
		            dto.add(product);
		        }
		    }
	        req.setAttribute("dto", dto);
		}
		//아이디만을 활용해서 유저 정보를 가져오기
		UserDto userdto = userservice.selectUser(uid);
		req.setAttribute("userdto", userdto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/market/order.jsp");
        dispatcher.forward(req, resp);
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
