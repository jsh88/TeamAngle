<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="mPassing">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<span><a href="#">정보수정</a></span>&nbsp;<span><a href="#">회원탈퇴</a></span>
		<h3>비밀번호입력</h3>
		<p>회원의 비밀번호를 입력해주세요.</p>
		<div class="m_">
			<form name="mjform" method="post">
				<div class="m_input">
					<label for="m_pass">PassWord</label> <input type="password"
						placeholder="pass를 입력하세요" id="m_pass">
				</div>
				<div class="m_btn">
					<input type="button" value="확인" class="logbtn">
				</div>
			</form>
		</div>
	</div>
</body>
</html>