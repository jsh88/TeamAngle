<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form name="modifyknowhow" method="post">
		<div id="addEntry">
			<div id="addHeader">
				<div id="Close">
					<button type="button" name="close" onclick="window.close()">
 						<img src="/TeamProject/img/close.jpg">
					</button>
				</div>
				<div id="T">Knowhow 수정</div>
			</div>
			<div class="add" id="addtitle">
				<b>제목 :</b> &nbsp;<input type="text" name="title" size="45"/>
			</div>
			<div class="add" id="addcontent">
				<textarea name="content" rows="15" cols="42" style="overflow: hidden;"></textarea>
			</div>
			<div class="add" id="addfile">
				<input type="file" name="media" size="37" />
			</div>
			<div class="add">
				<input type="text" name="tag" size="52"/>
			</div>
			<div class="add">
				<input type="submit" id="addbtn" value="수정하기" size="30"/>
			</div>
		</div>
	</form>
</body>
</html>