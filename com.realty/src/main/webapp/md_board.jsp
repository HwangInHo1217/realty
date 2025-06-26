<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/md_board.css?v=5">
<style>
.box {
	width: 800px;
	height: 300px;
	border: 1px solid black;
	overflow: auto;
}
</style>
</head>
<body>
	<%@include file="./layout/top.jsp"%>
	<%@include file="./layout/session_no.jsp"%>
	<main>
		<c:if test="${not empty success}">
			<script>
			alert("${success}");
			location.href="${pageContext.request.contextPath}/board-list";
			</script>
		</c:if>
		<c:if test="${not empty error}">
			<script>
			alert("${error}");
			location.href="${pageContext.request.contextPath}/board-list";
			</script>
		</c:if>
		<section class="sub">
			<p>추천분양 정보 게시판</p>
			<div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
			<div class="info_board">

				<ul>
					<li>NO</li>
					<li>제목</li>
					<li>글쓴이</li>
					<li>조회수</li>
					<li>등록일</li>
				</ul>
				<c:if test="${empty boards }">
					<ul style="display: none;">
						<li class="nodata">등록된 게시물이 없습니다.</li>
					</ul>
				</c:if>
				<c:if test="${not empty boards}">
					<c:forEach var="board" items="${boards}">
						<ul class="data_view">
							<li>${board.board_idx}</li>
							<li style="text-align: left;"
								onclick="goBoardView(${board.board_idx})">${board.b_title}</li>
							<li>${board.b_writer}</li>
							<li>${board.b_view_cnt}</li>
							<li>${board.b_date}</li>
						</ul>
					</c:forEach>
				</c:if>
			</div>
			<div class="info_pageing">
				<ol>
					<cr:set var="pageidx"
						value="${total / 10 + (1-((total / 10) % 1)) % 1}" />
					<cr:forEach var="no" begin="1" end="${pageidx}" step="1">
						<li>${no}0</li>
					</cr:forEach>
				</ol>
			</div>
			<form id="frm">
				<div class="info_search">
					<input type="text" class="search_text" name="searchText"
						placeholder="검색어를 입력하세요"> <input type="button" value="검색"
						onclick="goSearch()" class="search_btn">
				</div>
			</form>

		</section>
	</main>
	<%@include file="./layout/copyright.jsp"%>
</body>
<script>
 	function goBoardView(idx){
 		frm.method="get";
 		frm.action="${pageContext.request.contextPath}/board/"+idx
 		frm.submit();
 	}
 	function goSearch(){
 		frm.method="get";
 		frm.action="${pageContext.request.contextPath}/board-list"
 		frm.submit();
 	}
</script>
</html>