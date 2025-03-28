<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/email_search.css?v=3">
</head>
<body>
	<%@ include file="./layout/top.jsp"%>
	<%@ include file="./layout/quickmenu.jsp"%>
	<main>
		<form id="frm" method="post"
			action="${pageContext.request.contextPath}/searchmail">
			<section class="sub">

				<div>
					<ul>
						<li>이메일 찾기</li>
						<li>비밀번호 찾기</li>
					</ul>
				</div>

				<div class="text1">

					<div>
						<input type="text" name="m_name" placeholder="이름을 입력하세요">
					</div>
					<div>
						<input type="text" name="m_tel"
							placeholder="휴대폰 번호는 - 빼고 숫자만 입력하세요" maxlength="11">
					</div>
				</div>
				<div>
					<input type="button" value="이메일 찾기" onclick="searchEmail()">
				</div>

			</section>
		</form>
	</main>
	<%@ include file="./layout/copyright.jsp"%>
</body>
<script src="./js/email_search.js?v=1"></script>
</html>