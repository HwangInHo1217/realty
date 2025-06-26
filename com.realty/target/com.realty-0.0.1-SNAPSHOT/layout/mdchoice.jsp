<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
/* 카드 전체 영역을 가로로 정렬 */
.board-card-list {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	padding: 0;
	margin: 0;
	list-style: none;
	justify-content: center;
}

/* 각 카드 */
.board-card {
	width: 220px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0,0,0,0.1);
	padding: 10px;
	cursor: pointer;
	transition: transform 0.2s;
	text-align: center;
	background-color: #fff;
}

/* 호버 효과 */
.board-card:hover {
	transform: translateY(-5px);
}

/* 썸네일 이미지 */
.board-thumbnail img {
	width: 100%;
	height: 140px;
	object-fit: cover;
	border-radius: 6px;
}

/* 제목 스타일 */
.board-title {
	display: block;
	font-weight: bold;
	font-size: 15px;
	margin: 10px 0 5px 0;
	color: #333;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

/* 본문 요약 */
.board-content {
	font-size: 13px;
	color: #555;
	line-height: 1.4;
	height: 2.8em;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>

<section>
	<div class="recommend">
		<p>
			추천분양정보<br>
			<em>실시간 추천 분양정보를 한곳에!</em>
		</p>
		<div class="md_estates">
			<ul class="board-card-list">
				<c:forEach var="board" items="${recentBoards}">
					<li class="board-card" onclick="goboardview(${board.board_idx})">
						<div class="board-thumbnail">
							<img src="${pageContext.request.contextPath}${board.b_img_url}" alt="썸네일 이미지">
						</div>
						<span class="board-title">${board.b_title}</span>
						<div class="board-content">
							<c:out value="${fn:substring(board.b_content, 0, 40)}" />
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</section>
<script>
	function goboardview(idx){
		location.href="./board/"+idx;
	}
	
</script>