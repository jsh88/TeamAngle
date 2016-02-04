<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			var i = "";
			
			$("#detailModal").modal();
			$("#modifyDelete").hide();
			
			$(".p1").click(function(){
				$("#myCarousel").carousel(0);
				checkVideo();
				i = 1;
				checkMaxPage();
			});
			
			$(".p2").click(function(){
				$("#myCarousel").carousel(1);
				checkVideo();
				i = 2;
				checkMaxPage();
			});
			
			$(".p3").click(function(){
				$("#myCarousel").carousel(2);
				checkVideo();
				i = 3;
				checkMaxPage();
			});
			
			$(".p4").click(function(){
				$("#myCarousel").carousel(3);
				checkVideo();
				i = 4;
				checkMaxPage();
			});
			
			$(".p5").click(function(){
				$("#myCarousel").carousel(4);
				checkVideo();
				i = 5;
				checkMaxPage();
			});
			
			$(".p6").click(function(){
				$("#myCarousel").carousel(5);
				checkVideo();
				i = 6;
				checkMaxPage();
			});
			
			$(".p7").click(function(){
				$("#myCarousel").carousel(6);
				checkVideo();
				i = 7;
				checkMaxPage();
			});
			
			$(".p8").click(function(){
				$("#myCarousel").carousel(7);
				checkVideo();
				i = 8;
				checkMaxPage();
			});
			
			$(".p9").click(function(){
				$("#myCarousel").carousel(8);
				checkVideo();
				i = 9;
				checkMaxPage();
			});
			
			$(".p10").click(function(){
				$("#myCarousel").carousel(9);
				$("#addbtn").hide();
				checkVideo();
				i = 10;
				checkMaxPage();
			});
			
		});
	</script>
	<style>
		#detailContent{
				width: 650px;
				height: 740px;
				float:left;
				border:10px solid #376CBF;
				
			}
			
		#detailDialog{
			width: 760px;
		}
		
		.pageNumber{
				width:55px;
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
			
			#title{
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
				width: 170px;
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
				width: 570px;
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
			width:565px;
			height: 300px;
			border:0px;
		}
		
		.mediaImg{
			width:565px;
			height:300px;
			border:0px;
		}
		
		#Tag{
			width:600px;
			margin: 0px auto;
			margin-bottom: 10px;
		}
		
		.tags{
			padding-left: 20px;
			color:#666666;
			font-size: 17px;
		}
		
		#footer{
			height: 30px;
		}
	</style>
</head>
<body>
	<div class="modal fade" id="detailModal" data-backdrop="static">
		<div class="modal-dialog" id="detailDialog">
			<div class="modal-content" id="detailContent">
					<div id="detailWrap">
					<div class="modal-header" id="header">
						<div id="closeimg"><a href="javascript:window.close()"><img style="width:20px;" src="resources/images/close.png"/></a></div>
						<div id="title">Title</div>
						<div id="createDate"><img style="width:30px;" src="resources/images/wDate.png">&nbsp;2016-02-04 10:29:33</div>
						<div id="writer"><img src="resources/images/writer.png">&nbsp;<a href="#">404404</a></div>
						<div id="modifyDelete"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></div>
						<div id="viewNum"><img src="resources/images/viewnumber.png"/>&nbsp;50</div>
					</div>
					<!-- Modal 상단-->
						<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
							
  							 <div class="carousel-inner" role="listbox">
  							 	<div class="item active">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m1" class="m" onclick="openModal()"></div>
												<iframe id="mediaiframe1" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscree></iframe>
												<img class="mediaImg" id="mediaImg1"/>
											</div>
											<div id="content_Text1" class="content_Text">
												ㅎㅇ
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media"class="mbackground">
												<div id="m2" class="m" onclick="openModal()"></div>
												<iframe id="mediaiframe2" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg2"/>
											</div>
											<div id="content_Text2" class="content_Text">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m3" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe3" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg3"/>
											</div>
											<div id="content_Text3" class="content_Text">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m4" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe4" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg4"/>
											</div>
											<div id="content_Text4" class="content_Text">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m5" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe5" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg5"/>
											</div>
											<div id="content_Text5" class="content_Text">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m6" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe6" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg6"/>
											</div>
											<div id="content_Text6" class="content_Text">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m7" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe7" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg7"/>
											</div>
											<div id="content_Text7" class="content_Text">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m8" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe8" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg8"/>
											</div>
											<div id="content_Text8" class="content_Text">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m9" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe9" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg9"/>
											</div>
											<div id="content_Text9" class="content_Text">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m10" class="m"  onclick="openModal()"></div>
												<iframe id="mediaiframe10" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaImg" id="mediaImg10"/>
											</div>
											<div id="content_Text10" class="content_Text">
											</div>
										</div>
  							 	</div>
  							 </div>
						</div>
						<div id="Tag"><span class="tags">#tag</span></div>
						<div class="modal-footer" id="footer">
							<button type="button" class="btn btn-default btn-lg">
								 <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							</button>
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
			</div>
		</div>
</body>
</html>