<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" href="/FarmStoryJSP/css/farmstory.css">
</head>
<body>
<%@ include file="/css/_header.jsp"%>
<div class="marketCart">
    <main>
        <div class="background">
            <img src="../images/sub_top_tit2.png" alt="1">
        </div>
        <section>
            <aside>
                <img src="../images/sub_aside_cate2_tit.png" alt="장보기" class="intro">
            <ul class="sideimage">
                <li><a href="./introduction.html" class="greet"><img src="../images/sub_cate2_lnb1_ov.png" alt="2"></a></li>
            </ul>
        </aside>
            <article>
                <nav class="articleNav">
                    <img src="../images/sub_nav_tit_cate2_tit1.png" alt="장보기">
                    <p><img src="../images/sub_page_nav_ico.gif" alt="navIcon"> HOME > 장보기 > <strong>장보기</strong></p>
                </nav>
                <div class="all"><a href="#">장바구니 전체(10)</a></div>
                <table class="cart">
                    <thead>
                        <tr>
                            <th id="tt"><input type="checkbox"></th>
                            <th>이미지</th>
                            <th id="tt">종류</th>
                            <th>상품명</th>
                            <th id="tt">수량</th>
                            <th id="tt">할인</th>
                            <th id="tt">포인트</th>
                            <th id="tt">가격</th>
                            <th id="tt">소계</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<!-- 장바구니가 비어있을 때 -->
                        <c:if test="${empty cartDto}">
				            <tr>
				                <td colspan="9" style="color: #8d8d8d;">장바구니에 상품이 없습니다.</td>
				            </tr>
				        </c:if>
                        <c:if test="${not empty cartDto}">
				            <c:forEach var="cart" items="${cartDto}">
				                <tr>
				                    <!-- 체크박스 -->
				                    <td id="dd">
				                        <input type="checkbox" name="selectedItems" value="${cart.cartProNo}">
				                    </td>
				                    <!-- 상품 이미지 -->
				                    <td>
				                        <a href="#"><img src="../images/market_item1.jpg" alt="${cart.proName}"></a>
				                    </td>
				                    <!-- 상품 유형 -->
				                    <td id="dd">${cart.proType}</td>
				                    <!-- 상품 이름 -->
				                    <td>
				                        <a href="#" style="font-weight: bold;">${cart.proName}</a>
				                    </td>
				                    <!-- 수량 -->
				                    <td id="dd">${cart.cartStock}</td>
				                    <!-- 할인율 -->
				                    <td id="dd">${cart.proSale}</td>
				                    <!-- 포인트 -->
				                    <td id="dd">${cart.proPoint}p</td>
				                    <!-- 가격 -->
				                    <td id="dd">${cart.proPrice}원</td>
				                    <!-- 합계 -->
				                    <td id="dd">
				                        <span style="font-weight: bold;">
				                            ${cart.cartStock * cart.proPrice - (cart.cartStock * cart.proPrice * cart.proSale / 100)}
				                        </span>원
				                    </td>
				                </tr>
				            </c:forEach>
				        </c:if>
                        
                    </tbody>
                </table>
                <a href=""><input type="button" value="선택삭제"></a>
                <div class="total">
                    <table class="downtable">
        				<caption>전체합계</caption>
				        <tbody>
				            <tr>
				                <td>상품수</td>
				                <td id="total-item-count">0</td>
				            </tr>
				            <tr>
				                <td>상품금액</td>
				                <td id="total-product-price">0원</td>
				            </tr>
				            <tr>
				                <td>할인금액</td>
				                <td id="total-discount">0원</td>
				            </tr>
				            <tr>
				                <td>배송비</td>
				                <td id="total-delivery-fee">0원</td>
				            </tr>
				            <tr>
				                <td>포인트</td>
				                <td id="total-points">0원</td>
				            </tr>
				            <tr>
				                <td>전체주문금액</td>
				                <td id="total-order-amount">0원</td>
				            </tr>
				        </tbody>
				    </table>
                    <a href=""><input type="button" value="주문하기"></a>
                </div>
            </article>
        </section>
    </main>
    </div>
<%@ include file="/css/_footer.jsp"%>
</body>
</html>