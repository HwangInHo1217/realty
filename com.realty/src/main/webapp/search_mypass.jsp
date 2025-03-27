<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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



<c:if test="${empty sessionScope.dto}">
    <p>세션에 유효한 회원 정보가 없습니다.</p>
</c:if>
	<%@include file="./top.jsp"%>
	<%@include file="./quickmenu.jsp"%>
	<main>
		<form id="frm" method="post" action="changePassword">
		<!-- 세션에서 'dto' 객체를 가져와서 사용하기 -->
		<c:if test="${not empty sessionScope.dto}">
		    
		    <!-- dto 객체의 속성 값 출력 -->
		    <input type="hidden" name="m_email" value="${sessionScope.dto.m_email}" >
		    
		    <!-- dto 객체의 다른 속성들도 출력할 수 있습니다. -->
		</c:if>
			<section class="sub">
				<div>
					<ul>
						<li>회원가입 정보에 따른 패스워드 변경</li>
					</ul>
				</div>
				<div class="text1 repass">

					<div>
						<input type="password" name="m_pass"
							placeholder="최소 10 ~ 16자 (영문,숫자,특수 문자 조합)로 입력해주세요."
							class="passin" autocomplete="none">
					</div>
					<div>
						<input type="password" name="chkpass" placeholder="동일한 비밀번호를 입력하세요"
							class="passin" autocomplete="none">
					</div>
				</div>
				<div>
					<input type="button" onclick="submitPasswordChange()"
						value="비밀번호 변경" class="search_submit">
				</div>
			</section>
		</form>
	</main>
	<%@include file="./copyright.jsp"%>
</body>
<script>
	
	// 비밀번호 변경을 위한 PUT 요청 보내기
	function submitPasswordChange() {
		let newPassword = frm.m_pass.value;
		let confirmPassword=frm.chkpass.value;
		
		if(newPassword==""){
			alert("값을 입력해야합니다.");
			return;
		}
		
		if (newPassword !== confirmPassword) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		} else {
			frm.submit();
		}

	}
</script>
</html>