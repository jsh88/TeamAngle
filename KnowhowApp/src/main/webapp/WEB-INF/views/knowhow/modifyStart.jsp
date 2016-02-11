<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="resources/css/addKnowhow.css" type="text/css" >
	<style type="text/css">
	/*화면 전체를 어둡게 합니다.*/
	.wrap-loading { 
		position: fixed;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		background: rgba(0, 0, 0, 0.2);
	}
	
	.wrap-loading div { 							/*로딩 이미지*/
		width: 1000; 								/*div의 전체 가로픽셀*/
		position: absolute; 						/*테이블의 영향을받지않는 div*/
		left: 50%; 									/*div 왼쪽 top 부분이 가로 전체의 중간으로 위치하게됨*/
		margin-left: -500px;						/* 왼쪽 top부분이 가운데로왔으니 좌측에서 전체가로픽셀의 반을 마이너스하여 좌측으로 옮겨줌 */										
	}
	
	.display-none { /*감추기*/
		display: none;
	}
	</style>
	<script>
	var title;
	
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
	
	function modifyTitle() {
		
		title = $("#addtitle").val();

		$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
		 // 폼 데이터 받기 or Append or 인자로 form id)
		var formData = new FormData();
		formData.append("title", title);
	
		$.ajax({
			type : 'POST',
			url : 'modifyPost',
			data : formData,
			processData : false,
			contentType : false,
	
			success : function(v) {
				
				// 성공처리(v는 서버로 받은 메시지, value)
				alert("성공이다해");
				
			},
			beforeSend : function() {
	
				// 전송 전
				// 이미지 보여주기
				$('.wrap-loading').removeClass('display-none');
				
			},
			error : function(request, status, error) {
	
				// 에러 로직, 에러 로그 확인
				alert("code:" + request.status + "\n\n" + "message:"
						+ request.responseText + "\n\n" + "error:" + error);
	
			},
			complete : function() {
	
				// 이미지 감추기 처리
				$(location).attr('href', "modifyPost");
				$('.wrap-loading').addClass('display-none');
				$("#addModal").modal("hide");
	
			}
		});
	}
	</script>
</head>
<body>
		<div class="modal fade" id="addModal">
		<div class="modal-dialog" id="ModalDialog">
    	<div class="modal-content" id="ModalContent">
	<div id="addCheckWrap">
	
	<div class="wrap-loading display-none">
		<div>
			<img src="resources/images/loading2.gif" />
			<!-- 로딩 -->
		</div>
	</div>
	
		<div id="addForm">
			<form name="addTitleForm" action="" method="post">
				<div id="addTitle">
							<div class="form-group">
								<label for="addtitle" class="col-sm-12 control-label" id="titlelabel">Please enter a post title!</label>
								<div class="col-sm-12">
							     	<input type="text" class="form-control" id="addtitle" name="title" value="${post.title }" maxlength="40"/> 
								</div>
							</div>
							<div id="buttonGroup">
								<button type="button" class="btn btn-success addbtn" id="Createbtn" onclick="modifyTitle()"><b>Modify Post</b></button>
								<button type="submit" class="btn btn-success addbtn" id="Continuebtn"><b>Continue to Posting</b></button>
								<button type="button" class="btn btn-warning addbtn" id="Recallingbtn"> <b>Recalling Post</b></button>
								<button type="button" class="btn btn-warning addbtn" id="Priorbtn"> <b>Fold</b></button>
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