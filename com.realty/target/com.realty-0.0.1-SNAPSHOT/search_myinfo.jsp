<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css"
	href="./css/search_myinfo.css?v=2">
</head>
<body>
	<%@ include file="./layout/top.jsp"%>
	<%@ include file="./layout/quickmenu.jsp"%>
	<%@include file="./layout/session_ok.jsp" %>
	<main>
		<section class="sub">
			<div>
				<ul>
					<li>회원가입된 이메일 확인</li>
				</ul>
			</div>
			<div class="text1">
				<c:if test="${not empty mail}">
				<div>가입하신 이메일 정보 :${mail}</div>
				</c:if>
				<c:if test="${not empty error}">
				<div>가입하신 이메일 정보 : ${error}</div>
				</c:if>
			</div>
			<div>
				<input type="button" value="정보확인" class="search_submit" onclick="gologin()">
			</div>
		</section>
	</main>
	<%@ include file="./layout/copyright.jsp"%>
</body>
<script>
	 function gologin(){
		 location.href="./login.jsp";
	 }
</script>
</html>