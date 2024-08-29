<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/FarmStoryJSP/css/farmstory.css">
<title>장보기</title>
<style>
main {
	height: auto;
	width: 980px;
	margin: 0 auto;
}

strong {
	font-weight: bold;
}

del {
	color: #777;
	font-size: 9px;
}

.titleEvent {
	width: 980px;
	height: 184px;
	background-image: url("../images/sub_top_bg.jpg");
	position: relative;
}

.titleEvent>img {
	position: absolute;
	left: 10px;
	bottom: 10px;
}

.mainSection {
	display: flex;
}

.mainAside {
	width: 176px;
	height: 650px;
	box-sizing: border-box;
	background-image: url("../images/sub_aside_bg_line.png");
	background-repeat: no-repeat;
	background-position: 169px;
}

.mainAside>.eventList {
	margin: 16px 16px;
}

.asideList {
	width: 175px;
	height: 233px;
	background-image: url("../images/sub_aside_bg_lnb.png");
	position: relative;
}

.asideList>li:nth-child(1) {
	display: inline-block;
	margin-top: 30px;
}

.articleNav {
	width: 762px;
	height: 72px;
	margin-left: 0;
	border-bottom: 1px solid #c2c2c2;
	position: relative;
}

.articleNav>img {
	position: absolute;
	bottom: 5px;
}

.articleNav>p {
	position: absolute;
	bottom: 5px;
	right: 0px;
}

.articleNav>p>strong {
	color: rgb(124, 165, 64)
}

.mainArticle>p {
	margin-top: 20px;
	margin-bottom: 10px;
}

.mainArticle {
	margin: 0 0;
	width: 762px;
	height: auto;
	box-sizing: border-box;
}

/* container 스타일 */
.container {
	display: flex;
	margin: 20px;
}
/* table 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	background-color: #fff;
	text-align: center;
}

thead {
	padding: 10px;
	background-color: #EEE;
	border-top: 1px solid #111;
}

tbody tr:last-child {
	border-bottom: 1px solid #111;
}

tr {
	border-bottom: 1px solid #EEEEEE;
}

tr td:nth-child(2) {
	color: #777;
}

tr td:nth-child(3) {
	text-align: left;
}

tr td:nth-child(5) {
	font-size: 9px;
}

th, td {
	padding: 10px;
	text-align: center;
}

td del:nth-child(3) {
	font-size: 12px;
}


.pagination {
    text-align: center; /* 중앙 정렬 */
    margin: 10px 0; /* 위아래 여백 추가 */
}

.pagination a.num {
            text-decoration: none;
            margin: 0 2px;
        }

        /* 현재 페이지 강조 스타일 */
        .pagination a.num.current {
            font-weight: bold; /* 현재 페이지는 굵게 표시 */
            color: #000; /* 현재 페이지 텍스트 색상 */
        }

        /* 비활성화된 링크 스타일 */
        .pagination a.num.off {
            color: #aaa; /* 비활성 링크 색상 */
        }
</style>
<script>
	window.onload = function() {
		document.addEventListener('DOMContentLoaded', function() {
		    // .pagination 안의 모든 a.num 링크 선택
		    const pageLinks = document.querySelectorAll('.pagination a.num');
		    
		    pageLinks.forEach(link => {
		        link.addEventListener('click', function(event) {
		            event.preventDefault(); // 기본 링크 동작 방지
		            const href = this.getAttribute('href');
		            // 여기에서 href로 페이지를 로드하거나 AJAX 요청을 할 수 있음
		            console.log('링크 클릭됨:', href);
		        });
		    });
		});
	}
</script>
	<%@ include file="/css/_header.jsp"%>
	<main>
		<div class="titleEvent">
			<img src="../images/sub_top_tit2.png" alt="">
		</div>
		<section class="mainSection">
			<aside class="mainAside">
				<img src="../images/sub_aside_cate2_tit.png" alt="Event"
					class="eventList">
				<ul class="asideList">
					<li><a href="#"><img src="../images/sub_cate2_lnb1_ov.png"
							alt=""></a></li>
				</ul>
			</aside>
			<div class="container">
				<section>
					<article class="mainArticle">
						<nav class="articleNav">
							<img src="../images/sub_nav_tit_cate2_tit1.png" alt="event">
							<p>
								<img src="../images/sub_page_nav_ico.gif" alt="navIcon">
								HOME > 장보기 > <strong>장보기</strong>
							</p>
						</nav>
						<p>전체(10) | 과일 | 야채 | 곡류</p>

						<table>
							<thead>
								<tr>
									<th>이미지</th>
									<th>종류</th>
									<th>상품명</th>
									<th>할인</th>
									<th>포인트</th>
									<th>판매가격</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="product" items="${products}">
									<tr>
										<td><img src="../images/main_latest3_img.jpg"></td>
										<td>${product.proName}</td>
										<td><a href="/FarmStoryJSP/view.do?no=${product.proNo}">${product.proType}</a></td>
										<td>${product.proSale}</td>
										<td>${product.proPoint}p</td>
										<td><strong>${product.salePrice}</strong>
											<del>${product.proPrice}<br>
											</del> <del>원</del></td>
									</tr>
								</c:forEach>
								</tr>
							</tbody>
						</table>
						<c:if test="${pageGroup.start > 1 }">
							<a href="/FarmStoryJSP/market/list.do?pg=${pageGroup.start - 1}"
								class="prev"><</a>
						</c:if>
						<div class="pagination">
							<c:forEach var="i" begin="${pageGroup.start}"
								end="${pageGroup.end}">
								<a href="/FarmStoryJSP/market/list.do?pg=${i}"
									class="num ${currentPage == i ? 'current':'off'}">[${i}]</a>
							</c:forEach>
						</div>
						<c:if test="${pageGroup.end < pageGroup.group}">
							<a href="/FarmStoryJSP/market/list.do?pg=${pageGroup.end - 1}"
								class="next">></a>
						</c:if>

					</article>

				</section>

			</div>

		</section>

	</main>
	<%@ include file="/css/_footer.jsp"%>
</body>
</html>