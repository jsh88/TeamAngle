<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function (){
	
	$("#lg_content").show();
	$("#lg_findId").hide();
	$("#lg_findPass").hide();
	
});
/* 예외처리 */
function findChecker(i) {

	if(i == "e"){ 
		if($("#lg_findId").css("display")=='none') {

			$("#lg_findId").slideDown(1000);
			
			if($("#lg_findPass").css("display")=='block') {
				$("#lg_findPass").hide(1000);
			}
			
		} else {
			$("#lg_findId").hide(1000);
			$("#lg_findPass").hide(1000);

			}
	} else {
	
		if($("#lg_findPass").css("display")=='none') {
			$("#lg_findPass").slideDown(1000);
		} else {
			$("#lg_findPass").hide(1000);
			$("#lg_findId").hide(1000);
		}
	}
}
</script>
<style>

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
	height: 200px;
}
#lg_findPass {
	height: 140px;
}
#lg_findId .btn, #lg_findPass .btn {
	background-color: tomato;
	margin-top: 15px;
} 

</style>

</head>
<body>
	<div class="modal-dialog">
			<div id="lg_content" class="modal-content">
 				<form class="form" action="logincheck.do" method="post">
					
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
									
									<input type="submit" id="lg_btn" class="btn btn-success col-sm-12" value="Sign in">
									
									
									</div>
									<div class="col-sm-12">
										<a href="#" onclick="findChecker('e')" id="find_id">아이디</a>&nbsp;/&nbsp;<a href="#" onclick="findChecker('2')" id="find_pass">비밀번호</a>를 잃어버리셨나요?
									</div>
							</div>
							
						</div>
					</div>
 				</form> 
			</div>
			
			<div id="lg_findId" class="modal-content">
				<form name="findEmail" action="" method="post">			
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
						 	<input type="submit" value="From Confirm" class="btn btn-default col-sm-12">
						 </div>
					</div>
				</form>
			</div>
			
			<!-- authentication = 인증 (Email로 인증하여 비밀번호 수정란으로 이동) -->
			<div id="lg_findPass" class="modal-content">
				<form name="findPass" action="" method="post">			
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
								<input type="submit" value="From Confirm" class="btn btn-default col-sm-12">
							</div>
					</div>
				</form>
			</div>
			
	</div>
	<script src="resources/js/ajax_login.js"></script>
</body>
</html>