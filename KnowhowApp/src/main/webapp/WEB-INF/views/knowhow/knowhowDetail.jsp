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
	
		var cCount = [];
		var i = 1;
	
		$(document).ready(function(){
			
			maxPage = "${post.mPage}";			
			
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

			<c:forEach items="${pConList}" var="pCon" varStatus="status">
			
				cCount["${status.index}"] = "${fn:length(pComListMap[status.index])}";
				
				var media = "${pCon.media}";
				
				if(media == "none") {
					
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
			setCommentSize(i);
			
			$("#detailModal").modal();
			$("#modifyDelete").hide();
			$("#commentContent").hide();
			
			$("#replycontent").click(function(e){
				
				e.preventDefault();
				e.stopPropagation();
				
				$("#commentContent").slideToggle(400);
				$("#detailDialog").css("width", "1130px");
				
			});
			
			$(".p1").click(function(){
				$("#myCarousel").carousel(0);
				i = 1;
				setCommentSize(i);
			});
			
			$(".p2").click(function(){
				$("#myCarousel").carousel(1);
				i = 2;
				setCommentSize(i);
			});
			
			$(".p3").click(function(){
				$("#myCarousel").carousel(2);
				i = 3;
				setCommentSize(i);
			});
			
			$(".p4").click(function(){
				$("#myCarousel").carousel(3);
				i = 4;
				setCommentSize(i);
			});
			
			$(".p5").click(function(){
				$("#myCarousel").carousel(4);
				i = 5;
				setCommentSize(i);
			});
			
			$(".p6").click(function(){
				$("#myCarousel").carousel(5);
				i = 6;
				setCommentSize(i);
			});
			
			$(".p7").click(function(){
				$("#myCarousel").carousel(6);
				i = 7;
				setCommentSize(i);
			});
			
			$(".p8").click(function(){
				$("#myCarousel").carousel(7);
				i = 8;
				setCommentSize(i);
			});
			
			$(".p9").click(function(){
				$("#myCarousel").carousel(8);
				i = 9;
				setCommentSize(i);
			});
			
			$(".p10").click(function(){
				$("#myCarousel").carousel(9);
				i = 10;
				setCommentSize(i);
			});
			
		});
		
		function replaceAll(str, target, replacement) {
			
   			return str.split(target).join(replacement);
   			
		};
		
		function setCommentSize(page) {
			
			if(cCount[page - 1] == null) {
				
				$("#replyNum").text(0);
				
			} else {
				
				$("#replyNum").text(cCount[page - 1]);
				
			}	
		}
		
	</script>
	<style>
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
			height: 510px;
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
			height: 65px;
			margin: 0px auto;
			margin-top:10px;
			border-bottom: 1px solid #BFBCBC;
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
			width:600px;
			margin: 0px auto;
			margin-bottom: 10px;
			height: 50px;
		}
		
		.tags{
			padding-left: 20px;
			color:#666666;
			font-size: 17px;
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
						<div id="detailTag">
							<div id="tagline"></div>
							<span class="tags">#tag</span>
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
										<a href="#"><img style="width:50px;"src="resources/images/recomment.png"/></a>
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
						<div class="replyView">
							<div class="replyProfile">
								<img src="resources/images/ssssss.png" class="img-responsive img-rounded profileImg">
							</div>
							<div class="replyInfo">
								<div class="replyNickname">
								 	<a href="#">닉네임이당열글자까지</a>
								</div>
								<div class="replyDate">2016-02-05 17:26:32</div>
							</div>
							<div class="replyModifyDelete">
								<a href="#"><img style="width:20px;" src="resources/images/modify.png"/></a>&nbsp;
								<a href="#"><img style="width:20px;" src="resources/images/delete.png"/></a>
							</div>
							<div class="replycontents" style="overflow: auto; overflow-x:hidden;">
								오늘은 금요일이당 헤헤헤헤헤헤헤헤 댓글창 거의 끝나간당.
							</div>
							<div class="replyline"></div>
						</div>
					</div>
					<form name="replyForm" action="" method="post">
						<div id="replyContent">
							<textarea class="form-control" rows="5"name="reply"></textarea>
							<div id="replybtndiv">
								<input type="button" id="replybtn"class="btn btn-success" value="Send"/>
							</div>
						</div>
					</form>	
				</div>
			</div>
		</div>
</body>
</html>