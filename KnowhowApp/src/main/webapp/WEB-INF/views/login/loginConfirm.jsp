<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인후 확인</title>
</head>
<body>
	<div>${sessionScope.member.id}</div>
	<div>${sessionScope.member.nickName}</div>
	<div>${sessionScope.member.pw}</div>
	<div>${sessionScope.member.jDate}</div>
</body>
</html>