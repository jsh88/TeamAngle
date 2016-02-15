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
			<div id="myKnowhowList">
				<c:if test="${ empty mypList }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
				<c:if test="${ not empty mypList }">
					<c:forEach items="${ mypList }" var="myp">

						<div class="knowhowlist">
							<span><a href="#"><b>${ myp.title }</b></a></span>
							<div id="list">
								<span class="l">${ myp.wDate }</span> <span class="l"
									onclick="modifyPostStart('${ myp.pNo }')"><a href="#"><img
										style="width: 30px;" src="resources/images/modify.png" /></a></span> <span><a
									href="#"><img style="width: 30px;"
										src="resources/images/delete.png" /></a></span>
							</div>
						</div>

					</c:forEach>
				</c:if>
			</div>
				<span class="l"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
				<span><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
			</div>
			
		</div>
</c:forEach>	
</body>
</html>