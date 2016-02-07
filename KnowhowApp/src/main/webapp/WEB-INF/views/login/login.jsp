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
$(document).ready()
</script>
<style>

#lg_content {
margin: 0 auto;
	width: 500px;
	border-radius: 6px;
	border: 10px solid #376cbf;
	}
#lg_mdb {
		height: 270px;
	}
#lg_mdb label, #lg_findId label, #lg_findPass label{
	margin-top: 5px;
}
#lg_btn {
	margin-top: 25px;
}
#lg_findId, #lg_findPass {
	margin: 0 auto;
	margin-top: 30px;
	width: 500px;
	height: 270px;
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
								<label class="col-sm-6" for="lg_id">Please.
									Email ...</label>
									<div class="col-sm-12">
									<input type="email" id="lg_id" name="id"
									class="form-control"></div>
									
							</div>
							<div class="form-group">
								<label class="col-sm-6" for="lg_pass">Please.
									Password ...</label>
									<div class="col-sm-12">
									<input type="password" id="lg_pass"
									name="pw" class="form-control">
									
									<input type="submit" id="lg_btn" class="btn btn-success col-sm-12" value="Sign in">
									
									
									</div>
									<div class="col-sm-12">
										<a href="#" onclick="" id="find_id">아이디</a>&nbsp;/&nbsp;<a href="#" onclick="" id="find_pass">비밀번호</a>를 잃어버리셨나요?
									</div>
							</div>
							
						</div>
					</div>
 				</form> 
			</div>
			
			<div id="lg_findId" class="modal-content">
			<form name="findEmail" action="" method="post">			
			<div>Find You're Email</div>
				<div class="form-group">
								<label class="col-sm-6" for="lg_nickname">Please.
									Nickname ...</label>
									<div class="col-sm-12">
									<input type="text" id="lg_nickname" name="nickname"
									class="form-control"></div>
				</div>
				<div class="form-group">
								<label class="col-sm-6" for="lg_pass3">Please.
									Nickname ...</label>
									<div class="col-sm-12">
									<input type="text" id="lg_pass3" name="pass"
									class="form-control"></div>
				</div>
				</form>
				</div>
			
			
			
			<div id="lg_findPass" class="modal-content">
				<form name="findEmail" action="" method="post">			
					<div>Find You're Email</div>
						<div class="form-group">
							<label class="col-sm-6" for="lg_nickname">Please.
									Nickname ...</label>
							<div class="col-sm-12">
							<input type="text" id="lg_nickname" name="nickname"
									class="form-control"></div>
						</div>
						<div class="form-group">
							<label class="col-sm-6" for="lg_pass3">Please.
									Nickname ...</label>
								<div class="col-sm-12">
								<input type="text" id="lg_pass3" name="pass"
									class="form-control"></div>
						 </div>
					</form>
			</div>
			
	</div>
	<script src="resources/js/ajax_login.js"></script>
</body>
</html>