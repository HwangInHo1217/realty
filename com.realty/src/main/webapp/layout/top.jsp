<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--최상단-->
<header>
	<div class="top_banner"></div>
</header>
<!--최상단끝-->
<nav>
	<div class="menus">
		<ul class="menus_ul">
			<li><img src="./logo/e_click_logo.png"></li>
			<li>일반매물</li>
			<li>추천매물</li>
			<li>중계의뢰</li>
			<li onclick="goCounsel()">상담신청</li>
			<li>업체의뢰</li>
			<li>의뢰현황</li>
			<c:if test="${not empty sessionScope.member}">
      		${sessionScope.member.m_name}님 환영합니다.
      		<a class="menus_ul" onclick="logout()">[로그아웃]</a>
      </c:if>
			<c:if test="${empty sessionScope.member }">
				<li class="logins"><a href="./login.jsp"><span title="로그인"><img
						src="./ico/login.svg"></span></a><a href="./member_join.jsp"> <span title="회원가입"><img
						src="./ico/membership.svg"></span></a></li>
			</c:if>
		</ul>
	</div>
	<form id="top_frm">
		<c:if test="${not empty sessionScope.member}">
			<input type="hidden" name="m_name"
				value="${sessionScope.member.m_name}">
			<input type="hidden" name="m_email"
				value="${sessionScope.member.m_email}">
			<input type="hidden" name="m_tel"
				value="${sessionScope.member.m_tel}">
		</c:if>
	</form>
</nav>
<script>
	function goCounsel(){
		top_frm.action="${pageContext.request.contextPath}/requestCounsel";
		top_frm.method="post";
		top_frm.submit();
	}
	function logout(){
		top_frm.method="get";
		top_frm.action="${pageContext.request.contextPath}/logout";
		top_frm.submit();
	}
</script>
<!--메뉴끝-->