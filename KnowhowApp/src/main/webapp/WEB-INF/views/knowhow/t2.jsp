<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.uploader {
	position: relative;
	overflow: hidden;
	width: 300px;
	height: 350px;
	background: #000000;
	border: 2px dashed #e8e8e8;
}

#imgInp {
	position: absolute;
	width: 300px;
	height: 400px;
	top: -50px;
	left: 0;
	z-index: 2;
	opacity: 0;
	cursor: pointer;
}

#blah {
	position: absolute;
	width: 302px;
	height: 352px;
	top: -1px;
	left: -1px;
	z-index: 1;
	border: none;
	background: #ffffff;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#imgInp").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
	<div class="uploader" onclick="$('#imgInp').click()">
		<form id="form1">
			<input type='file' id="imgInp" /> <img id="blah" alt="" />
		</form>
	</div>
</body>
</html>