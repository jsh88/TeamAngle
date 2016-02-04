/* 회원 로그인 아작스 */
/* 회원의 아이디 등록여부확인*/

$(function() {
$("#lg_btn").attr("disabled", "disabled");
// 로그인 처리 조건체크	
$("#lg_id").on("keyup", function() {
	
	var id = $("#lg_id").val();
	
	$.ajax({
		url: "checkId.ajax",
		type: "POST",
		data: {"id" : id},
		dataType: "text",
		success: function(responseData, statusText, xhr) {
			var result = responseData;
			
			if(result == 1) {
				$("#lg_id").css("border", "2px solid lime");
						
			} else {
				$("#lg_id").css("border", "2px solid red");
			}
		},
		error : function(xhr, statusText, responseData) {
			alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
		}	
	});
	
});

/* password가 맞으면 로그인*/
$("#lg_pass").on("keyup", function() {
	
	var pw = $("#lg_pass").val();
	
	if(pw.length < 8 || pw.length > 16) {
		$("#lg_pass").css("border", "2px solid red");
	} else {
		$("#lg_pass").css("border", "2px solid lime");
		$("#lg_btn").removeAttr("disabled");
	}
	
});
	
});

$(function(){
	
	$("#lg_btn").click(function(){
	
		$("#lg_id, #lg_pass").val("");
		$("#lg_id, #lg_pass").css("border", "0.5px solid #cccFFf");

	
	});
	
});
	
