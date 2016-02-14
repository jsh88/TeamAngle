
// 회원정보수정창 전 비밀번호창 Null 체크
/*function MemberUpdatePreFormCheck() {
	
	//비밀번호 입력란 Null 체크
	if(document.폼name.pass입력란name.value == "") {
		alert("비밀번호가 입력되지 않았습니다. \n비밀번호를 입력해주세요.");
		document.폼name.pass입력란name.focus();
		return false;
	}
}*/
$(document).ready(function(){
	
	//$(document).ready(function() {
		$('#show1, #show2, #lq1, #lq2, #lq3, #lq4').hide();

		$('#btnpw').click(function() {
			$('#show').show();
			$('#show1, #show2, #lq1, #lq2, #lq3, #lq4').hide();

			$('#passCheck').css("border", "0.5px solid #cccfff");
			$("#passCheck, #edit_id, #edit_nick, #edit_pass1, #edit_pass2").val("");
		});

		$('#p1').click(function() {
			$('#show1').slideDown('slow');
			$('#lq1, #lq2, #lq3, #lq4').hide();
			$('#show').slideUp(800);
			
		});

		$('#l1').click(function() {
			
			var id = document.emailEdit.h_id.defaultValue;
			
			$('#show2').first().show('slow', function lq1() {
				$('#lq1').show('slow');
				$('#lq2, #lq3, #lq4').hide(1000);
			});
			document.emailEdit.id.value = id;
		});
		$('#l2').click(function() {
			
			var nickname = document.nickEdit.h_nickname.defaultValue;
			
			$('#show2').first().show('slow', function lq1() {
				$('#lq2').show('slow');
				$('#lq1, #lq3, #lq4').hide(1000);
			});
			document.nickEdit.nick.value = nickname;
		});
		$('#l3').click(function() {
			
			$('#show2').first().show('slow', function lq1() {
				$('#lq3').show('slow');
				$('#lq1, #lq2, #lq4').hide(1000);

			});
		});
		$('#l4').click(function() {
			
			$('#show2').first().show('slow', function lq1() {
				$('#lq4').show('slow');
				$('#lq1, #lq2, #lq3').hide(1000);

			});
		});	

		
		
				
});


$(function() {
	
	// 비밀번호 체크
	$("#p1").attr("disabled", "disabled");
	$("#passCheck").on("keyup", function() {
		
		var pw = $("#passCheck").val();
		$.ajax({
			url: "memberUpdatePassCheck.ajax",
			type: "POST",
			data: {"passCheck": pw},
			dataType: "text",
			success: function(responseData, statusText, xhr) {
				var result = responseData;
				
				if(result == 1) {
					$("#passCheck").css("border", "2px solid red");
					
				} else if(result == 0) {
					$("#passCheck").css("border", "2px solid lime");
					$("#p1").removeAttr("disabled");
				}			
			},
			error : function(xhr, statusText, responseData) {
				//	$(".chk").text("x").css("color", "red");
				alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
			}	
		});	
	});
	
});



$(function() {
	
	// 아이디 사용가능 체크
	$("#emailSubmit").attr("disabled", "disabled");
	$("#edit_id").on("keyup", function() {
		var id = $("#edit_id").val();
		$.ajax({
			url: "updateMemberInfoId.ajax",
			type: "POST",
			data: {"id" : id},
			dataType: "text",
			success: function(responseData, statusText, xhr) {
				var result = responseData;
				if(result >= 1) {
					$("#edit_id").css("border", "2px solid red");
					$("#emailSubmit").attr("disabled", "disabled");
				} else if(result == 0) {
					$("#edit_id").css("border", "2px solid lime");
					$("#emailSubmit").removeAttr("disabled");
				}			
			},
			error : function(xhr, statusText, responseData) {
				$(".chk").text("x").css("color", "red");
				alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
			}	
		});	
	});
		
});



$(function() {
	
	//닉네임 사용가능 체크
	$("#nickNameSubmit").attr("disabled", "disabled");
	$("#nick").on("keyup", function() {
		var nickname = $("#nick").val();
		
		$.ajax({
			url: "updateMemberInfoNickNameCheck.ajax",
			type: "POST",
			data: {"nickname": nickname},
			dataType: "text",
			success: function(responseData, statusText, xhr) {
				var result = responseData;
				
				if(result >= 1) {
					$("#nick").css("border", "2px solid red");
					$("#nickNameSubmit").attr("disabled", "disabled");
				} else if(result == 0) {
					$("#nick").css("border", "2px solid lime");
					$("#nickNameSubmit").removeAttr("disabled");
				}			
			},
			error : function(xhr, statusText, responseData) {
				$(".chk").text("x").css("color", "red");
				/*alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);*/
			}	
		});	
	});

	
});



$(function() {


	//회원수정페이지 비밀번호 확인체크
	$("#passSubmit").attr("disabled", "disabled");
	$("#edit_pass1").on("keyup", function() {
		
		var pass1 = $("#edit_pass1").val();
		
		if(pass1.length < 8 || pass1.length > 16) {
			$("#edit_pass1").css("border", "2px solid red");
			$("#passSubmit").attr("disabled", "disabled");
		} else {
			$("#edit_pass1").css("border", "2px solid lime");
			$("#passSubmit").attr("disabled", "disabled");
		}	
	});
	$("#edit_pass2").on("keyup", function() {
		var pass1 = $("#edit_pass1").val();
		var pass2 = $("#edit_pass2").val();
		if(pass2.length < 8 || pass2.length > 16) {
			$("#edit_pass2").css("border", "2px solid red");
			$("#passSubmit").attr("disabled", "disabled");
		} else if(pass1 == pass2){
			$("#edit_pass2").css("border", "2px solid lime");
			$("#passSubmit").attr("disabled", "disabled");
			$("#passSubmit").removeAttr("disabled");
		}	
		/*if(pass1 == pass2){
			$("#passSubmit").removeAttr("disabled");
		}*/
	});			


});	
	


$(function() {
	
	//회원탈퇴 체크
	$("#deleteMember").click(function(e) {
		e.preventDefault();
		var check = confirm("정말 탈퇴하시겠습니까?");
		if(check==true) {
			$.ajax({
				url: "sendMemberDelete.do",
				type: "POST",		
				dataType: "text",
				success: function(responseData, statusText, xhr) {
					var result = responseData;
					
					if(result == 1) {
						alert("이메일 발송 성공!!!");
//						session.removeAttribute("member");
						window.location.href="./";
//						session.invalidate();
					} else {
						alert("이메일 발송 실패!!!");
						window.location.href="./";
					}			
				},
				error : function(xhr, statusText, responseData) {
					//$(".chk").text("x").css("color", "red");
					alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
				}	
			});	
		}
		
	});	
	
});
































