<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담신청</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/counsel.css?v=3">
</head>
<body>
	<%@ include file="./layout/top.jsp"%>
	<%@ include file="./layout/session_no.jsp"%>
	<main>
		<section class="sub">
			<p>상담신청</p>
	<form id="frm" method="post" action="${pageContext.request.contextPath}/addCounsel">
			<div>
				<span class="list_title">◎ <span style="color: blue;">상담자
						정보</span></span>
				<ul class="sub_ul">
					<li>상담자명</li>
					<li><input type="text" class="sel_input" name="m_name" value="${dto.m_name}"
						readonly></li>
					<li>이메일</li>
					<li><input type="text" class="sel_input"
						value="${dto.m_email}" name="m_email" readonly></li>
					<li>연락처</li>
					<li><input type="text" class="sel_input" name="m_tel" value="${dto.m_tel}" readonly></li>
					<li>임대형태</li>
					<li>
						<label>
							 <input type="radio" class="sel_check" name="c_rental" value="공공임대">공공임대
						</label> 
						<label>
							<input type="radio" class="sel_check" name="c_rental" value="민간임대">민간임대
						</label> 
						<label>
							<input type="radio" class="sel_check" name="c_rental" value="민간분양">민간분양
						</label> 
						<label>
							<input type="radio" class="sel_check" name="c_rental" value="기타">기타
						</label>
					</li>
					<li>주거형태</li>
					<li>
					<label>
						<input type="radio" class="sel_check" value="아파트" name="c_type">
							아파트
					</label>
					 <label>
							 <input type="radio" class="sel_check" name="c_type" value="빌라, 단독주택">
							빌라,단독주택
					</label> 
					<label>
							<input type="radio" class="sel_check" name="c_type" value="사무실, 상가, 빌딩">
							사무실.상가.빌딩
					</label>
					</li>
			<li>상담일시</li>
					<li><input type="date" class="sel_input2" name="counselDate"> * 해당 일시에
						맞춰서 담당자가 연락 드립니다.</li> 
					<li>상담내용</li>
					<li style="height: 150px !important; line-height: 150px;"><textarea
							class="sel_input3" placeholder="구체적인 상담내용을 입력해 주세요" name="c_content"></textarea></li>
				</ul>
			</div>
		</form>
			<div>
				<input type="button" value="상담신청" onclick="saveCounsel()">
			</div>
		</section>
	</main>
	<%@ include file="./layout/copyright.jsp"%>
</body>
<script >
	function saveCounsel(){
		frm.submit();
	}
</script>
</html>