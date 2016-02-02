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
<script>
	$(document).ready(function(){
		
		$("#myModal").modal();
		
	/* 	$("#o").hide(); */
		$("#n").hide();
		$("#c").hide();
		$("#r").hide();
		
	});
</script>
<style>
	#myDialog{
		width: 500px;
		height: 600px;
	}
	
	#myContent{
		width: 500px;
		height: 600px;
		border: 10px solid #376CBF; 
	}
	
	#myWrap{
		width:480px;
		height: 580px;
		margin: 0px auto;
		margin-top: 10px;
	}
	
	#Closeimg{
		float: right;
		margin-right: 10px;
	}
	
	#Title{
		font-size: 22px;
		font-weight: bold;
		width: 200px;
		margin-left: 10px;
	}
	
	#description{
		margin-top: 5px;
		margin-left: 5px;
	}
	
	.d{
		font-size: 15px;
		margin-right: 10px;
		margin-left: 10px;
	}
	
	#listDiv{
		font-size: 16px;
		margin-left: 20px;
		margin-top: 20px;
	}
</style>
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
							<span class="d" id="o">-조회 수 높은 knowhow</span>
							<span class="d" id="n">-최근 knowhow</span>
							<span class="d" id="c">-댓글 많은 knowhow</span>
							<span class="d" id="r" >-추천 높은 knowhow</span>
						</div>
						<div id="listDiv">
							<div class="knowhowlist">
								<a href="#"><b>Title</b></a>
								<span>2016.02.02 18:17:32</span>
								<span><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a></span>
								<span><a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></span>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div id="addDelete">
					<div id="lineback"></div>
					<div id="postit">
						<div class="pageNumber p1">
							1
						</div>
						<div class="pageNumber p2">
							2
						</div>
						<div class="pageNumber p3">
							3
						</div>
						<div class="pageNumber p4">
							4
						</div>
						<div class="pageNumber p5">
							5
						</div>
						<div class="pageNumber p6">
							6
						</div>
						<div class="pageNumber p7">
							7
						</div>
						<div class="pageNumber p8">
							8
						</div>
						<div class="pageNumber p9">
							9
						</div>
						<div class="pageNumber p10">
							10
						</div>
					</div>
				</div>
			</div>
	</div>
</body>
</html>