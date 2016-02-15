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
		
		$('#header_main').css('width', $(window).width());
		
		$("#myModal").modal();
		
		$("#viewListDes").show();
		$("#recommenListDes").hide();
		$("#newListDes").hide();
		$("#commenListDes").hide();
		
		 
		 $('#postByViews').click(function(){
				
				$("#viewListDes").show();
				$("#recommenListDes").hide();
				$("#newListDes").hide();
				$("#commenListDes").hide();
		});
	 	$('#postByNews').click(function(){
			
				$("#recommenListDes").hide();
				$("#viewListDes").hide();
				$("#newListDes").show();
				$("#commenListDes").hide();
		});		
				
	 	$('#postByReply').click(function(){
			
				$("#newListDes").hide();
				$("#recommenListDes").hide();
				$("#viewListDes").hide();
				$("#commenListDes").show();
		});
	 	$('#postByRcomm').click(function(){
			
				$("#commenListDes").hide();
				$("#recommenListDes").show();
				$("#newListDes").hide();
				$("#viewListDes").hide();
		});
		
		$("#myModalInfoImg").mouseover(function(){
			
			$("#myKnowhowInfoModal").modal();
			
		});
		
		$("#myInfoViewImg").mouseout(function(){
			
			$("#myKnowhowInfoModal").modal('hide');
			
		});
		
		});
	
</script>
</head>
<body>
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
						<div id="Closeimg"
							onclick="javascript:$('#myPostList').modal('hide');">
							<a href="#"><img style="width: 20px;"
								src="resources/images/close.png" /></a>
						</div>
						<div id="Title">MyKnowhow</div>
						<div id="description">
							<span id="viewListDes" >&nbsp;-조회 수 높은 knowhow</span>
							<span id="newListDes">&nbsp;-최근 knowhow</span>
							<span id="commenListDes">&nbsp;-댓글 많은 knowhow</span>
							<span id="recommenListDes">&nbsp;-추천 높은 knowhow</span>
						</div>
						<div id="listDiv" style="overflow:scroll; overflow-x:hidden;">
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
		<div id="myKnowhowInfoModal" class="modal fade">
		<div class="modal-dialog" id="myKnowhowInfoDialog">
			<div id ="myInfoViewImg">
				<img src="resources/images/myKnowhow.png"/>
			</div>
		</div>
	</div>	
	
</body>
</html>