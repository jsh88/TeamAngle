/* 회원가입 아작스 */

// 회원가입창 Null 체크
function valInputDate() {

	var id = document.getElementById('mj_id');
    var nick = document.getElementById('mj_nickname');
    var pass1 = document.getElementById('mj_pass1');
    var pass2 = document.getElementById('mj_pass2');
    
    if(!chk(/^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/, id, "이메일 형식에 어긋납니다."))
        return false;
}
// 체크 후 행동
 function chk(re, e, msg) {
               if (re.test(e.value)) {
                       return true;
               }
 
               alert(msg);
               e.value = "";
               e.focus();
               return false;
        }
$(document).ready(function() {
	// 슬라이드 해제
	
	$('#mj_btn_left, #mj_btn_right, #mj_btn_submit').hide();
	$("#mj_id, #mj_nickname, #mj_pass1, #mj_pass2").val("");

$(function() {
	// 버튼 움직임 함수
	$('#mj_btn_right').click(function() {
		$('#mj_btn_left').show();
	});
	// 아이디 사용가능 체크
	$("#mj_id").on("keyup", function() {
		$('#mj_btn_left').hide();
		
		var id = $("#mj_id").val();
		
		 if(id.length > 4) {
		$.ajax({
			url: "checkId.ajax",
			type: "POST",
			data: {"id": id},
			dataType: "text",
			success: function(responseData, statusText, xhr) {
				var result = responseData;
				if(result >=1) {

					$("#mj_id").css("border", "2px solid red");
					$("#mj_btn_right").hide();
					
				} else if(result == 0){

					$("#mj_id").css("border", "2px solid lime");
					$("#mj_btn_right").show(1000);
				}			
			},
			error : function(xhr, statusText, responseData) {
//				$(".chk1").text("연결이 안돼 임마").css("color", "red");
				alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
			}	
		});
		} else {
			$("#mj_id").css("border", "2px solid red");
			$("#mj_btn_right").hide(1000);
		}
	});
	
	
	
	// 닉네임 사용가능 체크
	$("#mj_nickname").on("keyup", function() {
		$('#mj_btn_left').hide();
		
		var nickname = $("#mj_nickname").val();
		
		if(nickname.length > 1) {
		$.ajax({
			url: "checkNickName.ajax",
			type: "POST",
			data: {"nickname": nickname},
			dataType: "text",
			success: function(responseData, statusText, xhr) {
				var result = responseData;
				
				if(result >=1) {

					$("#mj_nickname").css("border", "2px solid red");
					$("#mj_btn_right").hide();
					
				} else if(result == 0){

					$("#mj_nickname").css("border", "2px solid lime");
					$("#mj_btn_right").show(1000);
				}		
			},
			error : function(xhr, statusText, responseData) {
				//$(".chk2").text("x").css("color", "red");
				alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
			}	
		});
		} else {
			$("#mj_nickname").css("border", "2px solid red");
			$("#mj_btn_right").hide();
		}
	});
	
	
	
	// 첫번째 비밀번호 확인체크
	$("#mj_pass1").on("keyup", function() {
		$('#mj_btn_left').hide();
		
		var pass = $("#mj_pass1").val();
		if(pass.length < 8 || pass.length > 16) {
			$("#mj_pass1").css("border", "2px solid red");
			$("#mj_btn_right").hide();
			/*$("#submit 버튼id ").attr("disabled", "disabled");*/
		} else {
			$("#mj_pass1").css("border", "2px solid green");
			$("#mj_btn_right").show();
		}	
	});
	
	
	
	// 두번째 비밀번호 확인체크
	$("#mj_pass2").on("keyup", function() {
		$("#mj_btn_left").hide();
		$("#mj_btn_right").hide();
		$(".chk3").show();
		var pass = $("#mj_pass1").val();
		var passCheck = $("#mj_pass2").val();
		
		if(pass.length != 0) {
			if(pass != passCheck) {
				$("#mj_pass2").css("border", "2px solid red");

				if($("#mj_pass2").css("border", "2px solid red")) {
						$("#mj_btn_left").show(1000);
						$("#mj_btn_submit").hide(1000);
					} else {
						$("#mj_btn_left").hide(1000);
					}
			} else if(pass == passCheck) {
				$("#mj_pass2").css("border", "2px solid lime");				
				$("#mj_btn_submit").show(1000);
				$("#mj_btn_left").hide(1000);
				
			}
		}
	});
	});
});
	