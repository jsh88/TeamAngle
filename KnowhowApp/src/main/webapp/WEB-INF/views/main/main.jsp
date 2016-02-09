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
		
		#mainWrap{
			margin-top: 20px;
		}
		
		.mainListWrap{
			border: 1px solid #BFBCBC;
			border-radius:6px;
			height: 310px;
			background-color: white;
		}
		
		.mainListHeader{
			height: 40px;
			font-size: 17px;
			font-weight: bold;
			vertical-align: middle;
			line-height: 40px;
		}
		
		.mainListMedia{
			margin-top:8px;
			height: 110px;
		}
		
		.mainListHeaderLine{
			border-bottom: 1px solid #BFBCBC;
		}
		
		.mainMediaIframe{
			position: absolute;
			z-index: 7;
			margin-left: -15px;
			width:100%;
		}
		
		.mainListContent{
			height: 80px;
			margin-top: 10px;
			font-size: 14px;
		}
		
		.mainMediaImg{
			position:absolute;
			width:100%;
			height:110px;
			z-index:6;
			margin-left: -15px;
		}
		
		.mainListTags{
			color: #666666;
			font-size:13px;
			margin-bottom: 6px;
		}
		
		.mainListFooter{
		}
		
		.mainFooterContent{
			color: #666666;
			font-size: 15px;
			margin-left: -15px;
			margin-top:5px;
		}
		
		.reactionspan{
			font-weight: bold;
			margin-right: 10px;
		}
		
		.mainFooterContentImg img{
			margin-top: 5px;
		}
	</style>
</head>
	<body style="overflow: auto; overflow-x:hidden;">
		<div class="container-fluid" id="mainWrap">
			<div class="row">
				<div class="col-md-1"></div>
				<div id="bestWrap" class="col-md-10">
					<div class="mainListWrap col-sm-4 col-md-2">
						<div class="mainListHeader col-md-12">
							title
						</div>
						<div class="mainListHeaderLine col-md-12"></div>
						<div class="mainListMedia col-md-12">
							<img src="" class="mainMediaImg img-responsive">
							<iframe class="mainMediaIframe" src="https://www.youtube.com/embed/ZagjR-wFSNQ?modestbranding=1&rel=0&showinfo=0"  height="110px;" frameborder="0" allowfullscree></iframe>
						</div>
						<div class="mainListContent col-md-12" style="overflow: hidden;">
							Lorem Ipsum is simply dummy text of the printing and typesetting industry...
						</div>
						<div class="mainListTags col-md-12">
							#태그  # 태그당 # 태그
						</div>
						<div class="mainListHeaderLine col-md-12"></div>	
						<div class="mainListFooter col-md-12">
							<div class="col-md-8 mainFooterContent">
								<span class="reactionspan">Reaction</span>12
							</div>
							<div class="col-md-4 mainFooterContentImg" >
								<img src="resources/images/test1.png">
							</div>
						</div>
					</div>
				</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	</body>
</html>