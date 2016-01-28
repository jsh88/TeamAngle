<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<div id="mJoin">
		<h3>회원정보 수정</h3>
		<p>회원정보 수정란입니다. 회원의 정보를 입력해 주세요</p>
		<div class="m_">
			<form name="mjform" action="modifymem.do" method="post">
				<input type="hidden" name="id" value="${member.id }"/>
				<div>
					<table id="mjointable">
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pass" value="${member.pass }"/></td>
							<td></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td colspan="2"><input type="password" name="passcheck"/></td>
						</tr>
						<tr>
							<th>이름</th>
							<td colspan="2"><input type="text" name="name" value="${member.name }"/></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="email" name="email" value="${member.email }"/></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3">
								<input type="reset" value="다시쓰기"/>&nbsp;&nbsp;
								<input type="submit" value="수정하기"/>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>