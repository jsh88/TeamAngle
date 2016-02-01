<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/addKnowhow.css" type="text/css" >
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){
		
		$("#addModal").modal();
		
		$("#Continuebtn").hide();
		$("#Priorbtn").hide();
		$("#hideList").hide();
		$("#middle").hide();
		
		$("#Recallingbtn").click(function(){
		/* 	$("#ModalDialog").css('margin-top','300px'); */
			$("#Createbtn").hide();
			$("#Continuebtn").show();
			$("#Recallingbtn").hide();
			$("#Priorbtn").show();
			$("#middle").slideToggle(400);
			$("#hideList").slideToggle(400);
			$("#middle").show();
			$("#hideList").show();
			
		});
		

		$("#Priorbtn").click(function(){
		/*  $("#ModalDialog").css('margin-top','350px'); */
			$("#Createbtn").show();
			$("#Recallingbtn").show();
			$("#Priorbtn").hide();
			$("#Continuebtn").hide();
			$("#middle").slideToggle(400);
			$("#hideList").slideToggle(400);
			$("#addtitle").val("");
			
		});
		
		$(".atitle").click(function(){
			
			var t = $(this).text();
			
			$("#addtitle").val(t);
			preventDefault();
		});
		
	});
	</script>
</head>
<body>
	<div class="modal fade=" id="addModal">
		<div class="modal-dialog" id="ModalDialog">
    	<div class="modal-content" id="ModalContent">
	<div id="addCheckWrap">
		<div id="addForm">
			<form name="addTitleForm" action="" method="post">
				<div id="addTitle">
							<div class="form-group">
								<label for="addtitle" class="col-sm-12 control-label" id="titlelabel">Please enter a post title!</label>
								<div class="col-sm-12">
							     	<input type="text" class="form-control" id="addtitle" name="title" maxlength="40"/> 
								</div>
							</div>
							<div id="buttonGroup">
								<button type="submit" class="btn btn-success addbtn" id="Createbtn"><b>Create Post</b></button>
								<button type="submit" class="btn btn-success addbtn" id="Continuebtn"><b>Continue to Post</b></button>
								<button type="button" class="btn btn-warning addbtn" id="Recallingbtn"> <b>Recalling Post</b></button>
								<button type="button" class="btn btn-warning addbtn" id="Priorbtn"> <b>Prior</b></button>
							</div>	
					</div>
			</form>
		</div>
	</div>
		</div>
		<div id="middle"></div> <!--  연결고리 -->
		<div class="modal-content" id="hideList" >
			<div id="hideListWrap" style="overflow:scroll; overflow-x:hidden;">
				<div class="hideListContent">
					<div class="Title"><a href="#" class="atitle">The work never ends ..</a><div class="contentimg"><a href=""><img style="width:15px;" src="resources/images/close.png"/></a></div></div>
					<div class="pageNum">
						page : 7
					</div>
					<div class="saveDate">
						Saved : 2016-01-29 13:31:22
					</div>
					<div class="createDate">
						Created : 2016-01-29 13:31:22
					</div>
				</div>
				<div class="line"></div><!-- 반복문 쓸때 hideListContent부터 line까지 묶을 것 -->
			</div>
		</div>
	</div>
	</div>
</body>
</html>