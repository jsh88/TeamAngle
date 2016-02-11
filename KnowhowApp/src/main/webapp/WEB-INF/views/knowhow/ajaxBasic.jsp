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
<script>
	var value = 0;

	$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
	 // 폼 데이터 받기 or Append or 인자로 form id)
	var formData = new FormData();
	formData.append("key", value);

	$.ajax({
		type : 'POST',
		url : 'completeWrite',
		data : formData,
		processData : false,
		contentType : false,

		success : function(v) {
			
			// 성공처리(v는 서버로 받은 메시지, value)
			
		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');
			
		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인
			alert("code:" + request.status + "\n\n" + "message:"
					+ request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
			$(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');
			$("#addModal").modal("hide");

		}
	});
</script>
<style type="text/css">
	
	/*화면 전체를 어둡게 합니다.*/
	.wrap-loading { 
		position: fixed;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		background: rgba(0, 0, 0, 0.2);
	}
	
	.wrap-loading div { 							/*로딩 이미지*/
		width: 1000; 								/*div의 전체 가로픽셀*/
		position: absolute; 						/*테이블의 영향을받지않는 div*/
		left: 50%; 									/*div 왼쪽 top 부분이 가로 전체의 중간으로 위치하게됨*/
		margin-left: -500px;						/* 왼쪽 top부분이 가운데로왔으니 좌측에서 전체가로픽셀의 반을 마이너스하여 좌측으로 옮겨줌 */										
	}
	
	.display-none { /*감추기*/
		display: none;
	}
</style>
</head>
<body>

	<div class="wrap-loading display-none">
		<div>
			<img src="resources/images/loading2.gif" />
			<!-- 로딩 -->
		</div>
	</div>

</body>
</html>