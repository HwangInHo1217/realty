<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금주 분양 매물 정보</title>
<link rel="stylesheet" type="text/css" href="../css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="../css/week_tails.css?v=1">
</head>
<body>
<%@ include file="./layout/top.jsp" %>
<%@ include file="./layout/session_no.jsp"%>
<main>
	<div class="weektails">
		<p>분양정보</p>
		<div id="weektails">
<c:if test="${not empty sale}">
			<p>LH센트럴힐(공공임대)</p>
            <ul>
                <li>종류</li>
                <li>${sale.s_name} | ${sale.s_let} </li>
                <li>주소</li>
				<li>${sale.s_addr}</li>
                <li>규모</li>
				<li>${sale.s_total} |${sale.s_part} </li>
                <li>시기</li>
				<li>${sale.s_Bdate} |${sale.s_Adate}</li>
                <li>난방구조</li>
				<li>${sale.s_heatStruct}</li>
                <li>건설사</li>
				<li>${sale.s_corp}</li>
                <li>사진정보</li>
				<li><img src="../room/${sale.s_file_ori}"></li>
            </ul>
</c:if>	
		</div>
		<c:if test="${r_dto.m_idx ne sessionScope.member.m_idx}">
        <div><button class="btn_css" onclick="goReservation(${sale.sales_idx})">방문예약</button></div>
		</c:if><c:if test="${r_dto.m_idx eq sessionScope.member.m_idx}">
        <div><button class="btn_close" onclick="goDetailReservation(${r_dto.reservation_idx})">방문예약완료</button></div>
        </c:if>
	</div>
	<form id="frm">
		<input type="hidden" value="" name="id">
	</form>
</main>
<%@ include file="./layout/copyright.jsp" %>

</body>
<script>
function goReservation(idx){
	frm.id.value=idx;
	frm.method="get";
	frm.action="${pageContext.request.contextPath}/reservation";
	console.log(frm.id.value);
	frm.submit();
}
function goDetailReservation(idx){
	frm.method="get"
	frm.action="${pageContext.request.contextPath}/reservation/"+idx;
	frm.id.value=idx;
	frm.submit();
}
</script>
</html>