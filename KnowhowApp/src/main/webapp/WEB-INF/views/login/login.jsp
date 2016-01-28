<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="mLogin">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>로그인</h3>
		<div class="m_">
			<form name="mlform" action="login.do" method="post">
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id"/></td>
						<td rowspan="2"><input type="submit" value="로그인"/></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pass"/></td>
					</tr>
				</table>
			</form>
		</div>
		</div>
</body>
</html>