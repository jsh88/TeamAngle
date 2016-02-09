<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
	<c:if test="${pComList ne null}">
		<script type="text/javascript">$("#replyNum").text("${fn:length(pComList)}");</script>
	<c:forEach items="${pComList}" var="pCom" varStatus="status">
	<div class="replyView">
 		<div class="replyProfile">
 			<img src="${pCom.image }" class="img-responsive img-rounded profileImg">
 		</div>
 		<div class="replyInfo">
 			<div class="replyNickname">
 			 	<a href="#">${pCom.nickName }</a>
 			</div>
 			<div class="replyDate">${pCom.wDate }</div>
		</div>
 			<div class="replyModifyDelete">
 			<c:if test="${pCom.nickName eq session.member.nickName}">
 				<a href="#"><img style="width:20px;" src="resources/images/modify.png"/></a>&nbsp;
 				<a href="#"><img style="width:20px;" src="resources/images/delete.png"/></a>
 			</c:if>
 			<c:if test="${pCom.nickName ne session.member.nickName}">
 				<a href="#"><img style="width:20px;" src="resources/images/modify.png"/></a>&nbsp;
 				<a href="#"><img style="width:20px;" src="resources/images/delete.png"/></a>
 			</c:if>
 			</div>
 				<div class="replycontents" style="overflow: auto; overflow-x:hidden;">
 						${pCom.content}
 				</div>
 			<div class="replyline"></div>
 	</div>
 	</c:forEach>
 	</c:if>
 	<c:if test="${pComList eq null}">
 		<center><h2>댓글이 없습니다.</h2></center>
 	</c:if>
</body>
</html>