<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${pList eq null}">
	<br>
	<div id="hideListEmptyText">
			Empty temporary posts.
	</div>
</c:if>
<c:if test="${pList ne null }">
	<c:forEach items="${pList }" var="post">
		<div class="hideListContent" onclick="modifyTempPost('${post.pNo}')">
			<div class="Title">
				<a href="#" class="atitle">${post.title }</a>
				<div class="contentimg" onclick="delTempPost(this, '${post.pNo}')">
					<img style="width: 15px;" src="resources/images/close.png" />
				</div>
			</div>
			<div class="pageNum">MaxPage : ${post.mPage }</div>
			<div class="saveDate">Saved : ${post.tDate }</div>
			<div class="createDate">Created : ${post.wDate }</div>
		</div>
		<div class="line"></div>
	</c:forEach>
</c:if>
<!-- 반복문 쓸때 hideListContent부터 line까지 묶을 것 -->