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
							<span class="d" id="o">&nbsp;-조회 수 높은 knowhow
								<c:if test="${ empty getMyPostByViews }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyPostByViews }">
									<c:forEach items="${ getMyPostByViews }" var="v">
										<table>
											<tbody>
												<tr>
													<th>${ v.title }</th>
													<th>${ v.wDate }</th>
												</tr>
											</tbody>
										</table>
									</c:forEach>
								</c:if>
							</span>
							<span class="d" id="n">&nbsp;-최근 knowhow
							<c:if test="${ empty getMyLatelyPost }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyLatelyPost }">
									<c:forEach items="${ getMyLatelyPost }" var="n">
										<table>
											<tbody>
												<tr>
													<th>${ n.title }</th>
													<th>${ n.wDate }</th>
												</tr>
											</tbody>
										</table>
									</c:forEach>
								</c:if>
							</span>
							<span class="d" id="c">&nbsp;-댓글 많은 knowhow
							<c:if test="${ empty getMyPostByComments }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyPostByComments }">
									<c:forEach items="${ getMyPostByComments }" var="c">
										<table>
											<tbody>
												<tr>
													<th>${ c.title }</th>
													<th>${ c.wDate }</th>
												</tr>
											</tbody>
										</table>
									</c:forEach>
								</c:if>
							</span>
							
							<span class="d" id="r" >&nbsp;-추천 높은 knowhow
								<c:if test="${ empty getMyPostByRecommand }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyPostByRecommand }">
									<c:forEach items="${ getMyPostByRecommand }" var="r">
										<table>
											<tbody>
												<tr>
													<th>${ r.title }</th>
													<th>${ r.wDate }</th>
												</tr>
											</tbody>
										</table>
									</c:forEach>
								</c:if>
							</span>
						</div>
						<div id="listDiv" style="overflow:scroll; overflow-x:hidden;">
						<iframe id="listIframe" width="460" height="100%" frameborder="0" allowfullscreen >
						</iframe>
						</div>
					</div>
				</div>
				</div>
				<div id="knowhowCList">
					<div id="lineback"></div>
					<div id="postit">
						<div class="category1">
							<a id="showViews" href="#" onclick="showViews();">Views</a>
						</div>
						<div class="category2">
							<a id="showViews" href="#" onclick="showNews();">News</a>
						</div>
						<div class="category3">
							<a id="showViews" href="#" onclick="showReply();">Reply</a>
						</div>
						<div class="category4">
							<a id="showRcomm" href="#" onclick="showRcomm();">Rcomm</a>
						</div>
					</div>
				</div>
			</div>
	</div>
</body>
</html>