// 회원가입창 Null 체크
function MemberjoinFormCheck() {
	
	// 아이디 입력란 Null 체크
	if(document.폼name.id입력란name.value == "") {
		alert("아이디가 입력되지 않았습니다. \n아이디를 입력해주세요.");
		document.폼name.id입력란name.focus();
		return false;
	}
	
	// 닉네임 입력란 Null 체크
	if(document.폼name.닉네임입력란name.value == "") {
		alert("닉네임이 입력되지 않았습니다. \n닉네임을 입력해주세요.");
		document.폼name.닉네임입력란name.focus();
		return false;
	}
	
	// 비밀번호1 입력란 Null 체크
	if(document.폼name.비밀번호1입력란name.value == "") {
		alert("비밀번호1이 입력되지 않았습니다. \n비밀번호1을 입력해주세요.");
		document.폼name.비밀번호1입력란name.focus();
		return false;
	}
	
	// 비밀번호2 입력란 Null 체크
	if(document.폼name.비밀번호2입력란name.value == "") {
		alert("비밀번호2이 입력되지 않았습니다. \n비밀번호2을 입력해주세요.");
		document.폼name.비밀번호2입력란name.focus();
		return false;
	}
}


$(function() {
	
	// 아이디 사용가능 체크
	$("#id").on("keyup", function() {
		
		var id = $("#id").val();
		
		$.ajax({
			url: "checkId.ajax",
			type: "POST",
			data: {"id": id},
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
				alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
			}	
		});	
	});
	
	
	
	// 닉네임 사용가능 체크
	$("#nickname").on("keyup", function() {
		
		var nickname = $("#nickname").val();
		
		$.ajax({
			url: "checkNickName.ajax",
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
				alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
			}	
		});	
	});
	
	
	
	// 첫번째 비밀번호 확인체크
	$("#첫번째 비밀번호 입력되는곳id").on("keyup", function() {
		
		var pass = $("#첫번째 비밀번호 입력되는곳id").val();
		if(pass.length < 8 || pass.length > 16) {
			$("#첫번째비밀번호메시지뿌려지는곳id").text("비밀번호는 8자 이상부터 16자 이하만 사용이 가능합니다.").css("color", "red");
			$("#submit 버튼id ").attr("disabled", "disabled");
		} else {
			$("#첫번째비밀번호메시지뿌려지는곳id").text("비밀번호 사용이 가능합니다.").css("color", "blue");
			$("#submit 버튼id ").removeAttr("disabled");
		}	
	});
	
	
	
	// 두번째 비밀번호 확인체크
	$("#두번째 비밀번호 입력되는곳id").on("keyup", function() {
		
		var pass = $("#첫번째 비밀번호 입력되는곳id").val();
		var passCheck = $("#두번째 비밀번호 입력되는곳id").val();
		if(pass.length != 0) {
			if(pass != passCheck) {
				$("#두번째 비밀번호뿌려지는곳id").text("비밀번호가 같지 않습니다.").css("color", "red");
				$("#submit 버튼id ").attr("disabled", "disabled");
			} else if(pass = passCheck) {
				$("#두번째 비밀번호뿌려지는곳id").text("비밀번호 사용이 가능합니다.").css("color", "blue");
				$("#submit 버튼id ").removeAttr("disabled");
			}
		} else {
			$("#submit 버튼id ").attr("disabled", "disabled");
		}
	});
	
	
});


// 로그인창 Null 체크
function MemberLoginFormCheck() {
	
	// 아이디 입력란 Null 체크
	if(document.폼name.id입력란name.value == "") {
		alert("아이디가 입력되지 않았습니다. \n아이디를 입력해주세요.");
		document.폼name.id입력란name.focus();
		return false;
	}
	
	// 비밀번호 입력란 Null 체크
	if(document.폼name.비밀번호입력란name.value == "") {
		alert("비밀번호가 입력되지 않았습니다. \n비밀번호를 입력해주세요.");
		document.폼name.비밀번호입력란name.focus();
		return false;
	}	
}


// 회원정보수정창 전 비밀번호창 Null 체크
function MemberUpdatePreFormCheck() {
	
	//비밀번호 입력란 Null 체크
	if(document.폼name.pass입력란name.value == "") {
		alert("비밀번호가 입력되지 않았습니다. \n비밀번호를 입력해주세요.");
		document.폼name.pass입력란name.focus();
		return false;
	}
}


$(function() {

// 로그인 처리 조건체크	
$("#로그인창 아이디 입력되는쪽 id").on("click", function() {
	
	var id = $("#id").val();
	var pw = $("#pw").val();
	
	$.ajax({
		url: "loginAjax",
		type: "POST",
		data: {"id" : id, "pw" : pw},
		dataType: "text",
		success: function(responseData, statusText, xhr) {
			var result = responseData;
			
			if(result == -1) {
				alert("아이디를 확인해주세요.");
			} else if(result == 0) {
				alert("로그인 성공!!!");
				window.location = "../";   // 로그인후 이동할 페이지 설정
			} else if(result == 1) {
				alert("비밀번호를 확인해 주세요.");
			}
		},
		error : function(xhr, statusText, responseData) {
			alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
		}
	});
});
	
	
	
	
	
$("#memberUpdatePassCheck").on("keyup", function() {
	
	var pw = $("#pw").val();
	$.ajax({
		url: "memberUpdatePassCheck.ajax",
		type: "POST",
		data: {"pw": pw},
		dataType: "text",
		success: function(responseData, statusText, xhr) {
			var result = responseData;
			
			if(result >= 1) {
				$("#pw확인후메시지뿌려지는곳id").text("틀린 비밀번호입니다.").css("color", "red");
				$("#submit 버튼id ").attr("disabled", "disabled");
			} else if(result == 0) {
				$("#pw확인후메시지뿌려지는곳id").text("맞는 비밀번호입니다.").css("color", "blue");
				$("#submit 버튼id ").removeAttr("disabled");
			}			
		},
		error : function(xhr, statusText, responseData) {
			alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
		}	
	});	
});


// ID 사용가능 체크
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
			alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
		}	
	});	
});
			
	
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
			alert("error : " + statusText + "." + xhr.status + " - " + xhr.responseText);
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























