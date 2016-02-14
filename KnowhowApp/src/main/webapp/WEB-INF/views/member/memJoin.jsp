<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	/* close icon 펑션 */
		
</script>
<style>
/* * { border: 1px solid black;} */
</style>
</head>
<body>
	<div class="modal-dialog mj_dialog_body" >
		<form name="mjoin" action="memberJoinProc" method="post" onsubmit="return valInputDate();">
			<div class="modal-content" id="mj_content">
				<div id="closeimg" onclick="iconClickGo(1)"><img style="width:20px;" src="resources/images/close.png"/></div>
				
				<div  class="modal-body">
					<div id="mj_head" class="col-sm-offset-1 col-sm-11">
						<h3>
							<b>P</b>lease. <b>S</b>ign <b>i</b>n.
						</h3>
						<p>This is a form registering . Please enter your information.</p>
					</div>

					<div id="mjForm" class="carousel slide" data-interval="false">

						<div class="carousel-inner">

							<!-- 아이디 -->
							<div class="item active">
								<div class="col-sm-12">
									<div class="form-group" id="fg1">
										<label for="id"
											class="col-sm-offset-1 col-sm-11 control-label">Please.
											E-mail</label>
										<div class="col-sm-1"></div>
										<div class="col-sm-10">
											<input type="text" class="form-control " id="mj_id"
												name="id">
										</div>
										<!-- Ajax 체킹 div  -->
										<div class="col-sm-2">
											<div class="chk chk1"></div>
										</div>
									</div>
								</div>
							</div>

							<!-- 닉네임 -->
							<div class="item">
								<div class="col-sm-12">
									<div class="form-group" id="fg2">
										<label for="nickname"
											class="col-sm-offset-1 col-sm-11 control-label">Please.
											Nickname</label>
										<div class="col-sm-1"></div>
										<div class="col-sm-10">
											<input type="text" class="form-control " id="mj_nickname"
												name="nickname">
										</div>
										<!-- Ajax 체킹 div  -->
										<div class="col-sm-1">
											<div class="chk chk2"></div>
										</div>
									</div>
								</div>
							</div>

							<!-- 패스워드 1 -->
							<div class="item">
								<div class="col-sm-12">
									<div class="form-group" id="fg3">
										<label for="pass1"
											class="col-sm-offset-1 col-sm-11 control-label">Please.
											Pass</label>
										<div class="col-sm-1"></div>
										<div class="col-sm-10">
											<input type="password" class="form-control " id="mj_pass1">
										</div>
										<div class="col-sm-2"></div>
									</div>
								</div>
							</div>

							<!-- 패스워드 2 -->
							<div class="item">
								<div class="col-sm-12">
									<div class="form-group" id="fg4">
										<label for="pass2"
											class="col-sm-offset-1 col-sm-11 control-label">Please.
											Pass again</label>
										<div class="col-sm-1"></div>
										<div class="col-sm-10">
											<input type="password" class="form-control " id="mj_pass2"
												name="pw">
										</div>
										<!-- Ajax 체킹 div  -->
										<div class="col-sm-2">
											<div class="chk chk3"></div>

										</div>
									</div>
								</div>
							</div>

						</div>
						<!-- Controls -->
						<!-- Controls buttons -->
					</div>

					<br/>
					
						<div class="col-sm-12">
							<div class="col-sm-1">
								<a id="mj_btn_left" class="carousel-control" href="#mjForm"
									data-slide="prev"> <span
									class="ic glyphicon glyphicon-circle-arrow-left"
									></span></a>
							</div>
							<div class="col-sm-10">
								<input type="submit" id="mj_btn_submit"
									class="btn btn-success col-sm-12" value="등록하기">

							</div>
							<div class="col-sm-1">
								<a id="mj_btn_right" class="carousel-control" href="#mjForm"
									data-slide="next"> <span
									class="ic glyphicon glyphicon-circle-arrow-right"
									></span></a>
							</div>
						</div>
					
				</div>
			</div>
		</form>
	</div>
</body>
</html>