<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${not empty sessionScope.member }">
	<script>
	alert("로그인한 사용자는 이용 불가");
	location.href="./index.jsp";		
	</script>
</c:if>