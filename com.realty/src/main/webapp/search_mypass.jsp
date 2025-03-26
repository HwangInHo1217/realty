<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 찾기 및 변경</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css"
	href="./css/search_myinfo.css?v=2">
</head>
<body>
	<%@include file="./top.jsp"%>
	<%@include file="./quickmenu.jsp"%>
	<main>
		<section class="sub">
			<div>
				<ul>
					<li>회원가입 정보에 따른 패스워드 변경</li>
				</ul>
			</div>
			<div class="text1 repass">
				<div>
					<input type="password" id="mpass"
						placeholder="최소 10 ~ 16자 (영문,숫자,특수 문자 조합)로 입력해주세요." class="passin"
						autocomplete="none">
				</div>
				<div>
					<input type="password" id="chkpass" placeholder="동일한 비밀번호를 입력하세요"
						class="passin" autocomplete="none">
				</div>
			</div>
			<div>
				<input type="button" onclick="submitPasswordChange()"
					value="비밀번호 변경" class="search_submit">
			</div>
		</section>
	</main>
	<%@include file="./copyright.jsp"%>
</body>
<script>
//세션에서 객체를 JSP로 전달 (예: 사용자 정보를 서버에서 직접 주입)
var userInfo = ${dto != null ? dto : '{}'};  // JSP에서 model의 userInfo 객체를 JavaScript 변수로 변환

// 비밀번호 변경을 위한 PUT 요청 보내기
function submitPasswordChange() {
    var newPassword = document.getElementById("mpass").value;
    var confirmPassword = document.getElementById("chkpass").value;

    if (newPassword !== confirmPassword) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }

    // PUT 요청 보내기
    fetch('/changePassword', {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            email: dto.m_email, // 이메일을 서버로 전송
            mpass: mpass // 새 비밀번호
        })
    })
    .then(response => {
        if (response.ok) {
            alert("비밀번호가 변경되었습니다.");
            window.location.href = '/login.jsp';  // 비밀번호 변경 후 리다이렉트
        } else {
            alert("비밀번호 변경에 실패했습니다.");
        }
    })
    .catch(error => {
        console.error("Error during PUT request:", error);
    });
}</script>
</html>