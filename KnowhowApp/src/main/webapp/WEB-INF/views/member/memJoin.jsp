<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
		<h3>회원가입</h3>
		<p>회원가입란입니다. 회원의 정보를 입력해 주세요</p>

			<form name="mjform" action="addmem.do" method="post">
				<div>
					<table id="mjointable">
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id"/></td>
							<td></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pass"/></td>
							<td></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td colspan="2"><input type="password" name="passcheck"/></td>
						</tr>
						<tr>
							<th>이름</th>
							<td colspan="2"><input type="text" name="name"/></td>
						</tr>
						<tr>
							<th>생일</th>
							<td colspan="2">
							<input type="text" name="birthday"/>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="email" name="email"/></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3">
								<input type="reset" value="다시쓰기"/>&nbsp;&nbsp;
								<input type="submit" value="가입하기"/>
							</td>
						</tr>
					</table>
				</div>
			</form>
</body>
</html>