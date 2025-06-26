<%-- login.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
    <link rel="stylesheet" type="text/css" href="./css/login.css?v=2">
</head>
<body>
    <%@include file="./layout/top.jsp" %>
	<%@include file="./layout/session_ok.jsp" %>
    <main>
    <form id="frm" method="post" action="${pageContext.request.contextPath}/login">
        <aside class="login_pg">    
            <p>이메일로 시작하기</p>
            <div><input type="text" name="m_email" placeholder="이메일 주소"></div>
            <div><input type="password" name="m_pass" placeholder="비밀번호"></div>
            <div><input type="button" value="로그인" onclick="login()"></div>
            <!-- <div><input type="button" value="카카오로그인" class="kakao_btn"></div> -->
            <div>
                <span><a href="./email_search.jsp">이메일 찾기</a></span>
                <span><a href="./passwd_search.jsp">비밀번호 찾기</a></span>
            </div>
        </aside>
    </form>
    </main>

    <%@ include file="./layout/copyright.jsp" %>

    <script src="./js/login.js"></script>

    <!-- 로그인 실패 메시지 표시 -->
    <c:if test="${not empty error}">
        <script type="text/javascript">
            alert("${error}");
        </script>
    </c:if>
</body>
</html>
