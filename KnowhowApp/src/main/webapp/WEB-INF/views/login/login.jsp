<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
	<div class="modal-dialog login_dialog_body">
			<div id="lg_content" class="modal-content">
 				<form class="form" method="post" onsubmit="return false;">
					
					<div class="modal-body" id="lg_mdb">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<div class="col-sm-12">
							
							<div class="form-group">
								<label class="col-sm-10" for="lg_id">Please.
									Email ...</label>
									<div class="col-sm-12">
									<input type="email" id="lg_id" name="id"
									class="form-control" autofocus="autofocus"></div>
									
							</div>
							<div class="form-group">
								<label class="col-sm-12" for="lg_pass">Please.
									Password ...</label>
									<div class="col-sm-12">
									<input type="password" id="lg_pass"
									name="pw" class="form-control">
									
									<input type="submit" id="lg_btn" class="btn btn-success col-sm-12" value="Sign in" >
									
									
									</div>
									<div class="col-sm-12">
										It had lost the <a href="#" onclick="findChecker('1')" id="find_id">id</a>&nbsp;/&nbsp;<a href="#" onclick="findChecker('2')" id="find_pass">password</a> ?
									</div>
							</div>
							
						</div>
					</div>
 				</form> 
			</div>
			
			<div id="lg_findId" class="modal-content">
				<form name="findEmail"  method="post">			
					<div class="col-sm-12">
						<div id="fi" class="col-sm-12"></div>
							<div class="form-group">
							<label class="col-sm-12" for="auth_Nickname">Please.
									Nickname ...</label>
							<div class="col-sm-12">
							<input type="text" id="auth_Nickname" name="nickname"
									class="form-control" autofocus="autofocus"></div>
							</div>
					
						<div class="form-group">
							<label class="col-sm-12" for="auth_Pass">Please.
									Password ...</label>
								<div class="col-sm-12">
								<input type="password" id="auth_Pass" name="pass"
									class="form-control"></div>
						 </div>
						 <div class="col-sm-12">
						 	<input type="submit" id="findId" value="From Confirm" class="btn btn-default col-sm-12 login-btn-top">
						 	<a href="#" onclick="returnLoginForm('1')" id="backLoginId" class="login-a-left">Return to Login</a>
						 </div>
					</div>
				</form>
			</div>
			
			<!-- authentication = 인증 (Email로 인증하여 비밀번호 수정란으로 이동) -->
			<div id="lg_findPass" class="modal-content">
				<form name="findPass" method="post">			
					<div class="col-sm-12">
						<div id="fi" class="col-sm-12"></div>
							<div class="form-group">
							<label class="col-sm-12" for="auth_Email">Please.
									  Send an email to you..</label>
							<div class="col-sm-12">
							<input type="text" id="auth_Email" name="id"
									class="form-control" autofocus="autofocus"></div>
							</div>
							<div class="col-sm-12">
								<input type="submit" id="findPw" value="From Confirm" class="btn btn-default col-sm-12 login-btn-top">
								<a href="#" onclick="returnLoginForm('2')" id="backLoginPass" class="login-a-left">Return to Login</a>
							</div>
					</div>
				</form>
			</div>
			
	</div>
	<script src="resources/js/ajax_login.js"></script>
</body>
</html>