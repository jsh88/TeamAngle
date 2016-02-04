/* 회원가입 아작스 */

// 회원가입창 Null 체크
function MemberjoinFormCheck() {
	var mjoin = document.mjoin;
	
	// 아이디 입력란 Null 체크
	if(mjoin.mj_id.value == "" || mjoin.mj_nickname.value == "" 
		|| mjoin.mj_pass1.value == "" ||	mjoin.mj_pass2.value == "") {
		alert("정확히 입력이 되지 않았습니다.");
	
		return false;
	} else {
		return true;
	}

}
$(document).ready(function() {
	// 슬라이드 해제
	
	$("#myCarousel").carousel({
		interval : false
	});
	
	$('#btn1').hide();
	$('#btn3').hide();
	$('.chk').hide();

$(function() {
	// 버튼 움직임 함수
	$('#btn2').click(function() {
		$('#btn1').show();
	});
	//이메일 형식 확인
	var RegexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;

	// 아이디 사용가능 체크
	$("#mj_id").on("keyup", function() {
		$(".chk1").show();
		var id = $("#mj_id").val();
//		alert(id);
		
		$.ajax({
			url: "checkId.ajax",
			type: "POST",
			data: {"id": id},
			dataType: "text",
			success: function(responseData, statusText, xhr) {
				var result = responseData;
				if(result == 0) {
					$(".chk1").text("o").css("color", "green");
					/*$("#submit 버튼id ").attr("disabled", "disabled");*/
				} else {
					$(".chk1").text("x").css("color", "red");
					/*$("#submit 버튼id ").removeAttr("disabled");*/
				}			
			},
			error : function(xhr, statusText, responseData) {
				$(".chk1").text("연결이 안돼 임마").css("color", "red");
//				alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
			}	
		});	
	});
	
	
	
	// 닉네임 사용가능 체크
	$("#mj_nickname").on("keyup", function() {
		$(".chk2").show();
		var nickname = $("#mj_nickname").val();
		
		$.ajax({
			url: "checkNickName.ajax",
			type: "POST",
			data: {"nickname": nickname},
			dataType: "text",
			success: function(responseData, statusText, xhr) {
				var result = responseData;
				
				if(result >= 1) {
					
					$(".chk2").text("x").css("color", "red");
					/*$("#submit 버튼id ").attr("disabled", "disabled");*/
				} else if(result == 0) {
					
					$(".chk2").text("o").css("color", "green");
					/*$("#submit 버튼id ").removeAttr("disabled");*/
				}			
			},
			error : function(xhr, statusText, responseData) {
				$(".chk2").text("x").css("color", "red");
				/*alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);*/
			}	
		});	
	});
	
	
	
	// 첫번째 비밀번호 확인체크
	$("#mj_pass1").on("keyup", function() {
		
		var pass = $("#mj_pass1").val();
		if(pass.length < 8 || pass.length > 16) {
			$("#mj_pass1").css("color", "red");
			$("#btn2").hide();
			/*$("#submit 버튼id ").attr("disabled", "disabled");*/
		} else {
			$("#mj_pass1").css("color", "green");
			$("#btn2").show();
		}	
	});
	
	
	
	// 두번째 비밀번호 확인체크
	$("#mj_pass2").on("keyup", function() {
		$(".chk3").show();
		var pass = $("#mj_pass1").val();
		var passCheck = $("#mj_pass2").val();
		
		if(pass.length != 0) {
			
			if(pass != passCheck) {
				$(".chk3").text("x").css("color", "red").css('font-weight', '800');
				
				$("#btn3").hide(1000);
				
				if($(".chk3").text() == "x") {
				$("#btnlast").show(1000);
					}
			} else if(pass = passCheck) {
				$(".chk3").text("o").css("color", "green");
				
				$("#btnlast").hide();
				$("#btn3").show(1000);
				
			}
		}
	});
	});
});
	