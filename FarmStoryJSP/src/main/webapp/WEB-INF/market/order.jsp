<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="/FarmStoryJSP/css/farmstory.css">
	<script>
		window.onload = function(){
			updateTotal();
			updatepoint();
			const stockInput = document.querySelector('input[class="userpoint"]');
	        stockInput.addEventListener('input', function() {
	        	updatepoint();
	        });
			function updateTotal() {
				const rows = document.querySelectorAll('.market_ListSet tr');
				console.log(rows);
				let totalItemCount = 0;
	            let totalProductPrice = 0;
	            let totalDiscount = 0;
	            let totalPoints = 0;
	            let maxDeliveryFee = 0;
	            for (let row of rows) {
	                const quantity = parseInt(row.children[3].innerText.trim(), 10);  // 수량
	                const discount = parseInt(row.children[4].innerText.replace('%', '').trim(), 10);  // 할인율
	                const points = parseInt(row.children[5].innerText.replace('p', '').trim(), 10);  // 포인트
	                const price = parseInt(row.children[6].innerText.replace('원', '').trim(), 10);  // 가격
	                const delivery = parseInt(row.getElementsByClassName('delivery')[0]?.value.trim(), 10) || 0;  // 배송비 (없는 경우 0)
	                
	                // 합계 계산
	                const itemTotalPrice = quantity * price;
	                const itemDiscount = itemTotalPrice * (discount / 100);
	                
	                totalItemCount += quantity;
	                totalProductPrice += itemTotalPrice;
	                totalDiscount += itemDiscount;
	                totalPoints += points;
	                maxDeliveryFee = Math.max(maxDeliveryFee, delivery);
	            }
				const totalOrderAmount = totalProductPrice - totalDiscount + maxDeliveryFee;
				// UI 업데이트
	            document.getElementById('total-item-count').innerText = totalItemCount;
	            document.getElementById('total-product-price').innerText = totalProductPrice + "원";
	            document.getElementById('total-discount').innerText = totalDiscount+ "원";
	            document.getElementById('total-delivery-fee').innerText = maxDeliveryFee+ "원";
	            document.getElementById('total-points').innerText = totalPoints +"p";
	            document.getElementsByClassName('total-amount')[0].innerText = totalOrderAmount+ "원";
		    }
			function updatepoint() {
		        const quantity = parseInt(document.querySelector('input[class="userpoint"]').value, 10);
		
		        if (!isNaN(quantity)&&quantity<=${sessUser.getUserPoint()}) {
		            document.querySelector('#total-point-use').textContent = quantity+`P`;
		        } else {
		            // 가격이나 수량이 올바르지 않은 경우
		            document.querySelector('#total-point-use').textContent = '0P';
		        }
		    }
		}
	</script>
</head>

<body>
	<%@ include file="/css/_header.jsp"%>
	<div class="marketOrder">
	<main>
		<div class="titleEvent">
			<img src="/FarmStoryJSP/images/sub_top_tit2.png" alt="">
		</div>
		<section class="mainSection">
			<aside class="mainAside">
				<img src="/FarmStoryJSP/images/sub_aside_cate2_tit.png" alt="Event" class="eventList">
				<ul class="asideList">
					<li><a href="#"><img src="/FarmStoryJSP/images/sub_cate2_lnb1_ov.png" alt=""></a></li>
				</ul>
			</aside>
			<div class="container">
				<section>
					<article class="mainArticle">
						<nav class="articleNav">
							<img src="/FarmStoryJSP/images/sub_nav_tit_cate2_tit1.png" alt="event">
							<p>
								<img src="/FarmStoryJSP/images/sub_page_nav_ico.gif" alt="navIcon">
								HOME > 장보기 > <strong>장보기</strong>
							</p>
						</nav>
						<p>전체(${products.size()}) | 과일 | 야채 | 곡류</p>

						<table>
							<thead>
								<tr>
									<th>이미지</th>
									<th>종류</th>
									<th>상품명</th>
									<th>수량</th>
									<th>할인</th>
									<th>포인트</th>
									<th>가격</th>
									<th>소계</th>
								</tr>
							</thead>
							<tbody class="market_ListSet">
								<c:forEach var="product" items="${products}">
									<tr>
										<td><img src="${product.proimg1}" alt="${product.proname}"></td>
										<td>${product.protype}</td>
										<td><a href="/FarmStoryJSP/market/view?no=${product.prono}">${product.proname}</a></td>
										<td>${product.cartstock}</td>
										<td>${product.prosale}%</td>
										<td>${product.propoint}p</td>
										<td>${product.proprice}</td>
										<td>${product.proprice*(100-product.prosale)/100*product.cartstock}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="tableContainer">
							<!-- 새로운 컨테이너 추가 -->
							<table class="orderInformation">
								<caption>주문정보 입력</caption>
								<tr>
									<td>주문자</td>
									<td><input type="text" value="${sessUser.getUserName()}"></td>
								</tr>
								<tr>
									<td>휴대폰</td>
									<td><input type="text" value="${sessUser.getUserHp()}"></td>
								</tr>
								<tr>
									<td>포인트사용</td>
									<td>
										<input type="number" max="${sessUser.getUserPoint()}" placeholder="포인트 입력" class="userpoint">
										<input type="button" value="사용하기"><br>
										<span>사용가능 ${sessUser.getUserPoint()}P</span>
									</td>
								</tr>
								<tr>
									<td>배송주소</td>
									<td>
										<input type="text" placeholder="주소 입력"  value="${sessUser.getUserZip()}">
										<img src="/FarmStoryJSP/images/btn_post_search.gif"><br>
										<input type="text" placeholder="기본주소 검색" class="full-width" value="${sessUser.getUserAddr1()}"><br>
										<input type="text" placeholder="상세주소 검색" class="full-width" value="${sessUser.getUserAddr2()}">
									</td>
								</tr>
								<tr>
									<td>결제방법</td>
									<td>
										<label><input type="radio" name="option" value="1">계좌이체</label>
										<label><input type="radio" name="option" value="2">신용카드</label>
										<label><input type="radio" name="option" value="3">체크카드</label>
										<label><input type="radio" name="option" value="4">휴대폰</label>
									</td>
								</tr>
								<tr>
									<td>기타</td>
									<td><textarea style="resize: none;" class="full-width"></textarea></td>
								</tr>
							</table>
							<div class="finalchecktable">
								<table class="downtable">

									<thead>

										<tr>
											<th colspan="2" class="table-title">최종결제정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>상품수</td>
											<td id="total-item-count">${products.size()}</td>
										</tr>
										<tr>
											<td>상품금액</td>
											<td id="total-product-price">27,000원</td>
										</tr>
										<tr>
											<td>할인금액</td>
											<td id="total-discount">5,000원</td>
										</tr>
										<tr>
											<td>배송비</td>
											<td id="total-delivery-fee">5,000원</td>
										</tr>
										<tr>
											<td>포인트사용</td>
											<td id="total-point-use">2,000P</td>
										</tr>
										<tr>
											<td>포인트적립</td>
											<td id="total-points">400P</td>
										</tr>
										<tr class="total-row">
											<td>전체주문금액</td>
											<td><p class="total-amount">22,000원</p></td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2"><input type="button" class="redbutton"
												value="결제하기"></td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						<!-- 컨테이너 종료 -->
				</section>

			</div>

		</section>

	</main>
	</div>
	<%@ include file="/css/_footer.jsp"%>
</body>

</html>