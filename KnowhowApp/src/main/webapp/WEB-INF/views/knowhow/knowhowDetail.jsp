<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script>
		var i = 1;
		var j = 0;
		var recoNum = 0;
		var pNo = "";
	
		$(document).ready(function(){
			
			maxPage = parseInt("${post.mPage}");
			pNo = "${post.pNo}";
			recoNum = parseInt("${postRecommendationCount}");
			
			$("#recommenNum").text(recoNum);
			
			getCommentList();
			
			$("#addbtn").hide();
			$("#deletebtn").hide();
			$(".p2").hide();
			$(".p3").hide();
			$(".p4").hide();
			$(".p5").hide();
			$(".p6").hide();
			$(".p7").hide();
			$(".p8").hide();
			$(".p9").hide();
			$(".p10").hide();

			$(".p"+i).css("width","65");
			
			<c:forEach items="${pConList}" var="pCon" varStatus="status">
				
				var media = "${pCon.media}";
				
				if(media == "none") {
					
					$('#mediaiframe'+'${status.count}').attr("src" , "resources/images/nomedia.png");
					
// 					imgArr["${status.index}"] = null;
// 					urlArr["${status.index}"] = undefined;
					
				} else if(media.indexOf("https:") > -1) {
					
					$('#mediaiframe' + "${status.count}").attr("src", "${pCon.media}");
					$("#mediaiframe"+ "${status.count}").css("z-index", "4");
					
				} else {
					
					$("#mediaImg" + "${status.count}").attr("src", "${pCon.media}");
					$('#m'+"${status.count}").css("background-image","none");
				
				}
				
// 				var content = replaceAll("${pCon.content}", '<br>', '\n');
				var content = "${pCon.content}";
				$("#content_Text" + "${status.count}").html(content);
				
				$(".p" + "${status.count}").show();
				
			</c:forEach>
			
			$("#detailModal").modal();
			$("#modifyDelete").hide();
			$("#commentContent").hide();
			
			$(".pageNumber").mouseover(function(){
				
				$(this).css("width" , "65");
			
			});
			
			$(".pageNumber").mouseout(function(){
				
				if($(this).is(".p"+i) === true){
					
					$(this).css("width" , "65");
				
				}else{
					
					$(this).css("width" , "50");
				}
			
			});
			
			$("#replycontent").click(function(e){
				
				e.preventDefault();
				e.stopPropagation();
				
				if($("#commentContent").css("display") == "none"){
					
					$("#commentContent").slideDown(400);
					$("#detailDialog").css("width", "1130px");
					
				}else{
					
					$("#commentContent").slideUp("400", function(){
						
						$("#detailDialog").css("width", "760px");
					});
						
				}
				
			});
			
			$(".p1").click(function(){
				$("#myCarousel").carousel(0);
				j = i;
				i = 1;
				getCommentList();
				$(".p"+i).css("width","65");
				$(".p"+j).css("width","50");
			});
			
			$(".p2").click(function(){
				$("#myCarousel").carousel(1);
				j = i;
				i = 2;
				getCommentList();
				$(".p"+i).css("width","65");
				$(".p"+j).css("width","50");
			});
			
			$(".p3").click(function(){
				$("#myCarousel").carousel(2);
				j = i;
				i = 3;
				getCommentList();
				$(".p"+i).css("width","65");
				$(".p"+j).css("width","50");
			});
			
			$(".p4").click(function(){
				$("#myCarousel").carousel(3);
				j = i;
				i = 4;
				getCommentList();
				$(".p"+i).css("width","65");
				$(".p"+j).css("width","50");
			});
			
			$(".p5").click(function(){
				$("#myCarousel").carousel(4);
				j = i;
				i = 5;
				getCommentList();
				$(".p"+i).css("width","65");
				$(".p"+j).css("width","50");
			});
			
			$(".p6").click(function(){
				$("#myCarousel").carousel(5);
				j = i;
				i = 6;
				getCommentList();
				$(".p"+i).css("width","65");
				$(".p"+j).css("width","50");
			});
			
			$(".p7").click(function(){
				$("#myCarousel").carousel(6);
				j = i;
				i = 7;
				getCommentList();
				$(".p"+i).css("width","65");
				$(".p"+j).css("width","50");
			});
			
			$(".p8").click(function(){
				$("#myCarousel").carousel(7);
				j = i;
				i = 8;
				getCommentList();
				$(".p"+i).css("width","65");
				$(".p"+j).css("width","50");
			});
			
			$(".p9").click(function(){
				$("#myCarousel").carousel(8);
				j = i;
				i = 9;
				getCommentList();
				$(".p"+i).css("width","65");
				$(".p"+j).css("width","50");
			});
			
			$(".p10").click(function(){
				$("#myCarousel").carousel(9);
				j = i;
				i = 10;
				getCommentList();
				$(".p"+i).css("width","65");
				$(".p"+j).css("width","50");
			});
			
		});
		
		function replaceAll(str, target, replacement) {
			
   			return str.split(target).join(replacement);
   			
		};
		
		// 댓글 가져오기
		function getCommentList() {
			
		    // 폼 데이터 받기 or Append or 인자로 form id)
			var formData = new FormData();
			
			formData.append("pno", pNo);
			formData.append("page", i - 1);

			$.ajax({
				type : 'POST',
				url : 'getCommentList',
				data : formData,
				processData : false,
				contentType : false,

				success : function(responseData, statusText, xhr) {
					
					var result = responseData;
					$('#replyDiv').empty();
					$('#replyDiv').html(result);
					// 성공처리(v는 서버로 받은 메시지, value)
					
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
//					$(location).attr('href', "이동할 페이지");
					$('.wrap-loading').addClass('display-none');
					$("#tagModal").modal("hide");

				}				
			});						
		}
		
		function setRecommendation() {
			
			$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
			 // 폼 데이터 받기 or Append or 인자로 form id)
			var formData = new FormData();
			formData.append("pno", pNo);

			$.ajax({
				type : 'POST',
				url : 'recommendPost',
				data : formData,
				processData : false,
				contentType : false,

				success : function(v) {
					
					// 성공처리(v는 서버로 받은 메시지, value)
					if(v == 'true') {
						recoNum = recoNum + 1;
					} else {
						recoNum = recoNum - 1;
					}
											
					$("#recommenNum").text(recoNum);
					
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
					$('.wrap-loading').addClass('display-none');
					$("#addModal").modal("hide");

				}
			});
		}
		
		function addComment() {
			
			if($("#inputCom").val() == "") {
				
				alert("내용이 비었습니다.");
				
			} else {
				
				$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
				 // 폼 데이터 받기 or Append or 인자로 form id)
				var formData = new FormData();
				formData.append("pno", pNo);
				formData.append("content", $("#inputCom").val());
				formData.append("page", i - 1);
	
				$.ajax({
					type : 'POST',
					url : 'addPostComment',
					data : formData,
					processData : false,
					contentType : false,
	
					success : function(v) {
						
						// 성공처리(v는 서버로 받은 메시지, value)
						getCommentList();
						$("#inputCom").val("");
						
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
						$('.wrap-loading').addClass('display-none');
						$("#addModal").modal("hide");
	
					}
				});
			}
		}
		
		function delComment(cNo) {
			
			$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
			 // 폼 데이터 받기 or Append or 인자로 form id)
			var formData = new FormData();
			formData.append("cno", cNo);

			$.ajax({
				type : 'POST',
				url : 'delPostComment',
				data : formData,
				processData : false,
				contentType : false,

				success : function(v) {
					
					// 성공처리(v는 서버로 받은 메시지, value)
					getCommentList();
					
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
					$('.wrap-loading').addClass('display-none');
					$("#addModal").modal("hide");

				}
			});
		}
		
		function modifyComment(me, cNo) {
			
			if($("#modifyInput").val() == undefined) {

			var target = $(me).parent().next(".replycontents");
			var oldContent = target.text();
			
			target.empty();
			target.append("<input id='modifyInput' style='width:300px;' type='text' />");
			$("#modifyInput").val(oldContent.trim());
			$("#modifyInput").focus();
			
			$("#modifyInput").keypress (function (key) {
				
				if(key.keyCode == 13) {
					
					var content = $("#modifyInput").val();
					
					if(content == "") {
						
						alert("내용이 비었습니다.");
						
					} else {
						
						$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
						 // 폼 데이터 받기 or Append or 인자로 form id)
						var formData = new FormData();
						formData.append("cno", cNo);
						formData.append("content", content);

						$.ajax({
							type : 'POST',
							url : 'modifyPostComment',
							data : formData,
							processData : false,
							contentType : false,

							success : function(v) {
								
								// 성공처리(v는 서버로 받은 메시지, value)
								getCommentList();
								
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
								$('.wrap-loading').addClass('display-none');
								$("#addModal").modal("hide");

							}
						});						
					}					
				}
				
			});			
		} else {
			alert("다른 댓글이 수정 중입니다.");
		}
	}
		
	</script>
	<style>
	
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
			margin-left:-130px;		  /* 왼쪽 top부분이 가운데로왔으니 좌측에서 전체가로픽셀의 반을 마이너스하여 좌측으로 옮겨줌 */
			margin-top: 280px;			

		}
		
		.display-none { /*감추기*/
			display: none;
		}
	
		#detailContent{
				width: 600px;
				height: 740px;
				float:left;
				border:10px solid #535353;
				
			}
			
		#detailDialog{
			width: 760px;
		}
		
		#commentContent{
			width:450px;
			height: 740px;
			float:left;
			border:10px solid #535353;
		}
		
		#replyDiv{
			width:400px;
			height: 590px;
			margin: 0px auto;
			margin-top: 15px;
			border: 1px solid #BFBCBC;
			border-radius:6px;
		}
		
		#replyContent{
			width:400px;
			height: 170px;
			margin: 0px auto;
			margin-top: 20px;
		}
		
		#replybtndiv{
			margin-top: 10px;
		}
		
		#replybtn{
			width:100%;
			font-weight: bold;
			font-size: 15px;
			height: 40px;
		}
		
		.replyView{
			width:380px;
			margin: 0px auto;
			margin-top:10px;
			clear: both;
		}
		
		.replyProfile{
			width:55px;
			height:55px;
			float:left;
		}
		
		.profileImg{
			width: 100%;
			height: 100%;
			display: block;	
		}
		
		.replyInfo{
			width: 240px;
			height: 20px;
			float: left;
		}
		
		.replyModifyDelete{
			width:50px;
			height:20px;
			float:left;
			margin-left: 5px;
		}
		
		.replyDate{
			display:inline-block;
			font-size:10px;
			float:right;
			margin-top: 5px;
		}
		
		.replyNickname{
			display:inline-block;
			font-weight: bold;
			font-size: 13px;
			margin-left: 5px;
		}
		
		.replycontents{
			float: left;
			width:315px;
			height:40px;
			margin-left: 5px;
			font-size: 13px;
		}
		
		.pageNumber{
				width:50px;
				height:40px;
				margin-bottom: 6px;
				color:white;
				font-weight: bold;
				text-align: center;
				vertical-align:middle;
				line-height:40px;
				font-size: 18px;
			}
			
			.p1{
				background-color:red;
				cursor: pointer;
			}
			
			.p2{
				background-color:tomato;
				cursor: pointer;
			}
			
			.p3{
				background-color:orange;
				cursor: pointer;
			}
			
			.p4{
				background-color:#FFDA00;
				cursor: pointer;
			}
			
			.p5{
				background-color: #336C12;
				cursor: pointer;
			}
			
			.p6{
				background-color: #429AD8;
				cursor: pointer;
			}
			
			.p7{
				background-color:#2556AB;
				cursor: pointer;
			}
			
			.p8{
				background-color:#4F25AB;
				cursor: pointer;
			}

			.p9{
				background-color:#AB2525;
				cursor: pointer;
			}
			
			.p10{
				background-color:#222020;
				cursor: pointer;
			}
	
			#pageMove{
				margin-top:10px;
				width:70px;
				height: 700px;
				float:left;
			}
			
			#detailTitle{
				margin-left: 20px;
				font-size: 28px;
				font-weight: bold;
				width:95%;
			}
			
			#closeimg{
				float: right;
			}
			
			#closeimg img{
				margin-top: -15px;
			}
			
			#createDate{
				color: #666666;
				width: 190px;
				font-size: 14px;
				margin-left:20px;
				font-weight: normal;
				float:left;
			}
			
			#viewNum{
				float:right;
				width:150px;
			}
			
			#writer{
				float:right;
				width:150px;
			}
			
			#modifyDelete{
				float:right;
				width:150px;
				text-align: center;
				margin-top: -10px;
			}
			
			#header{
				height: 85px;
			}
			
			.content_Text{
				margin:0px auto;
				margin-top: 20px;
				margin-bottom: 10px;
				width: 520px;
				height: 200px;
				font-size: 16px;
			}
			
			.mediaiframe{
			margin: 0px auto;
			z-index: 2;
			position: absolute;
			border:0px;
		}
		
		.m{
			position: absolute;
			z-index:3;
			width:567px;
			height: 300px;
			border: none;
		}
		
		.mediaImg{
			width:515px;
			height:300px;
			border:none;
		}
		
		#detailTag{
			width:550px;
			margin: 0px auto;
			margin-bottom: 10px;
			height: 50px;
		}
		
		.tags{
			padding-left: 13px;
			color:#666666;
			font-size: 16px;
		}
	
		
		#Media{
			margin-top: 10px;
			height: 300px;
		}
		
		#content{
				margin:0px auto;
				height: 500px;
				width: 90%;
				margin-bottom: 10px;
		}
		
		#recommenBtn{
			border-style: none;
			background: none;
			width: 100px;
		}
		
		#footerContent{
			width:500px;
			margin: 0px auto;
		}
		
		#recommen{
			width:80px;
			float:right;
		}
		
		#recommenImg{
			width:50px;
			float:right;
		}
		
		#recommenNum{
			font-size: 17px;
			font-weight:bold;
			vertical-align: middle;
			line-height: 40px;
			text-align: center;
			float:right;
		}
		
		#reply{
			width:80px;
			float:right;
		}
		
		#replyImg{
			width:50px;
			float:right;
		}
		
		#replyNum{
			font-size: 17px;
			font-weight:bold;
			vertical-align: middle;
			line-height: 40px;
			text-align: center;
			float:right;
		}
		
		#tagline{
			width:510px;
			height: 5px;
			border-top: 1px solid #BFBCBC;
			margin: 0px auto;
		}
		
		.replyline{
			clear:both;
			border-bottom: 1px solid #BFBCBC;
		}
		
		::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
 
			 ::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url('./images/bg.png') #efefef}
 
			 ::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
			 
			 ::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}
	</style>
</head>
<body>
	<div class="modal fade" id="detailModal" data-backdrop="static">
		<div class="modal-dialog" id="detailDialog">
			<div class="modal-content" id="detailContent">
					<div id="detailWrap">
					<div class="modal-header" id="header">
						<div id="closeimg"><a href="javascript:window.close()"><img style="width:20px;" src="resources/images/close.png"/></a></div>
						<div id="detailTitle">${post.title }</div>
						<div id="createDate"><img style="width:30px;" src="resources/images/wDate.png">&nbsp;${post.wDate }</div>
						<div id="writer"><img src="resources/images/writer.png">&nbsp;<a href="#">${post.nickName }</a></div>
						<div id="modifyDelete"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></div>
						<div id="viewNum"><img src="resources/images/viewnumber.png"/>&nbsp;${post.count }</div>
					</div>

					<!-- Modal 상단-->
						<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
							
  							 <div class="carousel-inner" role="listbox">
						 
  									<div class="wrap-loading display-none">
			  							<div><img src="resources/images/loading2.gif" /></div>
									</div>								 

  							 	<div class="item active">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m1" class="m" onclick="openModal()"></div>
												<iframe id="mediaiframe1" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg1"/>
											</div>
											<div id="content_Text1" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media"class="mbackground">
												<div id="m2" class="m" onclick="openModal()"></div>
												<iframe id="mediaiframe2" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg2"/>
											</div>
											<div id="content_Text2" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m3" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe3" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg3"/>
											</div>
											<div id="content_Text3" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m4" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe4" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg4"/>
											</div>
											<div id="content_Text4" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m5" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe5" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg5"/>
											</div>
											<div id="content_Text5" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m6" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe6" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg6"/>
											</div>
											<div id="content_Text6" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m7" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe7" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg7"/>
											</div>
											<div id="content_Text7" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m8" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe8" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg8"/>
											</div>
											<div id="content_Text8" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m9" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe9" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg9"/>
											</div>
											<div id="content_Text9" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m10" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe10" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg10"/>
											</div>
											<div id="content_Text10" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 </div>
						</div>
						<div id="tagline"></div>
						<div id="detailTag">
							<c:set var="isDoing" value="true"/> 					
							<c:forEach var="tags" items="${pTagList }" varStatus="status">
								<c:if test="${isDoing}">
									<span class="tags">#${tags.tag }</span>
									<c:if test="${status.index eq 19}"><c:set var="isDoing" value="false"/></c:if>
								</c:if>
							</c:forEach>							
						</div>
							<div id="footerContent">
								<div id="reply">
									<div id="replyNum">
									</div>
									<div id="replyImg">
										<a id="replycontent" href="#"><img	style="width:50px;" src="resources/images/comment.png"/></a>
									</div>
								</div>	
								<div id="recommen">
									<div id="recommenNum">
										${post.good }
									</div>
									<div id="recommenImg">
										<img style="width:50px; cursor: pointer;" onclick="setRecommendation()" src="resources/images/recomment.png"/>
									</div>
								</div>
							</div>
					</div>
				</div>
				<div id="pageMove">
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
				<div id="commentContent" class="modal-content">
					<div id="replyDiv" style="overflow: auto; overflow-x:hidden;">
						
					</div>
					<form name="replyForm" action="" method="post">
						<div id="replyContent">
							<input type="text" class="form-control replybox" id="inputCom" name="reply">
							<div id="replybtndiv">
								<input type="button" id="replybtn"class="btn btn-success" onclick="addComment()" value="Comment Posting!"/>
							</div>
						</div>
					</form>	
				</div>
			</div>
		</div>
</body>
</html>