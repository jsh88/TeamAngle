<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ empty lately }">
							Recently viewed Post does not exist
						</c:if>
<c:if test="${ not empty lately }">
	<c:forEach items="${ lately }" var="l">

		<div class="recentlyViewedWrap">
			<div class="recentlyListTitle" onclick="morePost('${l.pNo}')">
				<a href="#" class="recentlyListDetailTitle">${ l.title }</a>

				<div class="recentlyClose" onclick="">
					<img style="width: 15px;" src="resources/images/close.png" />
				</div>

			</div>
			<div class="recentlyDate">CreateDate : ${ l.wDate }</div>

			<div class="recentlyNum">
				<div class="recentlyGood">Good : ${ l.good }</div>
				<div class="recentlyCount">ViewCount : ${ l.count }</div>
				<div class="recentlyNickname">Nickname : ${ l.nickName }</div>
			</div>
		</div>
		<div class="recentlyLine"></div>

	</c:forEach>
</c:if>
