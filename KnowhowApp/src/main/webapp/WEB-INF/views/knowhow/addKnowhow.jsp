<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">	
<title>addKnowhow</title>
<link rel="stylesheet" href="../boot/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="../boot/js/bootstrap.min.js"></script>
</head>
<body>
	<form name="addknowhow" action="" method="post">
		<div id="addEntry">
			<div id="addHeader"><!--  닫기 버튼  -->
				<button type="button" name="close" onclick="window.close()">
					<img src="resources/images/close.jpg"/>
				</button>
			</div>
			<div id="addContent"><!-- 페이지가 들어갈 div -->
				
			</div>
			<div id="addFooter">
				<div class="add">
					<input type="text" name="tag" size="52"/>
				</div>
				<input type="submit" id="btn_add" value="공유하기" size="30"/>
			</div>
		</div>
	</form>
		<div id="defaultPage"><!-- 기본 페이지  -->
		
			<div id="addTitle">Knowhow 작성 </div>
			<div id="addLine"></div>
			
			<div class="add" id="addtitle">
				<b>제목 :</b> &nbsp;<input type="text" name="title" size="45"/>
			</div>
			<div class="add" id="addcontent">              
				<textarea name="content" rows="15" cols="42" style="overflow: hidden;"></textarea>
			</div>
			<div class="add" id="addfile">
				<input type="file" name="media" size="37" />
			</div>
		</div>
		<div id="AddPage"><!-- 페이지 슬라이드  -->
			<ul>
				<li></li>
			</ul>
		</div>
		<div id="AddPageContent"> <!-- 추가 페이지 입력폼  -->
			<div class="add content">
				<textarea name="content" rows="15" cols="42" style="overflow: hidden;"></textarea>
			</div> 
		</div>
		<div id="btn_Group"><!-- 페이지 상황 -->
			<ul id="btnList">
				<li><a href="#">default</a></li>
			</ul>
		</div>
</body>
</html>