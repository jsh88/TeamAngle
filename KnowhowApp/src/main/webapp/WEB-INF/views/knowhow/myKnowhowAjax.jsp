<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="" items="">
	<div class="knowhowlist" >
		<div><a href="#"><b>Title</b></a></div>
			<div id="list">
				<span class="l">2016.02.02 18:17:32</span>
				<span class="l"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
				<span><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
			</div>
		<div id="listline"></div>
	</div>
</c:forEach>	
</body>
</html>