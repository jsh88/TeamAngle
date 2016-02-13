<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
			width:100%;
			height: 5px;
			clear:both;
			border-bottom: 1px solid #BFBCBC;
		}
		
		::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
 
			 ::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url('./images/bg.png') #efefef}
 
			 ::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
			 
			 ::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}
	</style>
<!-- 	<div class="modal fade" id="detailModal" data-backdrop="static"> -->
		<div class="modal-dialog" id="detailDialog">
			
		</div>
<!-- 		</div> -->