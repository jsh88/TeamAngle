<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="myKnowhowList">
	<c:if test="${ empty mypList }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
	<c:if test="${ not empty mypList }">
		<c:forEach var="myp" items="${ mypList }">

			<div class="knowhowlist">
				<span onclick="morePost('${myp.pNo}')"><a href="#"><b>${ myp.title }</b></a></span>
				<div id="list">
					<span class="l">${ myp.wDate }</span> <span class="l"
						onclick="modifyPostStart('${ myp.pNo }')"><a href="#"><img
							style="width: 30px;" src="resources/images/modify.png" /></a></span> <span
						onclick="delPost(this, '${myp.pNo}')"><a href="#"><img
							style="width: 30px;" src="resources/images/delete.png" /></a></span>
				</div>
			</div>

		</c:forEach>
	</c:if>
</div>
