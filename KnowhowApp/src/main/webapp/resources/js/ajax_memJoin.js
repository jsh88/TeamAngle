/* 회원가입 아작스 */

/*// 회원가입창 Null 체크
function valInputDate() {

	var id = $('#mj_id').val();
    var nick = $('#mj_nickname').val();
    var pass1 = $('#mj_pass1').val();
    var pass2 = $('mj_pass2').val();
    var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    
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
 */
$(document).ready(function() {
	// 슬라이드 해제
	
	var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	$('#mj_btn_left, #mj_btn_right, #mj_btn_submit').hide();
	$("#mj_id, #mj_nickname, #mj_pass1, #mj_pass2").val("");
	

	// 버튼 움직임 함수
	$('#mj_btn_right').click(function() {
		$('#mj_btn_left').show();
	});
	// 아이디 사용가능 체크
	$("#mj_id").on("keyup", function() {
		$('#mj_btn_left').hide();
		
		var id = $('#mj_id').val();
		
		if(id == ""){
			
			alert('이메일을 입력해주세요.');
			return false;
			
		}else{
		
		 if(regex.test(id) === true) {
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
		 
		 }
	});
	
	//enterkey 제어
	
	$("#mj_id").keypress(function(key){
		
		if(key.keyCode == 13){
			return false;
		}
		
	})
	
	$("#mj_nickname").keypress(function(key){
		
		if(key.keyCode == 13){
			return false;
		}
	});
	
	$("#mj_pass1").keypress(function(key){
		
		if(key.keyCode == 13){
			return false;
		}
	});
	
	$("#mj_pass2").keypress(function(key){
		
		if(key.keyCode == 13){
			return false;
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
			$("#mj_pass1").css("border", "2px solid lime");
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

function joinAndSendEmail() {
	
	$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
	 // 폼 데이터 받기 or Append or 인자로 form id)
	var formData = new FormData();
	formData.append("id", $('#mj_id').val());
	formData.append("pw", $('#mj_pass1').val());
	formData.append("nickname", $('#mj_nickname').val());

	$.ajax({
		type : 'POST',
		url : 'memberJoinProc',
		data : formData,
		processData : false,
		contentType : false,

		success : function(v) {
			
			// 성공처리(v는 서버로 받은 메시지, value)
			alert("'" + v + "'로 인증 메일이 발송되었습니다. 인증 후 사이트 정상 이용이 가능합니다.");
			
		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');
			
		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인
//			alert("code:" + request.status + "\n\n" + "message:"
//					+ request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {
			
			location.href = "index";
			
		}
	});
	
}
	
	