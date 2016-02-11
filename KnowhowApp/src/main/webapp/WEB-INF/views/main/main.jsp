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
	<style>
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
			height: 340px;
			background-color: white;
		}
		
		.bestListHeader{
			height: 40px;
			font-size: 17px;
			font-weight: bold;
			vertical-align: middle;
			line-height: 50px;
		}
		
		.bestListHeader a{
			color: black;
			text-decoration: none;
		}
		
		.bestListMedia{
			margin-top:8px;
			height: 110px;
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
			height:110px;
			z-index:6;
			margin-left: -15px;
		}
		
		.bestListTags{
			color: #666666;
			font-size:13px;
			margin-bottom: 6px;
			overflow: hidden;
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
		
		#ListtTitle{
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
		<div class="container-fluid" id="mainWrap">
			<div class="row">
				<div class="col-md-1"></div>
				<div id="bestWrap" class="col-md-10">
					
					<div id="bestTitle" class="col-md-12">
						Best Knowhow
					</div>
					<div class="bestTitleLine col-md-12"></div>
					
					<div class="bestListWrap col-sm-4 col-md-2">
						<div class="bestListHeader col-md-12">
							<a href="#">Siatama! </a>
						</div>
						<div class="bestListDate col-md-6">2016-02-11</div>
						<div class="bestListWriter col-md-6"><a href="#">와닉네임이당</a></div>
						<div class="bestListHeaderLine col-md-12"></div>
						<div class="bestListMedia col-md-12">
							<img src="" class="bestMediaImg img-responsive">
							<iframe class="bestMediaIframe" src="https://www.youtube.com/embed/ZagjR-wFSNQ?modestbranding=1&rel=0&showinfo=0"  height="110px;" frameborder="0" allowfullscree></iframe>
						</div>
						<div class="bestListContent col-md-12" style="overflow: hidden;">
							Lorem Ipsum is simply dummy text of the printing and typesetting industry...
						</div>
						<div class="bestListTags col-md-12">
							#태그  # 태그당 # 태그
						</div>
						<div class="bestListHeaderLine col-md-12"></div>	
						<div class="bestListFooter col-md-12">
							<div class="col-md-12 bestFooterContent">
								<div class="col-md-4 reImg"><div class="col-md-12 reIn"><img class="img-responsive" src="resources/images/recomment.png"/>32</div></div>
								<div class="col-md-4 vImg"><div class="col-md-12 vIn"><img class="img-responsive" src="resources/images/viewnumber.png"/>&nbsp;20</div></div>
								<div class="col-md-4 cImg"><div class="col-md-12 cIn"><img class="img-responsive" src="resources/images/comment.png"/>11</div></div>
							</div>
						</div>
					</div>
					
					<div id="bestLastLine" class="col-md-12"></div>
					
					<div id="ListtTitle" class="col-md-12">
						New Knowhow
					</div>
					<div class="bestTitleLine col-md-12"></div>
				</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	</body>
</html>