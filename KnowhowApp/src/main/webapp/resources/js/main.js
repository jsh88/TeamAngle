var bestPostCount = 1;
var postCount = 1;
var searchCount = 1;

$(document).ready(function() {
	
	for(var i = 0; i < 5; i++) {
		getBestPostView();
		getPostView();
		bestPostCount++;
		postCount++;
	}
	
	$('#navtag').css('width', $(window).width());
	
	$(window).resize(function() {
		$('#menu').css('height', $(window).height());
	});
	
	
	/* myPage JQuery Div 움직임 */
	
	$('#menu').hide();
	$('#menu').css('height', $(window).height() - 110);
	$(window).resize(function() {
		$('#menu').css('height', $(window).height() - 110);
	});

	$('#navbtn').click(function() {
		if ($('#menu').css('display') == 'none') {
			$('#menu').slideDown(1000);
		} else {
			$('#menu').slideUp(500);
		}
	});
	
/* header search */
	
	$("#search_txt").focus(function(){
		
		$("#search_txt").css("background-color" , "white").css("color","black");
		$("#search_btn").css("background-color", "white").css("color","black");
		
	});
		
	$("#search_txt").blur(function(){
		
		$("#search_txt").css("background-color" , "#535353").css("color","white");
		$("#search_btn").css("background-color", "#535353").css("color","white");
		
	});
	
	$(".recommenTag").click(function(){
		
		var recommen = $(this).text();
		var reTag = recommen.substring(1);
		
		$("#search_txt").val(reTag);		
	});
	
	// 검색
	$("#search_txt").keypress(function(key){
	
		if(key.keyCode == 13) {
			
			var word = $("#search_txt").val();
			
			if(!word) {
				alert("검색할 태그, 단어를 입력하세요.");
				return false;
			} else {
				
				$("#bestTitle").html("<div class='searchResultTitle'>'" + word + "' 에 대한 검색결과	</div>");
				$("#listTitle").remove();
				$("#listLine").remove();
				$("#newPost").remove();
				$("#bestPost").remove();
				$("#bestLine").after("<div class='col-md-12' id='bestPost'></div>");
				
				for(var i = 0 ; i < 5; i++) {
					
					getSearchPostView(word);
					searchCount++;
					
				}
			}
		}
	});
	
/* memModify JQuery */
	
	$('#show1, #show2, #lq1, #lq2, #lq3, #lq4').hide();
	
	$('#edit_MemModify').click(function() {
		
		$('#show').show();	
		$('#show1, #show2, #lq1, #lq2, #lq3, #lq4').hide();
	
	});
	
	$('#p1').click(function() {
		
		$('#show1').show('slow');
		$('#lq1').hide();
		$('#lq2').hide();
		$('#lq3').hide();
		$('#lq4').hide();

	});

	$('#l1').click(function() {
		
		$('#show').hide('slow');
		
		$('#show2').first().show('slow', function lq1() {
		
			$('#lq1').show('slow');
			$('#lq2').hide(1000);
			$('#lq3').hide(1000);
			$('#lq4').hide(1000);
		});
		
	});
	
	$('#l2').click(function() {
		
		$('#show').hide('slow');
		
		$('#show2').first().show('slow', function lq1() {
			$('#lq2').show('slow');
			$('#lq1').hide(1000);
			$('#lq3').hide(1000);
			$('#lq4').hide(1000);
		});
	
	});
	
	$('#l3').click(function() {
		
		$('#show').hide('slow');
		
		$('#show2').first().show('slow', function lq1() {
			$('#lq3').show('slow');
			$('.s1').show('slow');
			$('.s2').show('slow');

			$('#lq1').hide(1000);
			$('#lq2').hide(1000);
			$('#lq4').hide(1000);
		});
	
	});
	
	$('#l4').click(function() {
		
		$('#show').hide('slow');
		
		$('#show2').first().show('slow', function lq1() {
			$('#lq4').show('slow');
			$('#lq1').hide(1000);
			$('#lq2').hide(1000);
			$('#lq3').hide(1000);
		});
	
	});

/* 로그인 JQuery */
});
// ready end

function getSearchPostView(word) {
	
	// 폼 데이터 받기 or Append or 인자로 form id)
	var formData = new FormData();

	formData.append("word", word);
	formData.append("searchCount", searchCount);

	$.ajax({
		type : 'POST',
		url : 'searchView',
		data : formData,
// 		async : false,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {
			
//			var result = responseData;
			
			$('#bestPost').html($('#bestPost').html() + result);
			
			
			// 성공처리(v는 서버로 받은 메시지, value)
			
		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');
			
		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인
// 			alert("code:" + request.status + "\n\n" + "message:"
// 					+ request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
//				$(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

		}				
	});
	
}

//포스트 리스트 가져오기
function getPostView() {
	// 폼 데이터 받기 or Append or 인자로 form id)
	var formData = new FormData();

	formData.append("no", postCount);

	$.ajax({
		type : 'POST',
		url : 'postView',
		data : formData,
// 		async : false,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {
			
			var result = responseData;
			$('#newPost').html($('#newPost').html() + result);
			
			// 성공처리(v는 서버로 받은 메시지, value)
			
		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');
			
		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인
// 			alert("code:" + request.status + "\n\n" + "message:"
// 					+ request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
//				$(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

		}				
	});
}

// 베스트 포스트 리스트 가져오기
function getBestPostView() {
	// 폼 데이터 받기 or Append or 인자로 form id)
	var formData = new FormData();

	formData.append("no", bestPostCount);

	$.ajax({
		type : 'POST',
		url : 'bestPostView',
		data : formData,
// 		async : false,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {
			
			var result = responseData;
			$('#bestPost').html($('#bestPost').html() + result);
			
			// 성공처리(v는 서버로 받은 메시지, value)
			
		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');
			
		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인
// 			alert("code:" + request.status + "\n\n" + "message:"
// 					+ request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
//				$(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

		}				
	});
}

function modalOpen(i) {

	var modal = "";

	if (i == "1") {
		modal = "memJoinPage";
		$("#mj_id, #mj_nickname, #mj_pass1, #mj_pass2").val("");
		$("#mj_id").show();
		$("#mj_btn_submit").hide();
		
	} else if (i == "2") {
		modal = "loginPage";
		
	} else if (i == "3") {
		modal = "memModifyPage";
	} else if (i == "4") {
		modal = "profileModifyPage";
	} else if (i == "5") {
		modal = "startPostingPage";
	}

	$("#" + modal).modal();
}