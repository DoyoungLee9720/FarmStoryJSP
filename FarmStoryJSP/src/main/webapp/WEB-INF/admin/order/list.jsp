<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator</title>
	<link rel="stylesheet" href="/FarmStoryJSP/css/admin.css">
</head>
<body>
    <div id="wrap">
        <%@ include file="../_header.jsp"%>
        <main>
        <%@ include file="../_aside.jsp"%>
        <section class="orderlist">
            <section>
                <h3>주문목록</h3>
                <article>
                    <table>
                        <thead>
                            <tr>
                                <th><input type="checkbox" name="selectall" onclick='selectAll(this)'></th>
                                <th>주문번호</th>
                                <th>상품명</th>
                                <th>판매가격</th>
                                <th>수량</th>
                                <th>배송비</th>
                                <th>합계</th>
                                <th>주문자</th>
                                <th>주문일</th>
                                <th>확인</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${Orders}">
                            <tr>
                                <td><input type="checkbox" name="select" onclick='checkSelectAll(this)'></td>
                                <td>${order.orderno}</td>
                                <td>${order.orderproname}</td>
                                <td class="price">${order.orderproprice}</td>
                                <td>${order.orderstock}</td>
                                <td class="price">${order.orderprodeliveryfee}</td>
                                <td class="price">${order.orderpayment}</td>
                                <td>${order.orderusername}</td>
                                <td>${order.orderdate}<br>${order.ordertime}</td>
                                <td><a href="#">[상세확인]</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </article>
                <article>
                    <h3>
                        <a href="#">선택삭제</a>
                    </h3>
                </article>
                <article class="paging">
						<p>
							<c:if test="${PageGroup.start > 1}">
								<a href="?page=${PageGroup.start-1}"> &lt; </a>
							</c:if>
							<c:forEach var="i" begin="${PageGroup.start}" end="${PageGroup.end}">
							<c:if test="${i<=LastPage}">
								<a href="?page=${i}" class="num ${i eq Current?'current':'off'}">[${i}]</a>
							</c:if>
							</c:forEach>
							<c:if test="${PageGroup.end < LastPage}">
								<a href="?page=${PageGroup.end+1}"> &gt; </a>
							</c:if>

						</p>
					</article>
            </section>
        </section>
        </main>
    </div>
    <%@ include file="../_footer.jsp"%>
</body>
<script>
        const now = document.querySelector('a#orderlist[href]');
        if (now) {
            now.classList.add("now");
        }
        function checkSelectAll(checkbox)  {
  		  const selectall 
  		    = document.querySelector('input[name="selectall"]');
  		  
  		  if(checkbox.checked === false)  {
  		    selectall.checked = false;
  		  }
  		}

  		function selectAll(selectAll)  {
  		  const checkboxes 
  		     = document.getElementsByName('select');
  		  
  		  checkboxes.forEach((checkbox) => {
  		    checkbox.checked = selectAll.checked
  		  })
  		}
</script>
</html>




