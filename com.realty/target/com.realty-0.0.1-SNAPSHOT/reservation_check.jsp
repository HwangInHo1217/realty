<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모댈 하우스 사전 방문예약 확인</title>
<link rel="stylesheet" type="text/css" href="../css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="../css/reservation.css?v=4">
</head>
<body>
<%@ include file="./layout/top.jsp" %>
<%@ include file="./layout/session_no.jsp" %>
<main>
<c:if test="${not empty dto}">
<section class="sub">
<p>모델 하우스 사전 방문예약 확인</p>
<div>
<span class="list_title">
<span style="color: blue;">분양정보</span>
<span style="color: red;">${dto.s_name}</span>
</span>
<ul class="sub_ul">
<li>방문일시</li>    
<li><input type="text" class="sel_input" value="${dto.r_date}" disabled></li> 
<li>방문시간</li>    
<li>
<input class="sel_input2" value="${dto.r_time}" disabled>* 해당 시간에 맞춰서 방문해 주셔야 합니다.
</li> 
<li>방문자명</li>    
<li><input type="text" class="sel_input" value="${dto.m_name}" disabled></li> 
<li>방문인원</li>    
<li>${dto.r_visitNum} ※ 방문인원은 최대 2명까지 입니다.</li>   
<li>연락처</li>    
<li><input type="text" value="${dto.m_tel}" class="sel_input" disabled></li>       
</ul>
</div>
<div>
<input type="button" value="메인페이지로 이동" onclick="goPage()">
</div>
</section>
</c:if>
</main>
<%@ include file="./layout/copyright.jsp" %>
</body>
<script>
function goPage(){
 location.href="${pageContext.request.contextPath}/index";
}
</script>
</html>