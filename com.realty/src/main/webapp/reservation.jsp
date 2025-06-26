<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모댈 하우스 사전 방문예약</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/reservation.css?v=4">
</head>
<body>
<%@ include file="./layout/top.jsp"%>
<%@include file="./layout/session_no.jsp"%>
<main>
<form id="frm" method="post" action="${pageContext.request.contextPath}/reservation">
<section class="sub">
<p>모델 하우스 사전 방문예약</p>
<div>
<span class="list_title">
<span style="color: blue;">분양정보</span>
<span style="color: red;">${sale.s_name}123</span>
</span>
<ul class="sub_ul">
<li>방문일시</li>    
<li><input type="date" name="r_date" class="sel_input"></li> 
<li>방문시간</li>    
<li>
<select class="sel_input2" name="r_time">
    <option value="">방문시간선택</option>
    <option value="09:00">09:00</option>
    <option value="11:00">11:00</option>
    <option value="13:00">13:00</option>
    <option value="15:00">15:00</option>
    <option value="17:00">17:00</option>
</select> * 해당 시간에 맞춰서 방문해 주셔야 합니다.
</li> 
<li>방문자명</li>    
<li><input type="text" class="sel_input" name="m_name" value="${sessionScope.member.m_name}" name="m_name" readonly></li> 
<li>방문인원</li>    
<li>
<label><input type="radio" class="sel_check" name="r_visitNum" value="1명" checked > 1명</label>
<label><input type="radio" class="sel_check" name="r_visitNum" value="2명"> 2명</label> ※ 방문인원은 최대 2명까지 입니다.
</li>   
<li>연락처</li>    
<li><input type="text" name="m_tel"class="sel_input" value="${sessionScope.member.m_tel}" readonly></li>       
</ul>
</div>
<div>
<input type="button" value="방문 예약등록" onclick="saveReservation()">
</div>
</section>
<input type="hidden" name="s_name" value="${sale.s_name}">
<input type="hidden" name="m_idx" value="${member.m_idx}">
<input type="hidden" name="sales_idx" value="${sale.sales_idx}">

</form>
</main>
<%@include file="./layout/copyright.jsp"%>
</body>
<script>
function saveReservation(){
	frm.submit();
}
/* function datacheck(){
	let day=new Date();
	//let edate=day.getFullYear()+""+day.getMonth()+1+""+day.getDate(); //년월일(yyyymmdd형식)
	//let sdate=frm.r_date.vlaue.replaceAll("-","");//사용자가 입력한 값 yyyy-mm-dd를 yyyymmdd로 변환 실무에서 안쓰이는 코드
	var date=new Date();//오늘
	var sdate=date.toISOString().split('T')[0];
	if(edate<sdate){
		alert('해당 날짜는 선택 불가능 합니다.');
	}else{
		let ss =String(date.getMinures()).padStrat(2,"0");
		let t=date.getHours()+""+ss;//현재시간
		let time=date.getTime()""+date.getMinutes();//현재시간+분까지
		let userTime=frm.rtime.vlaue+""+0;//위의 시간과 분 비교하기위해 ""+0
		if(t>ut){
			alert('해당 시간은 선택 불가능 합니다.')
		}else{
			if(confirm){
				alert("예매하시겠습니까");			}
		}
	}
	} 
}*/
</script>
</html>