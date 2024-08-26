<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<section class="userlist">
				<section>
					<h3>회원목록</h3>
					<article>
						<table>
							<thead>
								<tr>
									<th><input type="checkbox" name="all"></th>
									<th>아이디</th>
									<th>이름</th>
									<th>별명</th>
									<th>이메일</th>
									<th>휴대폰</th>
									<th>등급</th>
									<th>가입일</th>
									<th>확인</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>a101</td>
									<td>김유신</td>
									<td>유신123</td>
									<td>yusin123@naver.com</td>
									<td>010-1234-1001</td>
									<td><select>
											<option>1</option>
											<option selected>2</option>
											<option>3</option>
									</select></td>
									<td>2023-01-01 13:06:14</td>
									<td><a href="#">[상세확인]</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>a102</td>
									<td>김춘추</td>
									<td>춘추123</td>
									<td>chunchu123@naver.com</td>
									<td>010-1234-1002</td>
									<td><select>
											<option>1</option>
											<option selected>2</option>
											<option>3</option>
									</select></td>
									<td>2023-01-02 13:06:14</td>
									<td><a href="#">[상세확인]</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>a103</td>
									<td>장보고</td>
									<td>보고123</td>
									<td>bogo123@naver.com</td>
									<td>010-1234-1003</td>
									<td><select>
											<option>1</option>
											<option selected>2</option>
											<option>3</option>
									</select></td>
									<td>2023-01-03 13:06:14</td>
									<td><a href="#">[상세확인]</a></td>
								</tr>
							</tbody>
						</table>
					</article>
					<article>
						<p>
							<a href="#"> &lt; </a> <b>[1]</b> <a href="#">[2]</a> <a href="#">[3]</a>
							<a href="#">[4]</a> <a href="#">[5]</a> <a href="#"> &gt; </a>

						</p>
					</article>
				</section>
			</section>
		</main>
	</div>
	<%@ include file="../_footer.jsp"%>
</body>
<script>
	const now = document.querySelector('a#userlist[href]');
	if (now) {
		now.classList.add("now");
	}
</script>
</html>




