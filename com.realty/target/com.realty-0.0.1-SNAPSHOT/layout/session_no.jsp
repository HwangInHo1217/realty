<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${empty sessionScope.member}">
	<script>
	alert("로그인후 이용가능");
	location.href="/com.realty/index";		
	</script>
</c:if>