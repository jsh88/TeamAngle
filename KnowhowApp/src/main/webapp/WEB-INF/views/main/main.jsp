<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script 	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link type="text/css" href="resources/css/header.css" rel="stylesheet">
<script src="resources/js/main.js"></script>
<script src="resources/js/ajax_myModfy.js"></script>
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
			margin-left: -500px;						/* 왼쪽 top부분이 가운데로왔으니 좌측에서 전체가로픽셀의 반을 마이너스하여 좌측으로 옮겨줌 */										
		}
		
		.display-none { /*감추기*/
			display: none;
		}
	
		body{
			background-color: #F3F3F3;
		}
	
		#bestTitle{
			font-size: 20px;
			font-weight: bold;
		}
		
		#bestWrap{
			margin-top: 10px;
		}
		
		.bestListWrap{
			border: 1px solid #BFBCBC;
			border-radius:6px;
			background-color: white;
			margin-right: 5px;
			margin-top: 5px;
			cursor: pointer;
		}
		
		.bestListHeader{
			height: 40px;
			font-size: 17px;
			font-weight: bold;
			vertical-align: middle;
			line-height: 50px;
			overflow: hidden;
		}
		
		.bestListHeader a{
			color: black;
			text-decoration: none;
		}
		
		.bestListMedia{
			margin-top:8px;
			height: 150px;
		}
		
		.bestListHeaderLine{
			border-bottom: 1px solid #BFBCBC;
		}
		
		.bestMediaIframe{
			position: absolute;
			z-index: 7;
			margin-left: -15px;
			width:100%;
		}
		
		.bestListContent{
			height: 80px;
			margin-top: 10px;
			font-size: 14px;
		}
		
		.bestMediaImg{
			position:absolute;
			width:100%;
			height:150px;
			z-index:6;
			margin-left: -15px;
		}
		
		.bestListTags{
			margin-top:5px;
			color: #BFBCBC;
			font-size:13px;
			margin-bottom: 6px;
			overflow: hidden;
			font-style: italic;
			font-weight: bold;
		}
		
		.bestListTags a{
			text-decoration: none;
			color: #BFBCBC;
		}
		
		.bestListTags a:hover{
			color:black;
			text-decoration: underline;
		}
		
		.bestListDate{
			color:#666666;
			font-size: 13px;
		}
		
		.bestFooterContent{
			color: #666666;
			font-size: 15px;
			margin:0px auto;
			margin-top:5px;
			font-size: 13px;
			margin-top:10px;
			margin-bottom: 15px;
		}
		
		.reactionspan{
			font-weight: bold;
			margin-right: 10px;
		}
		
		.bestFooterContentImg img{
			margin-top: 5px;
		}
		
		.reImg{
			float:left;
			vertical-align: middle;
			margin-left: -15px;
		}
		
		.reImg img{
			min-width:25px;
			margin-left: -15px;
			float: left;
		}
		
		.reIn{
			margin-left: -15px;
		}
		
		.vImg{
			float:left;
			margin-left: -15px;
		}
		
		.vImg img{
			min-width:22px;
			float: left;
			margin-left: -10px;
		}
		
		.vIn{
			float: left;
			margin-left: 10px;
		}
		
		.cImg{
			vertical-align: middle;
			margin-left: 20px;
		}
		
		.cImg img{
			min-width:25px;
			margin-left: -15px;
			float: left;
		}
		
		.cIn{
			margin-left: -15px;
			float: left;
			margin-left: 10px;
		}
		
		#bestTitle{
			font-size: 32px;
			font-weight: bold;
			margin-left: -15px;
			margin-top: 20px;
		}
		
/* 		#bestLastLine{
			margin-top: 35px;
			margin-bottom: 35px;
			border-bottom: 2px solid #BFBCBC;
		} */
		
		.bestListWriter{
			float:right;
			font-size: 12px;
		}
		
		#listTitle{
			font-size: 32px;
			font-weight: bold;
			margin-top: 20px;
		}
		
		.bestTitleLine{
			border-bottom: 1px solid #BFBCBC;
			margin-bottom: 20px;
		}
		
</style>
</head>
	<body style="overflow: auto; overflow-x:hidden;">
	
	<div class="wrap-loading display-none">
		<div>
			<img src="resources/images/loading2.gif" />
			<!-- 로딩 -->
		</div>
	</div>
	
		<div class="container-fluid" id="mainWrap">
			<div class="row">
				<div class="col-md-1"></div>
				<div id="bestWrap" class="col-md-10">
					
					<div id="bestTitle" class="col-md-12">
						Best Knowhow
					</div>
					<div class="bestTitleLine col-md-11"></div>
					<div class="col-md-12" id="bestPost"></div>
					
					<div id="bestLastLine" class="col-md-12"></div>
					
					<div id="listTitle" class="col-md-12">
						New Knowhow
					</div>
					<div id="listLine" class="bestTitleLine col-md-11"></div>
					<div class="col-md-12" id="newPost"></div>
					
				</div>
				<div class="col-md-1"></div>
		</div>
	</div>
	</body>
</html>