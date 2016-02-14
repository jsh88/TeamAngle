<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		body{
			background-color: #F3F3F3;
		}
		
		.searchResultTitle{
			font-size: 25px;
			font-weight:800;
			margin-bottom: 30px;
		}
		
		#searchWrap{
			margin-top: 20px;
		}
		
		.searchListWrap{
			border: 1px solid #BFBCBC;
			border-radius:6px;
			height: 310px;
			background-color: white;
		}
		
		.searchListHeader{
			height: 40px;
			font-size: 17px;
			font-weight: bold;
			vertical-align: middle;
			line-height: 40px;
		}
		
		.searchListMedia{
			margin-top:8px;
			height: 110px;
		}
		
		.searchListHeaderLine{
			border-bottom: 1px solid #BFBCBC;
		}
		
		.searchMediaIframe{
			position: absolute;
			z-index: 7;
			margin-left: -15px;
			width:100%;
		}
		
		.searchListContent{
			height: 80px;
			margin-top: 10px;
			font-size: 14px;
		}
		
		.searchMediaImg{
			position:absolute;
			width:100%;
			height:110px;
			z-index:6;
			margin-left: -15px;
		}
		
		.searchListTags{
			color: #666666;
			font-size:13px;
			margin-bottom: 6px;
		}
		
		.searchFooterContent{
			color: #666666;
			font-size: 15px;
			margin-left: -15px;
			margin-top:5px;
		}
		
		.reactionspan{
			font-weight: bold;
			margin-right: 10px;
		}
		
		.searchFooterContentImg img{
			margin-top: 5px;
		}	
</style>
</head>

<body>
	<div class="container-fluid" id="searchWrap">
			<div class="row">
				<div class="col-md-1"></div>
				<div  class="col-md-10">
					<div class="searchResultTitle">
						' title ' 에 대한 검색결과 
					</div>
					<div class="searchListWrap col-sm-4 col-md-2">
						<div class="searchListHeader col-md-12">
							title
						</div>
						<div class="searchListHeaderLine col-md-12"></div>
						<div class="searchListMedia col-md-12">
							<img src="" class="searchMediaImg img-responsive">
							<iframe class="searchMediaIframe" src="https://www.youtube.com/embed/ZagjR-wFSNQ?modestbranding=1&rel=0&showinfo=0"  height="110px;" frameborder="0" allowfullscree></iframe>
						</div>
						<div class="searchListContent col-md-12" style="overflow: hidden;">
							Lorem Ipsum is simply dummy text of the printing and typesetting industry...
						</div>
						<div class="searchListTags col-md-12">
							#태그  # 태그당 # 태그
						</div>
						<div class="searchListHeaderLine col-md-12"></div>	
						<div class="searchListFooter col-md-12">
							<div class="col-md-8 searchFooterContent">
								<span class="reactionspan">Reaction</span>12
							</div>
							<div class="col-md-4 searchFooterContentImg" >
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