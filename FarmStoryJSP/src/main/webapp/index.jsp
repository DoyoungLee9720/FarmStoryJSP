<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/FarmStoryJSP/css/farmstory.css">
<style>
* {
	margin: 0;
	padding: 0;
	font: normal 12px '맑은고딕';
	color: black;
}

ul, ol {
	list-style: none;
}

#wrapper {
	width: 100%;
	height: 100%;
}

main .Farmstory {
	width: 100%;
	height: auto;
}

main .Farmstory>.benner1 {
	position: relative;
	width: 986px;
	height: 312px;
	margin: 0 auto;
	background-image: url(/FarmStoryJSP/images/main_slide_img1.jpg);
}

.benner1>div {
	float: right;
	width: 230px;
	height: 312px;
	margin: 0 auto;
	background-image: url(/FarmStoryJSP/images/main_banner_bg.jpg);
}

.benner1>img {
	position: absolute;
	top: 40px;
	left: 40px;
}

.benner1>div {
	position: relative;
}

.benner1>div>img:nth-child(1) {
	position: absolute;
	top: 175px;
	left: 10px;
}

.benner1>div>img:nth-child(2) {
	position: absolute;
	top: 31px;
	left: 10px;
}

.benner1>div>img:nth-child(3) {
	position: absolute;
	top: 10px;
	left: 165px;
}

main .bestitem {
	width: 100%;
	height: auto;
	padding-bottom: 10px;
}

main .bestitem>div:nth-child(1) {
	width: 986px;
	height: 70px;
	margin: 0 auto;
	display: block;
}

main .bestitem>div>img {
	margin-top: 15px;
}

main .bestitem>div:nth-child(2) {
	width: 986px;
	height: 236px;
	margin: 0 auto;
	display: flex;
}

main .bestitem>div>a {
	width: 16.66%;
	height: 236px;
	border: 1px solid rgba(137, 137, 137, 0.468);
	box-sizing: border-box;
	margin-right: 7px;
}

main .bestitem>div>a:nth-child(1) {
	margin-left: 3px;
}

main .bestitem>div>a>article {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100%;
}

main .bestitem>div>a>article>img {
	margin-bottom: 10px;
}

main .bestitem>div>a>article>h1 {
	margin-bottom: 10px;
	color: gray;
	font-weight: 300;
}

main .bestitem>div>a>article>p {
	margin-bottom: 5px;
	font-weight: 500;
}

.pricediscount {
	display: flex;
	margin-left: 5px;
}

.price, .discount {
	margin-right: 3px;
	margin-bottom: 7px;
	font-size: 7px;
}

.price {
	text-decoration: line-through;
}

.discount {
	color: red;
}

main .bestitem>div>a>article>h3 {
	font-weight: bold;
	margin-bottom: 10px;
}

a {
	text-decoration: none;
}

input, textarea {
	outline: none;
}

.div-header {
	width: 980px;
	height: auto;
	display: flex;
	box-sizing: border-box;
	margin: 0 auto;
}

.content-footer>.footer-box {
	width: 980px;
	height: auto;
	padding: 10px;
	box-sizing: border-box;
	margin: 0 auto;
}

.banner_images1, .banner_images2 {
	flex: 1;
	background-size: cover;
	background-position: center;
}

.banner_images1 {
	background-image: url('/FarmStoryJSP/images/main_banner_sub1_bg.jpg');
}

.banner_images2 {
	background-image: url('/FarmStoryJSP/images/main_banner_sub2_bg.jpg');
}

.article-main {
	width: 980px;
	height: auto;
	margin: 0 auto;
	box-sizing: border-box;
	display: flex;
	justify-content: space-between;
	padding: 10px 0 10px 0;
}

.content {
	display: flex;
	align-items: flex-start;
}

.content img {
	width: 105px;
	height: 96px;
	margin-right: 15px;
}

.content-customer>.customer-box {
	width: 980px;
	height: auto;
	display: flex;
	border-top: 1px solid;
	box-sizing: border-box;
	margin: 0 auto;
	margin-top: 20px;
	margin-bottom: 10px;
}

.conimg {
	margin-top: 10px;
	margin-bottom: 15px;
}

.customer {
	margin: 0;
}

.cus {
	padding-top: 4px;
}

.customer>table {
	box-sizing: border-box;
	height: 154px;
	width: 100%;
}

.account {
	padding: 10px;
	width: 230px;
	height: 130px;
	justify-content: space-around;
	border-left: 1px solid #d7d7d7;
	border-right: 1px solid #d7d7d7;
	box-sizing: border-box;
	position: relative;
	top: 12px;
}

.account .img {
	position: absolute;
	top: 0px;
}

.account .accountUl {
	position: absolute;
	top: 40px;
}

.ment {
	padding: 10px;
	width: px;
	height: 130px;
	justify-content: space-around;
	box-sizing: border-box;
	position: relative;
}

.ment>.mt {
	position: relative;
}

.dataMent {
	display: flex;
	flex-direction: column;
	/* 항목을 열 방향으로 정렬 */
}

.dataMant {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
	/* 각 항목 간격 조정 */
}

.ment>table {
	width: 305px;
	height: auto;
	margin: 10px;
	margin-top: 20px;
}

.data {
	margin-left: auto;
	/* 오른쪽으로 밀어내기 */
	right: 10px;
	/* 필요에 따라 조정 가능 */
}
</style>
</head>

<body>
	<%@ include file="/css/_header.jsp"%>
	<main>
		<section class="Farmstory">
			<div class="benner1">
				<img src="/FarmStoryJSP/images/main_slide_img_tit.png" alt="메인 이미지">
				<div>
					<img src="/FarmStoryJSP/images/main_banner_img.png" alt="배너 사과">
					<img src="/FarmStoryJSP/images/main_banner_tit.png" alt="오픈기념">
					<img src="/FarmStoryJSP/images/main_banner_txt.png" alt="그랜드오픈">
				</div>
			</div>
		</section>
		<section class="bestitem">
			<div>
				<img src="/FarmStoryJSP/images/main_market_tit.png" alt="베스트 상품">
			</div>
			<div>
				<a href="/FarmStoryJSP/market/view.do?no${product.proNo}">
					<article>
						 <c:forEach var="product" items="${products}">
							<img src="/FarmStoryJSP/images/market_item1.jpg" alt="사과">
							<h1>${product.proType}</h1>
							<p>${product.proName}</p>
							<div class="pricediscount">
								<span class="price">4000원</span> <span class="discount">10%↓</span>
							</div>
							<h3>3,600원</h3>
						</c:forEach>
					</article>

				</a> <a href="#">
					<article>
						<img src="/FarmStoryJSP/images/market_item2.jpg" alt="사과">
						<h1>과일</h1>
						<p>사과 500g</p>
						<div class="pricediscount">
							<span class="price">4000원</span> <span class="discount">10%↓</span>
						</div>
						<h3>3,600원</h3>
					</article>
				</a> <a href="#">
					<article>
						<img src="/FarmStoryJSP/images/market_item3.jpg" alt="사과">
						<h1>과일</h1>
						<p>사과 500g</p>
						<div class="pricediscount">
							<span class="price">4000원</span> <span class="discount">10%↓</span>
						</div>
						<h3>3,600원</h3>
					</article>
				</a> <a href="#">
					<article>
						<img src="/FarmStoryJSP/images/market_item4.jpg" alt="사과">
						<h1>과일</h1>
						<p>사과 500g</p>
						<div class="pricediscount">
							<span class="price">4000원</span> <span class="discount">10%↓</span>
						</div>
						<h3>3,600원</h3>
					</article>
				</a> <a href="#">
					<article>
						<img src="/FarmStoryJSP/images/market_item5.jpg" alt="사과">
						<h1>과일</h1>
						<p>사과 500g</p>
						<div class="pricediscount">
							<span class="price">4000원</span> <span class="discount">10%↓</span>
						</div>
						<h3>3,600원</h3>
					</article>
				</a> <a href="#">
					<article>
						<img src="/FarmStoryJSP/images/market_item6.jpg" alt="사과">
						<h1>과일</h1>
						<p>사과 500g</p>
						<div class="pricediscount">
							<span class="price">4000원</span> <span class="discount">10%↓</span>
						</div>
						<h3>3,600원</h3>
					</article>
				</a>

			</div>
		</section>
		<section class="section-haeder">
			<div class="div-header">
				<div class="banner_images1">
					<tr>
						<img src="/FarmStoryJSP/images/main_banner_sub1_tit.png">
					</tr>
				</div>
				<div class="banner_images2">
					<tr>
						<img src="/FarmStoryJSP/images/main_banner_sub2_tit.png">
					</tr>
				</div>
			</div>
		</section>
		<section class="section-main">
			<article class="article-main">
				<div class="container">
					<img class="conimg" src="/FarmStoryJSP/images/main_latest1_tit.png">
					<div class="content">
						<img src="/FarmStoryJSP/images/main_latest1_img.jpg" alt="텃밭가꾸기">
						<table>
							<tbody>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="container">
					<img class="conimg" src="/FarmStoryJSP/images/main_latest1_tit.png">

					<div class="content">
						<img src="/FarmStoryJSP/images/main_latest2_img.jpg" alt="텃밭가꾸기">
						<table>
							<tbody>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="container">
					<img class="conimg" src="/FarmStoryJSP/images/main_latest1_tit.png">
					<div class="content">
						<img src="/FarmStoryJSP/images/main_latest3_img.jpg" alt="텃밭가꾸기">
						<table>
							<tbody>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
								<tr>
									<td><a href="#" class="link">> 토마토! 건강하게 길러...</a></td>
									<td>20-12-22</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</article>
		</section>
		<section class="content-customer">
			<article class="customer-box">
				<div class="customer">
					<table>
						<tr>
							<td colspan="3" class="cus"><img class="tit.png"
								src="/FarmStoryJSP/images/main_sub2_cs_tit.png" alt="고객센터">
							</td>
						</tr>
						<tr>
							<td><img class="img.png"
								src="/FarmStoryJSP/images/main_sub2_cs_img.png" alt="고객센터">
							</td>
							<td><img class="txt.png"
								src="/FarmStoryJSP/images/main_sub2_cs_txt.png" alt="고객센터">
							</td>
							<td>
								<p>평일: AM 09:00 ~ PM 06:00</p>
								<p>점심: PM 12:00 ~ PM 01:00</p>
								<p>토, 일요일, 공휴일 휴무</p>
							</td>
						</tr>
						<tr>
							<td colspan="3"><img
								src="/FarmStoryJSP/images/main_sub2_cs_bt1.png"> <img
								src="/FarmStoryJSP/images/main_sub2_cs_bt2.png"> <img
								src="/FarmStoryJSP/images/main_sub2_cs_bt3.png"></td>
						</tr>
					</table>

				</div>
				<div class="account">
					<div class="img">
						<tr>
							<td><img
								src="/FarmStoryJSP/images/main_sub2_account_tit.png" alt="계좌 안내">
							</td>
						</tr>
					</div>
					<div class="accountUl">
						<tr>
							<td>
								<p>기업은행 123-456789-01-01-012</p>
								<p>국민은행 01-1234-56789</p>
								<p>우리은행 123-456789-01-01</p>
								<p>하나은행 123-456789-01-01</p>
								<p>예금주 (주)팜스토리</p>
							</td>
						</tr>
					</div>
				</div>
				<div class="ment">
					<div class="mt">
						<div class="ment-img">
							<td><img src="/FarmStoryJSP/images/main_sub2_notice_tit.png"
								alt="공지상황"></td>
						</div>
					</div>
					<table>
						<tr class="datament">
							<td><span>· </span> <a href="#">안녕하세요 홈페이지 오픈 기념 이벤트 ...</a>
							</td>
							<td class="data">20-12-22</td>
						</tr>
						<tr class="datament">
							<td><span>· </span> <a href="#">안녕하세요 홈페이지 오픈 기념 이벤트 ...</a>
							</td>
							<td class="data">20-12-22</td>
						</tr>
						<tr class="datament">
							<td><span>· </span> <a href="#">안녕하세요 홈페이지 오픈 기념 이벤트 ...</a>
							</td>
							<td class="data">20-12-22</td>
						</tr>
						<tr class="datament">
							<td><span>· </span> <a href="#">안녕하세요 홈페이지 오픈 기념 이벤트 ...</a>
							</td>
							<td class="data">20-12-22</td>
						</tr>
						<tr class="datament">
							<td><span>· </span> <a href="#">안녕하세요 홈페이지 오픈 기념 이벤트 ...</a>
							</td>
							<td class="data">20-12-22</td>
						</tr>

					</table>
				</div>
			</article>
		</section>
	</main>
	<%@ include file="/css/_footer.jsp"%>
</body>
</html>