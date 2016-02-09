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
		#bestTitle{
			font-size: 20px;
			font-weight: bold;
		}
		
		#mainWrap{
			margin-top: 20px;
		}
		
		#bestTitle{
			font-size: 25px;
			font-weight: bold;
			margin-left: -15px;
		}

		#bestContent{
			margin-left:-15px;
			margin-top:10px;
		}
		
		#bestLeft{
			border: 1px solid #535353;
			height: 430px;
		}
	</style>
</head>
	<body>
		<div class="container-fluid" id="mainWrap">
			<div class="row">
				<div class="col-md-1" id="test"></div>
				<div id="bestWrap" class="col-md-10">
					<div id="bestTitle">
						BestKnowhow
					</div>
					<div id="bestContent">
					<div id="bestLeft">
						<div id="bestSTitle">
						</div>
						<div id="bestMedia">
						</div>
					</div>
					<div id="bestRight">
						<div id="bestContent">
						</div>
						<div id="bestTags">
						</div>
						<div id="bestRecommen">
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	</body>
</html>