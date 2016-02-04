
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
	
	$(document).ready(function() {
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
			
			$('#show2').first().show('slow', function lq1() {
				$('#lq1').show('slow');
				$('#lq2, #lq3, #lq4').hide(1000);
			});
		});
		$('#l2').click(function() {
			
			$('#show2').first().show('slow', function lq1() {
				$('#lq2').show('slow');
				$('#lq1, #lq3, #lq4').hide(1000);
			});
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
});

$(function() {
	
$("#passCheck").on("keyup", function() {
	
	var pw = $("#passCheck").val();
	$.ajax({
		url: "memberUpdatePassCheck.ajax",
		type: "POST",
		data: {"pw": pw},
		dataType: "text",
		success: function(responseData, statusText, xhr) {
			var result = responseData;
			
			if(result >= 1) {
				$("#passCheck").css("border", "2px solid red");
				$("#p1").attr("disabled", "disabled");
			} else if(result == 0) {
				$("#passCheck").css("border", "2px solid lime");
				$("#p1").removeAttr("disabled");
			}			
		},
		error : function(xhr, statusText, responseData) {
			$(".chk").text("x").css("color", "red");
			/*alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);*/
		}	
	});	
});


/*// ID 사용가능 체크
$("#id").on("keyup", function() {
	
	var id = $("#id").val();
	$.ajax({
		url: "updateMemberInfoId.ajax",
		type: "POST",
		data: {"id" : id},
		dataType: "text",
		success: function(responseData, statusText, xhr) {
			var result = responseData;
			
			if(result >= 1) {
				$("#id확인후메시지뿌려지는곳id").text("사용 불가능한 아이디 입니다.").css("color", "red");
				$("#submit 버튼id ").attr("disabled", "disabled");
			} else if(result == 0) {
				$("#id확인후메시지뿌려지는곳id").text("사용 가능한 아이디 입니다.").css("color", "blue");
				$("#submit 버튼id ").removeAttr("disabled");
			}			
		},
		error : function(xhr, statusText, responseData) {
			$(".chk").text("x").css("color", "red");
			alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
		}	
	});	
});*/
			
	
//닉네임 사용가능 체크
$("#nickname").on("keyup", function() {
	
	var nickname = $("#nickname").val();
	
	$.ajax({
		url: "updateMemberInfoNickName.ajax",
		type: "POST",
		data: {"nickname": nickname},
		dataType: "text",
		success: function(responseData, statusText, xhr) {
			var result = responseData;
			
			if(result >= 1) {
				$("#nickname확인후메시지뿌려지는곳id").text("사용 불가능한 닉네임 입니다.").css("color", "red");
				$("#submit 버튼id ").attr("disabled", "disabled");
			} else if(result == 0) {
				$("#nickname확인후메시지뿌려지는곳id").text("사용 가능한 닉네임 입니다.").css("color", "blue");
				$("#submit 버튼id ").removeAttr("disabled");
			}			
		},
		error : function(xhr, statusText, responseData) {
			$(".chk").text("x").css("color", "red");
			/*alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);*/
		}	
	});	
});	
	
	
//회원수정페이지 비밀번호 확인체크
$("#회원수정페이지 비밀번호 입력되는곳id").on("keyup", function() {
	
	var pass = $("#회원수정페이지 비밀번호 입력되는곳id").val();
	if(pass.length < 8 || pass.length > 16) {
		$("#회원수정페이지비밀번호메시지뿌려지는곳id").text("비밀번호는 8자 이상부터 16자 이하만 사용이 가능합니다.").css("color", "red");
		$("#submit 버튼id ").attr("disabled", "disabled");
	} else {
		$("#회원수정페이지비밀번호메시지뿌려지는곳id").text("비밀번호 사용이 가능합니다.").css("color", "blue");
		$("#submit 버튼id ").removeAttr("disabled");
	}	
});

});























