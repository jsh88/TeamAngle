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
		
		$('#header_main').css('width', $(window).width());
		
		$("#myModal").modal();
		
		$("#o").show();
		$("#n").hide();
		$("#c").hide();
		$("#r").hide();
		$("#viewListDes").show();
		$("#recommenListDes").hide();
		$("#newListDes").hide();
		$("#commenListDes").hide();
		
		
		$("#myModalInfoImg").mouseover(function(){
			
			$("#myKnowhowInfoModal").modal();
			
		});
		
		$("#myInfoViewImg").mouseout(function(){
			
			$("#myKnowhowInfoModal").modal('hide');
			
		});
		
		});
	
	function showViews(){
		
			$("#o").show();
			$("#viewListDes").show();
			$("#n").hide();
			$("#c").hide();
			$("#r").hide();
			$("#recommenListDes").hide();
			$("#newListDes").hide();
			$("#commenListDes").hide();
	}
	function showRcomm(){
		
			$("#o").hide();
			$("#n").hide();
			$("#c").hide();
			$("#r").show();
			$("#recommenListDes").show();
			$("#viewListDes").hide();
			$("#newListDes").hide();
			$("#commenListDes").hide();
	}		
			
	function showNews(){
		
			$("#o").hide();
			$("#n").show();
			$("#newListDes").show();
			$("#c").hide();
			$("#r").hide();
			$("#recommenListDes").hide();
			$("#viewListDes").hide();
			$("#commenListDes").hide();
	}
	function showReply(){
		
			$("#o").hide();
			$("#n").hide();
			$("#c").show();
			$("#commenListDes").show();
			$("#r").hide();
			$("#recommenListDes").hide();
			$("#newListDes").hide();
			$("#viewListDes").hide();
	}
</script>
</head>
<body>
	<div class="modal fade" id="myModal" data-backdrop="static">
		<div class="modal-dialog" id="myPostList">
	<div id="myModalInfo">
 		<div id="myModalBlankLine">&nbsp;</div>
 		<div id="myModalInfoImg">
 			<img style="width:55px;" src="resources/images/Info.png"/>
 		</div>
 	</div>
		
				<div class="modal-content" id="myContent">
				<div id="myWrap">
					<div id="myTitle">
						<div id="Closeimg" onclick="javascript:$('#myPostList').modal('hide');"><a href="#"><img style="width:20px;" src="resources/images/close.png"/></a></div>
						<div id="Title">MyKnowhow</div>
						<div id="description">
							<span id="viewListDes" >&nbsp;-조회 수 높은 knowhow</span>
							<span id="newListDes">&nbsp;-최근 knowhow</span>
							<span id="commenListDes">&nbsp;-댓글 많은 knowhow</span>
							<span id="recommenListDes">&nbsp;-추천 높은 knowhow</span>
						</div>
						<div id="listDiv" style="overflow:scroll; overflow-x:hidden;">
						<span class="d" id="o">
							<c:if test="${ empty getMyPostByViews }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyPostByViews }">
									<c:forEach items="${ getMyPostByViews }" var="v">
										
										<div class="knowhowlist" >
												<span onclick="morePost('${ v.pNo }')"><a href="#"><b>${ v.title }</b></a></span>
												<div id="list">
														<span class="l">${ v.wDate }</span>
														<span class="l" onclick="modifyPostStart('${ v.pNo }')"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
														<span onclick="delPost('${v.pNo}')"><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
												</div>
												<div id="listline"></div>
										</div>
									
									</c:forEach>
								</c:if>
								</span>
							<span class="d" id="n">
							<c:if test="${ empty getMyLatelyPost }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyLatelyPost }">
									<c:forEach items="${ getMyLatelyPost }" var="n">
										
										<div class="knowhowlist" >
												<span onclick="morePost('${ n.pNo }')"><a href="#"><b>${ n.title }</b></a></span>
												<div id="list">
														<span class="l">${ n.wDate }</span>
														<span class="l" onclick="modifyPostStart('${ n.pNo }')"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
														<span onclick="delPost('${n.pNo}')"><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
												</div>
												<div id="listline"></div>
										</div>										
						
									</c:forEach>
								</c:if>
							</span>
							<span class="d" id="c">
							<c:if test="${ empty getMyPostByComments }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyPostByComments }">
									<c:forEach items="${ getMyPostByComments }" var="c">
										
										<div class="knowhowlist" >
												<span onclick="morePost('${ c.pNo }')"><a href="#"><b>${ c.title }</b></a></span>
													<div id="list">
														<span class="l">${ c.wDate }</span>
														<span class="l" onclick="modifyPostStart('${ c.pNo }')"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
														<span onclick="delPost('${c.pNo}')"><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
													</div>
												<div id="listline"></div>
										</div>																			

									</c:forEach>
								</c:if>
							</span>
							
							<span class="d" id="r" >
								<c:if test="${ empty getMyPostByRecommand }">
								내가 작성한 포스트가 존재하지 않습니다.
								</c:if>
								<c:if test="${ not empty getMyPostByRecommand }">
									<c:forEach items="${ getMyPostByRecommand }" var="r">
										
										<div class="knowhowlist" >
												<span onclick="morePost('${ r.pNo }')"><a href="#"><b>${ r.title }</b></a></span>
													<div id="list">
														<span class="l">${ r.wDate }</span>
														<span class="l" onclick="modifyPostStart('${ r.pNo }')"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
														<span onclick="delPost('${r.pNo}')"><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
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
	<div id="myKnowhowInfoModal" class="modal fade">
		<div class="modal-dialog" id="myKnowhowInfoDialog">
			<div id ="myInfoViewImg">
				<img src="resources/images/myKnowhow.png"/>
			</div>
		</div>
	</div>	
	</div>
</body>
</html>