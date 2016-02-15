/* 회원 로그인 아작스 */

$(function() {
	
	$('#navtag').css('width', $(window).width());

	//비밀번호 찾기 이메일로 링크 클릭후 뜨는 비번수정페이지 비밀번호 확인체크
	$("#passSubmit").attr("disabled", "disabled");
	$("#modify_pass1").on("keyup", function() {
		
		var pass1 = $("#modify_pass1").val();
		
		if(pass1.length < 8 || pass1.length > 16) {
			$("#modify_pass1").css("border", "2px solid red");
			$("#passSubmit").attr("disabled", "disabled");
		} else {
			$("#modify_pass1").css("border", "2px solid lime");
			$("#passSubmit").attr("disabled", "disabled");
		}	
	});
	$("#modify_pass2").on("keyup", function() {
		var pass1 = $("#modify_pass1").val();
		var pass2 = $("#modify_pass2").val();
		if(pass2.length < 8 || pass2.length > 16) {
			$("#modify_pass2").css("border", "2px solid red");
			$("#passSubmit").attr("disabled", "disabled");
		} else if(pass1 == pass2){
			$("#modify_pass2").css("border", "2px solid lime");
			$("#passSubmit").attr("disabled", "disabled");
			$("#passSubmit").removeAttr("disabled");
		}	
		
	});			


});	