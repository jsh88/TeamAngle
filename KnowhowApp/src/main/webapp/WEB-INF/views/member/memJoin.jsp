<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>

#head {
	margin-left: 30px;
}

#btn1 {
	color: navy;
	font-size: 20px;

}

#btn2 {
	color: navy;
	font-size: 20px;
}

#dialog3 {
	border: 10px solid #376cbf;
}

#mdf {
	margin-top: 30px;
}
</style>
</head>
<body>
				<form name="mjoin" action="memberJoinProc" method="post">
					<div class="modal-content" id="dialog3">
						<div class="modal-header">
							<div id="head" class="col-sm-6">
								<h3>
									<b>P</b>lease. <b>S</b>ign <b>i</b>n.
								</h3>
							</div>

						</div>
						<hr>
						<div class="modal-body">

							<div id="myCarousel" class="carousel slide">
								<!-- Indicators -->




								<!-- email = id
                           nickname = nickname
                           password = pass1 / pass2(check)
                           각 name과 id를 db 컬럼명과 맞춤
                      -->
								<!-- Carousel items -->
								<div class="carousel-inner">

									<!-- 아이디 -->
									<div class="item active">
										<div class="col-sm-12">
											<div class="form-group" id="fg1">
												<label for="id"
													class="col-sm-offset-1 col-sm-11 control-label">Please.
													E-mail</label>
												<div class="col-sm-1"></div>
												<div class="col-sm-8">
													<input type="email" class="form-control " id="mj_id"
														name="id">
												</div>
												<div class="col-sm-3">
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

												<div class="col-sm-8">
													<input type="text" class="form-control " id="mj_nickname"
														name="nickname">
												</div>
												<div class="col-sm-3">
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

												<div class="col-sm-8">
													<input type="password" class="form-control " id="mj_pass1">
												</div>
												<div class="col-sm-3"></div>
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
												<div class="col-sm-8">
													<input type="password" class="form-control " id="mj_pass2"
														name="pw">
												</div>
												<div class="col-sm-3">
													<div class="chk chk3"></div>

												</div>
											</div>
										</div>
									</div>

								</div>

								<!-- Controls -->


								<!-- Controls buttons -->
							</div>
						</div>

						<div id="mdf" class="modal-footer">
							<div class="col-sm-12" style="height: 30px;">
								<div class="col-sm-1">
									<a id="btn1" class="carousel-control" href="#myCarousel"
										data-slide="prev"><span
										class="ic glyphicon glyphicon-circle-arrow-left"
										aria-hidden="true"></span></a>
								</div>
								<div class="col-sm-7"></div>
								<div class="col-sm-3">
									<input type="submit" id="btn3"
										class="btn btn-success col-sm-12" value="등록하기">
								</div>
								<div id="btnlast" class="col-sm-1">
									<a id="btn2" class="carousel-control" href="#myCarousel"
										data-slide="next"><span
										class="ic glyphicon glyphicon-circle-arrow-right"
										aria-hidden="true"></span></a>
								</div>
							</div>
						</div>
					</div>
				</form>


	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/ajax_memJoin.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</body>
</html>