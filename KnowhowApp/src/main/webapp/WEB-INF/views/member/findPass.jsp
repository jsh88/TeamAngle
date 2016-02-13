<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div id="showFindPassForm" class="modal-dialog">
		<form action="updateMemberInfoPw">
			<div id="lq3" style="height: 170px;">
				<div class="col-sm-offset-1 col-sm-10 s1">
					<span>Please.. changing password ..</span>
				</div>
				<div class="col-sm-offset-1 col-sm-10">
					<input type="password" id="pass1" class="form-control">
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-offset-1 col-sm-10 s2">
					<span>Please.. again ..</span>
				</div>

				<div class="col-sm-offset-1 col-sm-10">

					<input type="password" id="pass2" name="pw" class="form-control">
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-offset-1 col-sm-10">
					<input type="submit" id="passSubmit"
						class="btn btn-success col-sm-12 btn_choice" value="수정">
				</div>
			</div>
		</form>
	</div>
</body>
</html>