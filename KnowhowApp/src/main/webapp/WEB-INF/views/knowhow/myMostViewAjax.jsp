<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ empty most }">
								Recently viewed Post does not exist
							</c:if>
<c:if test="${ not empty most }">
	<c:forEach items="${ most }" var="m">

		<div class="mostViewedWrap">
			<div class="mostListTitle" onclick="morePost('${m.pNo}')">
				<a href="#" class="mostListDetailTitle">${ m.title }</a>

				<div class="mostClose" onclick="">
					<img style="width: 15px;" src="resources/images/close.png" />
				</div>

			</div>
			<div class="mostDate">CreateDate : ${ m.wDate }</div>

			<div class="mostNum">
				<div class="mostGood">Good : ${ m.good }</div>
				<div class="mostCount">ViewCount : ${ m.count }</div>
				<div class="mostNickname">Nickname : ${ m.nickName }</div>
			</div>
		</div>
		<div class="mostLine"></div>

	</c:forEach>
</c:if>