<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="./css/index.css?v=7">
  <link rel="stylesheet" type="text/css" href="./css/member_join.css?v=3">
<style>
.box {
   width: 800px;
   height: 300px;
   border: 1px solid black;
   overflow: auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
<%@include file="./layout/top.jsp" %>
<%@include file="./layout/session_ok.jsp" %>
<main>
	<form id="f" method="post" action="${pageContext.request.contextPath}/join">
		<p>이메일로 회원가입</p>
		<div>
			<a>이메일</a> <input type="text" placeholder=" 이메일 주소를 입력해주세요." autocomplete="none" style="width:400px; float:left;" name="m_email"> <input type="button" value="중복체크" class="mail_btn">
		</div>
		<div>
			<a>비밀번호</a> <input type="password" placeholder=" 10~16자(영문,숫자,특수 문자 조합)로 입력해주세요." autocomplete="none" name="m_pass">
		</div>
		<div>
			<a>비밀번호 확인</a> <input type="password"  placeholder=" 비밀번호를 다시 한 번 입력해주세요." autocomplete="none" name="m_pass_ck">
		</div>
		<div>
		    <a>이름</a> <input type="text" placeholder=" 이름을 입력해주세요." autocomplete="none" name="m_name">
		</div>
		<div>
		    <a>휴대폰번호</a> <input type="text" placeholder=" -없이 숫자만 입력해주세요." autocomplete="none" name="m_tel">
		</div>
		<div>
		<input type="checkbox" id="all" onclick="all_chk()"> <span>전체 동의</span> </div>
		
		<div class="line"></div>
		
	<div class="bottom">	
		<div class="box1"><input type="checkbox" name="age_ck" id="age_ck"> <a class="a1">(필수) <span>만 14세 이상입니다.</span></a></div>
		<div class="box2"><input type="checkbox" name="m_tos" id="m_tos"> <a class="a2">(필수) <span><u>이용약관</u>에 동의</span></a></div>
		<div class="box3"><input type="checkbox" name="m_pic" id="m_pic"> <a class="a3">(필수) <span><u>개인정보 수집 및 이용</u>에 동의</span></a></div>
		<section class="text1">   </section>
		<div class="box4"><input type="checkbox" name="m_ms" id="m_ms"> <span>(선택) 마케팅 수신에 동의</span></div>
		<section class="text2">   </section>
	</div>
		<div><input type="button" value="가입 하기" onclick="joinOk()"></div>
	</form>
</main>
<%@include file="./layout/copyright.jsp" %>
</body>
<script src="./js/member_join.js?v=2"></script>
</html>