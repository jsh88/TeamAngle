<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
 			<c:if test="${pCom.nickName ne session.member.nickName}">
 				<img class="modifyComImg" style="width:20px; cursor: pointer;" onclick="modifyComment(this, '${pCom.cNo }')" src="resources/images/modify.png"/>&nbsp; 				 				
 				<img style="width:20px; cursor: pointer;" onclick="delComment('${pCom.cNo }')" src="resources/images/delete.png"/>
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
 	<br>
 		<center><h4>댓글이 없습니다.</h4></center>
 		<script type="text/javascript">$("#replyNum").text("0");</script>
 	</c:if>