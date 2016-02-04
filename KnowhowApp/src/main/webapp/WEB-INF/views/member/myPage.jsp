<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ member.id eq null }">
		<c:redirect url="/member/login.jsp"/>
	</c:if>
	<c:forEach var="m" items="${ member ne null }">
		${ m.id }
	</c:forEach>
</body>
</html>