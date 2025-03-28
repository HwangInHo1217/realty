<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css"
	href="./css/passwd_search.css?v=2">
</head>
<body>
	<%@ include file="./layout/top.jsp"%>
	<%@ include file="./layout/quickmenu.jsp"%>
	<%@include file="./layout/session_ok.jsp" %>
	<main>
		<form id="frm" method="post"
			action="${pageContext.request.contextPath}/searchPassword">
			<section class="sub">
				<div>
					<ul>
						<li>이메일 찾기</li>
						<li>비밀번호 찾기</li>
					</ul>
				</div>
				<div class="text1">
					<div>
						<input type="text" placeholder="가입하신 이메일을 입력하세요" name="m_email">
					</div>
					<div>
						<input type="text" placeholder="휴대폰 번호는 - 빼고 숫자만 입력하세요"
							name="m_tel">
					</div>
				</div>
				<div>
					<input type="button" value="비밀번호 찾기" onclick="searchPass()">
				</div>
			</section>
		</form>
	</main>
	<%@ include file="./layout/copyright.jsp"%>
</body>
<script type="text/javascript">
	function searchPass() {
		frm.submit();
	}
</script>
</html>