/* 회원 로그인 아작스 */
/* 회원의 아이디 등록여부확인*/

//$(function() {
/*$("#lg_btn").attr("disabled", "disabled");*/
// 로그인 처리 조건체크	
/*$("#lg_id").on("keyup", function() {*/
	

$("#lg_btn").click(function(e) {
	e.preventDefault();
	var id = $("#lg_id").val();
	var pw = $("#lg_pass").val();
	
	$.ajax({
		url: "login/logincheck.do",
		type: "POST",
		data: {"id" : id, "pw" : pw},
		dataType: "text",
		success: function(responseData, statusText, xhr) {
			var result = responseData;			
			
			if(result == "b") {
				alert("회원이 아닙니다.");
				$("#lg_id").val("");
				$("#lg_pass").val("");
			} else if(result == "c") {
	//			alert("로그인 성공!!!");
				document.location.reload();
			} else if(result == "a") {
				alert("비밀번호를 확인해 주세요.");
				$("#lg_id").val("");
				$("#lg_pass").val("");
			} else if(result == "d"){
				alert("인증되지 않은 회원입니다. \n이메일을 확인하여 인증하여 주십시오.")
				$("#lg_id").val("");
				$("#lg_pass").val("");
			}
		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(xhr, statusText, responseData) {
			/*alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);*/
			alert("비밀번호가 틀리거나, 아이디가 맞지 않습니다.");
		},
		complete : function() {

			// 이미지 감추기 처리
			// $(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

		}
	});
});


$("#findId").click(function(e) {
	e.preventDefault();
	var nickname = $("#auth_Nickname").val();
	var pass = $("#auth_Pass").val();
	$.ajax({
		url: "sendId.do",
		type: "POST",
		data: {"nickname" : nickname, "pass" : pass},
		dataType: "text",
		success: function(responseData, statusText, xhr) {
			var result = responseData;
			
			if(result == 1) {
				alert("이메일 발송 성공!!!");
				window.location.href="./";
				$("#auth_Nickname").val("");
				$("#auth_Pass").val("");
			} else {
				alert("이메일 발송 실패!!!");
				document.location.reload();
				$("#auth_Nickname").val("");
				$("#auth_Pass").val("");
			}	
		}
		
	});	
});


$("#findPw").click(function(e) {
	e.preventDefault();
	var id = $("#auth_Email").val();
	
	$.ajax({
		url: "sendPw.do",
		type: "POST",
		data: {"id" : id},
		dataType: "text",
		success: function(responseData, statusText, xhr) {
		var result = responseData;
		
			if(result == 1) {
				alert("이메일 발송 성공!!!");
				document.location.reload();
			} else {
				alert("이메일 발송 실패!!!");
				document.location.reload();
			}	
		}		
	});	
	
});

