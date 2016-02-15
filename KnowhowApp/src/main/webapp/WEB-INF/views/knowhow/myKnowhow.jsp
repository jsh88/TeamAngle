<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		
		$("#myModal").modal();
		
		$("#o").show();
		$("#n").hide();
		$("#c").hide();
		$("#r").hide();
		
		});
	
	function showViews(){
		
			$("#o").show();
			$("#n").hide();
			$("#c").hide();
			$("#r").hide();
	}
	function showRcomm(){
		
			$("#o").hide();
			$("#n").hide();
			$("#c").hide();
			$("#r").show();
	}
	function showNews(){
		
			$("#o").hide();
			$("#n").show();
			$("#c").hide();
			$("#r").hide();
	}
	function showReply(){
		
			$("#o").hide();
			$("#n").hide();
			$("#c").show();
			$("#r").hide();
	}
</script>
</head>
<body>
	<div class="modal fade" id="myModal" data-backdrop="static">
		<div class="modal-dialog" id="myPostList">
				<div class="modal-content" id="myContent">
				<div id="myWrap">
					<div id="myTitle">
						<div id="Closeimg" onclick="javascript:$('#myPostList').modal('hide');"><a href="#"><img style="width:20px;" src="resources/images/close.png"/></a></div>
						<div id="Title">MyKnowhow</div>
						<div id="description">
							
						</div>
						<div id="listDiv" style="overflow:scroll; overflow-x:hidden;">
						<span class="d" id="o">&nbsp;-조회 수 높은 knowhow
							<c:if test="${ empty getMyPostByViews }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyPostByViews }">
									<c:forEach items="${ getMyPostByViews }" var="v">
										
										<div class="knowhowlist" >
												<span><a href="#"><b>${ v.title }</b></a></span>
												<div id="list">
														<span class="l">${ v.wDate }</span>
														<span class="l" onclick="modifyPostStart('${ v.pNo }')"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
														<span><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
												</div>
												<div id="listline"></div>
										</div>
									
									</c:forEach>
								</c:if>
								</span>
							<span class="d" id="n">&nbsp;-최근 knowhow
							<c:if test="${ empty getMyLatelyPost }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyLatelyPost }">
									<c:forEach items="${ getMyLatelyPost }" var="n">
										
										<div class="knowhowlist" >
												<span><a href="#"><b>${ n.title }</b></a></span>
												<div id="list">
														<span class="l">${ n.wDate }</span>
														<span class="l"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
														<span><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
												</div>
												<div id="listline"></div>
										</div>										
						
									</c:forEach>
								</c:if>
							</span>
							<span class="d" id="c">&nbsp;-댓글 많은 knowhow
							<c:if test="${ empty getMyPostByComments }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyPostByComments }">
									<c:forEach items="${ getMyPostByComments }" var="c">
										
										<div class="knowhowlist" >
												<span><a href="#"><b>${ c.title }</b></a></span>
													<div id="list">
														<span class="l">${ c.wDate }</span>
														<span class="l"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
														<span><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
													</div>
												<div id="listline"></div>
										</div>																			

									</c:forEach>
								</c:if>
							</span>
							
							<span class="d" id="r" >&nbsp;-추천 높은 knowhow
								<c:if test="${ empty getMyPostByRecommand }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyPostByRecommand }">
									<c:forEach items="${ getMyPostByRecommand }" var="r">
										
										<div class="knowhowlist" >
												<span><a href="#"><b>${ r.title }</b></a></span>
													<div id="list">
														<span class="l">${ r.wDate }</span>
														<span class="l"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
														<span><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
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
						<div class="cate1" onclick="showViews();">
							Views
						</div>
						<div class="cate2" onclick="showNews();">
							News
						</div>
						<div class="cate3" onclick="showReply();">
							Reply
						</div>
						<div class="cate4" onclick="showRcomm();">
							Rcomm
						</div>
					</div>
				</div>
			</div>
	</div>
</body>
</html>