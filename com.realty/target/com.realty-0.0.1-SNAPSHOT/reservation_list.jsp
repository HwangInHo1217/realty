<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--최상단-->
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css"
	href="./css/reservation_list.css?v=5">
<style>
.box {
	width: 800px;
	height: 300px;
	border: 1px solid black;
	overflow: auto;
}
</style>
<%@ include file="./layout/top.jsp"%>
<%@ include file="./layout/session_no.jsp"%>
<main>
	<section class="sub">
		<p>모델 하우스 방문 예약 리스트</p>
		<div class="boards">모델 하우스 방문 예약한 정보를 한눈에 확인 하실 수 있습니다.</div>
		<div class="info_board">
			<ul>
				<li>NO</li>
				<li>아파트명</li>
				<li>방문일자</li>
				<li>방문시간</li>
				<li>인원수</li>
				<li>취소</li>
			</ul>
			<ul style="display: block;">
				<c:if test="${empty reservations}">
					<li class="nodata">등록된 방문 예약이 없습니다.</li>
				</c:if>
			</ul>

			<c:forEach var="r" items="${reservations}" varStatus="status">
				<ul class="data_view">
					<li>${status.count}</li>
					<li style="text-align: left;">${r.s_name}</li>
					<li>${r.r_date}</li>
					<li>${r.r_time}</li>
					<li>${r.r_visitNum}</li>
					<li>
						  <form method="post" action="${pageContext.request.contextPath}/reservation-cancel">
        <input type="hidden" name="reservation_idx" value="${r.reservation_idx}">
        <input type="hidden" name="m_tel" value="${r.m_tel}">
        <input type="submit" value="취소" class="cancel_btn">
						</form>
					</li>
				</ul>
			</c:forEach>
		</div>
	</section>
</main>
<%@include file="./layout/copyright.jsp"%>