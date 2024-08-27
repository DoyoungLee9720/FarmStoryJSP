<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link rel="stylesheet" href="/FarmStoryJSP/css/article.css">
	<link rel="stylesheet" href="/FarmStoryJSP/css/farmstory.css">
	
  <title>Farmstory</title>
  <style>
    main {
      height : auto;
      width: 980px;
      margin: 0 auto;
    }
    .titleEvent {
      width: 980px;
      height: 184px;
      background-image: url("../images/sub_top_bg.jpg");
      position: relative;
    }
    .titleEvent > img {
      position: absolute;
      left : 10px;
      bottom: 10px;
    }
    .mainSection {
      display: flex;
    }
    .mainAside{
      width: 176px;
      height: 650px;
      box-sizing: border-box;
      background-image: url("../images/sub_aside_bg_line.png");
      background-repeat: no-repeat;
      background-position: 169px;
    }
    .mainAside > .eventList {
      margin: 16px 16px;
    }
    .asideList {
      width: 175px;
      height: 233px;
      background-image: url("../images/sub_aside_bg_lnb.png");
      position: relative;
    }
    .asideList > li:nth-child(1){
      display: inline-block;
      margin-top: 30px;
    }
    .articleNav {
      width: 762px;
      height: 72px;
      margin-left: 40px;
      border-bottom: 1px solid #c2c2c2;
      position: relative;
    }
    .articleNav > img {
      position: absolute;
      bottom: 5px;
    }
    .articleNav > p {
      position: absolute;
      bottom: 5px;
      right: 0px;
    }
    .articleNav > p > strong {
      color : rgb(124, 165, 64)
    }
    .mainArticle > p {
      margin-left: 40px;
      margin-top: 40px;
    }
    .mainArticle {
      margin: 0 0;
      width: 802px;
      height : 650px;
      box-sizing: border-box;
      
    }
  </style>
  
</head>
<body>
<%@ include file="/css/_header.jsp"%>
  
  <!-- header 끝-->



  <main>
    <div class="titleEvent"><img src="../images/sub_top_tit5.png" alt=""></div>
    <section class="mainSection">
      <aside class="mainAside">
        <img src="../images/sub_aside_cate5_tit.png" alt="Event" class="eventList">
        <ul class="asideList">
          <li><a href="/FarmStoryJSP/article/list.do?group=community&cate=notice"><img src="../images/sub_cate5_lnb1_ov.png" alt=""></a></li>
          <li><a href="/FarmStoryJSP/article/list.do?group=community&cate=menu"><img src="../images/sub_cate5_lnb2.png" alt=""></a></li>
          <li><a href="/FarmStoryJSP/article/list.do?group=community&cate=chef"><img src="../images/sub_cate5_lnb3.png" alt=""></a></li>
          <li><a href="/FarmStoryJSP/article/list.do?group=community&cate=faq"><img src="../images/sub_cate5_lnb4.png" alt=""></a></li>
          <li><a href="/FarmStoryJSP/article/list.do?group=community&cate=qna"><img src="../images/sub_cate5_lnb5.png" alt=""></a></li>
        </ul>
      </aside>

      <article class="mainArticle">
        <nav class="articleNav">
          <img src="../images/sub_nav_tit_cate5_tit1.png" alt="event">
          <p><img src="../images/sub_page_nav_ico.gif" alt="navIcon"> HOME > 커뮤니티 > <strong>공지사항</strong></p>
        </nav>
        <section class="list">
                <article>
                    <table border="0">
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>날짜</th>
                            <th>조회</th>
                        </tr>
                        <c:forEach var="article" items="${articles}">
	                        <tr>
	                            <td>${pageStartNum}</td>
	                            <td><a href="/jboard/article/view.do?no=${article.no}">${article.title}</a>&nbsp;[${article.comment}]</td>
	                            <td>${article.nick}</td>
	                            <td>${article.rdate}</td>
	                            <td>${article.hit}</td>
	                        </tr>
	                        <!-- 한번 반복할때마다 pageStartNum을 1씩 차감 -->
	                        <c:set var="pageStartNum" value="${pageStartNum-1}"/>
                        </c:forEach>
                    </table>
                </article>

                <!-- 페이지 네비게이션 -->
                <div class="paging">
                	<c:if test="${pageGroup.start > 1}">
                    	<a href="/jboard/article/list.do?pg=${pageGroup.start-1}" class="prev">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="${pageGroup.start}" end="${pageGroup.end}">
                    	<a href="/jboard/article/list.do?pg=${i}" class="num ${currentPage == i ? 'current':'off'}">${i}</a>
                    </c:forEach>
                    <c:if test="${pageGroup.end < lastPageNum}">
                    	<a href="/jboard/article/list.do?pg=${pageGroup.end+1}" class="next">다음</a>
                    </c:if>
                </div>

                <!-- 글쓰기 버튼 -->
                <a href="/jboard/article/write.do" class="btnWrite">글쓰기</a>
            </section>
      </article>
    </section>
  </main>


  
  <!-- footer 시작 -->
<%@ include file="/css/_footer.jsp"%>
</body>
</html>