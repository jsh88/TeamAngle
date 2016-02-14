<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.login_dialog_body {
	margin-top: 200px;
}
#lg_content {
margin: 0 auto;
	width: 500px;
	border-radius: 6px;
	border: 10px solid #535353;
	}
#lg_mdb {
		height: 270px;
	}
#lg_mdb label, #lg_findId label, #lg_findPass label{
	margin-top: 5px;
}
#fi, #fp {
	height: 10px;
}

#lg_btn {
	margin-top: 25px;
}
#lg_findId, #lg_findPass {
	margin: 0 auto;
	margin-top: 30px;
	width: 500px;
	
}
#lg_findId {
	height: 230px;
}
#lg_findPass {
	height: 170px;
}
#lg_findId .btn, #lg_findPass .btn {
	background-color: tomato;
	margin-top: 15px;
} 

</style>

</head>
<body>
	<div class="modal-dialog login_dialog_body">
			<div id="lg_content" class="modal-content">
 				<form class="form"  method="post">
					
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
									class="form-control"></div>
									
							</div>
							<div class="form-group">
								<label class="col-sm-12" for="lg_pass">Please.
									Password ...</label>
									<div class="col-sm-12">
									<input type="password" id="lg_pass"
									name="pw" class="form-control">
									
									<input type="button" id="lg_btn" class="btn btn-success col-sm-12" value="Sign in">
									
									
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
									class="form-control"></div>
							</div>
					
						<div class="form-group">
							<label class="col-sm-12" for="auth_Pass">Please.
									Password ...</label>
								<div class="col-sm-12">
								<input type="text" id="auth_Pass" name="pass"
									class="form-control"></div>
						 </div>
						 <div class="col-sm-12">
						 	<input type="submit" id="findId" value="From Confirm" class="btn btn-default col-sm-12">
						 	<a href="#" onclick="returnLoginForm('1')" id="backLoginId">Return to Login</a>
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
									class="form-control"></div>
							</div>
							<div class="col-sm-12">
								<input type="submit" id="findPw" value="From Confirm" class="btn btn-default col-sm-12">
								<a href="#" onclick="returnLoginForm('2')" id="backLoginPass">Return to Login</a>
							</div>
					</div>
				</form>
			</div>
			
	</div>
	<script src="resources/js/ajax_login.js"></script>
</body>
</html>