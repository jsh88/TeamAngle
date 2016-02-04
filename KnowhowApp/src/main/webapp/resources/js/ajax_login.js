/* 회원 로그인 아작스 */
/* 회원의 아이디 등록여부확인*/

$(function() {
/*$("#lg_btn").attr("disabled", "disabled");*/
// 로그인 처리 조건체크	
/*$("#lg_id").on("keyup", function() {*/
$("#lg_btn").click(function(e) {
	e.preventDefault();
	var id = $("#lg_id").val();
	var pw = $("#lg_pass").val();
	alert(id);
	alert(pw);
	$.ajax({
		url: "logincheck.do",
		type: "POST",
		data: {"id" : id, "pw" : pw},
		dataType: "text",
		success: function(responseData, statusText, xhr) {
			var result = responseData;
			
			/*if(result == 1) {
				$("#lg_id").css("border", "2px solid lime");
					
			} else {
				$("#lg_id").css("border", "2px solid red");
			}*/
			if(result == -1) {
				alert("아이디를 확인해주세요.");
			} else if(result == 0) {
				alert("로그인 성공!!!");
				/*window.location = "../";*/   // 로그인후 이동할 페이지 설정
			} else if(result == 1) {
				alert("비밀번호를 확인해 주세요.");
			}
		},
		error : function(xhr, statusText, responseData) {
			alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
		}	
	});
	
});

/* password가 맞으면 로그인*/
/*$("#lg_pass").on("keyup", function() {
	
	var pw = $("#lg_pass").val();
	
	if(pw.length < 8 || pw.length > 16) {
		$("#lg_pass").css("border", "2px solid red");
	} else {
		$("#lg_pass").css("border", "2px solid lime");
		$("#lg_btn").removeAttr("disabled");
	}
	
});*/
	
});

/*$(function(){
	
	$("#lg_btn").click(function(){
	
		$("#lg_id, #lg_pass").val("");
		$("#lg_id, #lg_pass").css("border", "0.5px solid #cccFFf");

	
	});
	
});*/
	
