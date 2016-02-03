<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/myKnowhow.css">
<script>
	$(document).ready(function(){
		
		$("#myModal").modal();
		
	/* 	$("#o").hide(); */
		$("#n").hide();
		$("#c").hide();
		$("#r").hide();
		
	});
</script>
</head>
<body>
	<div class="modal fade" id="myModal" data-backdrop="static">
		<div class="modal-dialog" id="myDialog">
				<div class="modal-content" id="myContent">
				<div id="myWrap">
					<div id="myTitle">
						<div id="Closeimg"><a href="#"><img style="width:20px;" src="resources/images/close.png"/></a></div>
						<div id="Title">MyKnowhow</div>
						<div id="description">
							<span class="d" id="o">&nbsp;-조회 수 높은 knowhow</span>
							<span class="d" id="n">&nbsp;-최근 knowhow</span>
							<span class="d" id="c">&nbsp;-댓글 많은 knowhow</span>
							<span class="d" id="r" >&nbsp;-추천 높은 knowhow</span>
						</div>
						<div id="listDiv"  style="overflow:scroll; overflow-x:hidden;">
							<div class="knowhowlist" >
								<div><a href="#"><b>Title</b></a></div>
								<div id="list">
								<span class="l">2016.02.02 18:17:32</span>
								<span class="l"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
								<span><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
								</div>
								<div id="listline"></div>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div id="knowhowCList">
					<div id="lineback"></div>
					<div id="postit">
						<div class="category1">
							Views
						</div>
						<div class="category2">
							New
						</div>
						<div class="category3">
							Reply
						</div>
						<div class="category4">
							Rcomm
						</div>
					</div>
				</div>
			</div>
	</div>
</body>
</html>