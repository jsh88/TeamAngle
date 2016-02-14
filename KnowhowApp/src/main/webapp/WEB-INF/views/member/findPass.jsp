<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="showFindPassForm" class="modal-dialog">
		<form action="updateMemberInfoPw">
			<div class="modal-content">
			<div  class="modal-body" style="height: 210px;">
			
				<div id="fp_go">
					<div class="col-sm-offset-1 col-sm-10 s1">
						<span>Please.. changing password ..</span>
					</div>
					<div class="col-sm-offset-1 col-sm-10">
						<input type="password" id="modify_pass1" name="pass1" class="form-control">
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-offset-1 col-sm-10 s2">
						<span>Please.. again ..</span>
					</div>

					<div class="col-sm-offset-1 col-sm-10">

						<input type="password" id="modify_pass2" name="pw" class="form-control">
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-offset-1 col-sm-10">
						<input type="submit" id="passSubmit"
							class="btn btn-success col-sm-12 btn_choice" value="수정">
					</div>
				</div>
			</div>
			</div>
		</form>
	</div>
</body>
</html>