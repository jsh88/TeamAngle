<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result ne null }">
	<script>
		alert("인정ㅋ");
		location.href = "index";
	</script>
</c:if>
<c:if test="${result eq null }">
	<script>
		alert("정상적인 접근이 아닙니다.");
		location.href = "index";
	</script>
</c:if>