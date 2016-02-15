<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>


	$(document).ready(function(){
		
		$("#myModal").modal();
		
		$("#o").hide();
		$("#n").hide();
		$("#c").hide();
		$("#r").hide();
		
		});
	
 	$('#postByViews').click(function(){
		
			$("#o").show();
			$("#n").hide();
			$("#c").hide();
			$("#r").hide();
	});
 	$('#postByNews').click(function(){
		
			$("#o").hide();
			$("#n").hide();
			$("#c").hide();
			$("#r").show();
 	});
 	$('#postByReply').click(function(){
		
			$("#o").hide();
			$("#n").show();
			$("#c").hide();
			$("#r").hide();
 	});
 	$('#postByRcomm').click(function(){
		
			$("#o").hide();
			$("#n").hide();
			$("#c").show();
			$("#r").hide();
	});
	
	
</script>
</head>
<body>
	<div class="modal fade" id="myModal" data-backdrop="static">
		<div class="modal-dialog" id="myPostList">
			<div class="modal-content" id="myContent">
				<div id="myWrap">
					<div id="myTitle">
						<div id="Closeimg"
							onclick="javascript:$('#myPostList').modal('hide');">
							<a href="#"><img style="width: 20px;"
								src="resources/images/close.png" /></a>
						</div>
						<div id="Title">MyKnowhow</div>
						<div id="description"></div>
						<div id="listDiv" style="overflow: scroll; overflow-x: hidden;">
							<span class="d" id="o">&nbsp;-조회 수 높은 knowhow <c:if
									test="${ empty mypList }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if> <c:if test="${ not empty mypList }">
									<c:forEach items="${ mypList }" var="myp">

										<div class="knowhowlist">
											<span><a href="#"><b>${ myp.title }</b></a></span>
											<div id="list">
												<span class="l">${ myp.wDate }</span> <span class="l"
													onclick="modifyPostStart('${ myp.pNo }')"><a href="#"><img
														style="width: 30px;" src="resources/images/modify.png" /></a></span>
												<span><a href="#"><img style="width: 30px;"
														src="resources/images/delete.png" /></a></span>
											</div>
											<div id="listline"></div>
										</div>

									</c:forEach>
								</c:if>
							</span> <span class="d" id="n">&nbsp;-최근 knowhow <c:if
									test="${ empty mypList }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if> <c:if test="${ not empty mypList }">
									<c:forEach items="${ mypList }" var="myp">

										<div class="knowhowlist">
											<span><a href="#"><b>${ myp.title }</b></a></span>
											<div id="list">
												<span class="l">${ myp.wDate }</span> <span class="l"
													onclick="modifyPostStart('${ myp.pNo }')"><a href="#"><img
														style="width: 30px;" src="resources/images/modify.png" /></a></span>
												<span><a href="#"><img style="width: 30px;"
														src="resources/images/delete.png" /></a></span>
											</div>
											<div id="listline"></div>
										</div>

									</c:forEach>
								</c:if>
							</span> <span class="d" id="c">&nbsp;-댓글 많은 knowhow <c:if
									test="${ empty mypList }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if> <c:if test="${ not empty mypList }">
									<c:forEach items="${ mypList }" var="myp">

										<div class="knowhowlist">
											<span><a href="#"><b>${ myp.title }</b></a></span>
											<div id="list">
												<span class="l">${ myp.wDate }</span> <span class="l"
													onclick="modifyPostStart('${ myp.pNo }')"><a href="#"><img
														style="width: 30px;" src="resources/images/modify.png" /></a></span>
												<span><a href="#"><img style="width: 30px;"
														src="resources/images/delete.png" /></a></span>
											</div>
											<div id="listline"></div>
										</div>

									</c:forEach>
								</c:if>
							</span> <span class="d" id="r">&nbsp;-추천 높은 knowhow <c:if
									test="${ empty mypList }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if> <c:if test="${ not empty mypList }">
									<c:forEach items="${ mypList }" var="myp">

										<div class="knowhowlist">
											<span><a href="#"><b>${ myp.title }</b></a></span>
											<div id="list">
												<span class="l">${ myp.wDate }</span> <span class="l"
													onclick="modifyPostStart('${ myp.pNo }')"><a href="#"><img
														style="width: 30px;" src="resources/images/modify.png" /></a></span>
												<span><a href="#"><img style="width: 30px;"
														src="resources/images/delete.png" /></a></span>
											</div>
											<div id="listline"></div>
										</div>

									</c:forEach>
								</c:if>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div id="knowhowCList">
				<div id="lineback"></div>
				<div id="postit">
					<div id="postByViews" class="cate1"
						onclick="showViews('${ member.id }');">Views</div>
					<div id="postByNews" class="cate2"
						onclick="showNews('${ member.id }');">News</div>
					<div id="postByReply" class="cate3"
						onclick="showReply('${ member.id }');">Reply</div>
					<div id="postByRcomm" class="cate4"
						onclick="showRcomm('${ member.id }');">Rcomm</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>