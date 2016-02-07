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
		background-color: tomato;
	}

	.searchView{
		background-color:white;
		border: 1px solid #666666;
		border-radius:6px;
		margin-right: 20px;
	}
		
	.searchTitle{
		height: 50px;
		border-bottom: 1px solid #BFBCBC;
	}
	
	.title{
		margin-top:15px;
		font-weight: bold;
		font-size: 17px;
		font-style: "맑은 고딕";
	}
	
	.searchContent{
		margin-top: 20px;
	}
	
	.media{
		margin-top: 20px;
		height: 150px;
	}
	
	.mediaIframe{
		position: absolute;
		z-index: 5;
	}
	
	.mediaImg{
		position:relative;
		width:100%;
		height:150px;
		z-index:6;
	}
	
	.content{
		height: 80px;
		margin-top: 10px;
		padding-left: 10px;
	}
	
	.contentFooter{
		height:50px;
		border-top: 1px solid #BFBCBC;
	}
	
	.tags{
		height: 20px;
		color:#666666;
		margin-top: 5px;
		margin-bottom: 5px;
	}
	
	#searchResultWrap{
		margin-top: 50px;
	}
	
</style>
</head>

<body>
	<div class="container-fluid">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="searchResultWrap">
			<div class="row">
				<div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1" id="searchResult">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="searchResult2">
						
						<div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 searchView" >
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 searchTitle">
								<div class="title">
									<a href="#">제목이다ㅏ아ㅏㅏㅏㅏ</a>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 searchContent">
								<div class="media">
									<iframe class="mediaIframe" src=""  height="150px;" frameborder="0" allowfullscree></iframe>
									<img src="" class="mediaImg img-responsive">
								</div>
								<div class="content">
									내용이당ㅇㅇㅇㅇㅇ
								</div>
								<div class="tags">
									#헤헤헤  #히히히 #호호호
								</div>
								<div class="contentFooter">
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><img src="resources/images/viewnumber.png">&nbsp;25</div>
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><img style="width:45px;" src="resources/images/recomment.png">&nbsp;10</div>
									<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><img style="width:45px;" src="resources/images/comment.png">&nbsp;3</div>
								</div>
							</div>
						</div>
					
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>