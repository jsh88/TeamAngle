var bestPostCount = 1;
var postCount = 1;
var searchCount = 1;
var searchWord = "";
var isSearch = false;
var isModify = false;

$(document)
		.ready(

				function() {

					$('#navtag').css('width', $(window).width());

					// 스크롤 이벤트
					$(window).scroll(
							function() {
								if ($(window).scrollTop() >= $(document)
										.height()
										- $(window).height()) {

									if (!searchWord) {

										morePostView();

									} else if (searchWord) {

										moreSearchPostView();

									}
								}
							});

					for (var i = 0; i < 5; i++) {
						getBestPostView();
						getPostView();
						bestPostCount++;
						postCount++;
					}

					/* myPage JQuery Div 움직임 */

					$('#menu').hide();
					$('#menu').css('height', $(window).height() - 150);
					$(window).resize(function() {
						$('#menu').css('height', $(window).height() - 150);
					});

					$('#navbtn').click(function() {
						if ($('#menu').css('display') == 'none') {
							$('#menu').slideDown(1000);
						} else {
							$('#menu').slideUp(500);
						}
					});

					/* header search */

					$("#search_txt").focus(
							function() {

								$("#search_txt").css("background-color",
										"white").css("color", "black");
								$("#search_btn").css("background-color",
										"white").css("color", "black");

							});

					$("#search_txt").blur(
							function() {

								$("#search_txt").css("background-color",
										"#535353").css("color", "white");
								$("#search_btn").css("background-color",
										"#535353").css("color", "white");

							});

					$(".recommenTag").click(function() {

						var recommen = $(this).text();
						var reTag = recommen.substring(1);

						$("#search_txt").val(reTag);
					});

					// 검색
					$("#search_txt")
							.keypress(
									function(key) {

										if (key.keyCode == 13) {

											searchWord = $("#search_txt").val();

											if (!searchWord) {
												alert("검색할 태그, 단어를 입력하세요.");
												return false;
											} else {

												$("#bestTitle")
														.html(
																"<div class='searchResultTitle'>'"
																		+ searchWord
																		+ "' 에 대한 검색결과	</div>");
												$("#listTitle").remove();
												$("#listLine").remove();
												$("#newPost").remove();
												$("#bestPost").remove();
												$("#bestLine")
														.after(
																"<div class='col-md-12' id='bestPost'></div>");
												
												isSearch = false;

												for (var i = 0; i < 10; i++) {

													getSearchPostView();
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

					$("#listBox").hide();
					$("#search_txt").on(
							"keyup",
							function(e) {
								var keyword = $("#search_txt").val();
								var params = "keyword=" + keyword;
								$.ajax({
									type : "POST",
									url : "autoSearch",
									data : params,
									success : function(data, textStatus, xhr) {
										$("#listBox").show().css("border",
												"1px solid #a8a8a8").css(
												"border-top",
												"1px solid #1EB501").css(
												"z-index", "9999");

										$("#resultList").html(data);
										$("#resultList li").hover(
												function() {
													$(this).addClass("hover")
															.css("cursor",
																	"pointer");
												},
												function() {
													$(this)
															.removeClass(
																	"hover");
												});
									},
									error : function(xhr, textStatus) {
									}
								});
							}).on("blur", function(e) {
						setTimeout(function() {
							$("#listBox").hide();
						}, 150);
					}).on("focus", function(e) {
						$("#listBox").show();
					});
					$("#resultList").on("click", "li.searchList", function(e) {
						$("#toId").val($(this).text());
						$("#listBox").hide();
					});

				});
// ready end
// @
function getSearchPostView() {

	// 폼 데이터 받기 or Append or 인자로 form id)
	var formData = new FormData();

	formData.append("word", searchWord);
	formData.append("no", searchCount);
	formData.append("isSearch", isSearch);

	$.ajax({
		type : 'POST',
		url : 'searchView',
		data : formData,
		// async : false,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {

			isSearch = true;

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
			// alert("code:" + request.status + "\n\n" + "message:"
			// + request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
			// $(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

			if (searchCount - 1 % 5 == 0) {
				isSearch = false;
			}

		}
	});

}

// 포스트 리스트 가져오기
function getPostView() {
	// 폼 데이터 받기 or Append or 인자로 form id)
	var formData = new FormData();

	formData.append("no", postCount);

	$.ajax({
		type : 'POST',
		url : 'postView',
		data : formData,
		// async : false,
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
			// alert("code:" + request.status + "\n\n" + "message:"
			// + request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
			// $(location).attr('href', "이동할 페이지");
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
		// async : false,
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
			// alert("code:" + request.status + "\n\n" + "message:"
			// + request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
			// $(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

		}
	});
}

function morePost(postNo) {

	// 폼 데이터 받기 or Append or 인자로 form id)
	var formData = new FormData();

	formData.append("pno", postNo);
	formData.append("page", 0);

	$.ajax({
		type : 'POST',
		url : 'morePost',
		data : formData,
		// async : false,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {

			modalOpen(8);
			var result = responseData;
			$('#detailDialog').html(result);

		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인
			// alert("code:" + request.status + "\n\n" + "message:"
			// + request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
			$('.wrap-loading').addClass('display-none');

		}
	});
}

function startPosting() {

	// 폼 데이터 받기 or Append or 인자로 form id)
	$.ajax({
		type : 'POST',
		url : 'startPosting',
		// async : false,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {

			modalOpen(5);
			var result = responseData;
			$('#hideListWrap').html(result);

			// 성공처리(v는 서버로 받은 메시지, value)

		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인
			// alert("code:" + request.status + "\n\n" + "message:"
			// + request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
			// $(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

		}
	});
}

function showTempPost(id){
	var formData = new FormData();
	formData.append("id", id);
	
	$.ajax({
		type : 'post',
		url : 'getMyLatelyLookupPost',
		data : formData,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {
			$.ajax({
				type : 'post',
				url : 'getMyMostLookupPost',
				data : formData,
				processData : false,
				contentType : false,

				success : function(responseData, statusText, xhr) {

					var result = responseData;
					$('#c2').html(result);
					
				}
			});
			var result = responseData;
			$('#c1').html(result);
			
		}
	});
}

function myLatelyView(id){
	var formData = new FormData();
	formData.append("id", id);
	$.ajax({
		type : 'post',
		url : 'getMyLatelyLookupPost',
		data : formData,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {

			var result = responseData;
			$('#c1').html(result);
			
		},error : function(request, status, error) {
			
		}
	});
}

function myMostView(id){
	var formData = new FormData();
	formData.append("id", id);
	$.ajax({
		type : 'post',
		url : 'getMyMostLookupPost',
		data : formData,
		processData : false,
		contentType : false,
		
		success : function(responseData, statusText, xhr) {
			
			var result = responseData;
			$('#c2').html(result);
			
		},error : function(request, status, error) {
			
		}
	});
}

function showTemp(id){
	var formData = new FormData();
	formData.append("id", id);
	$.ajax({
		type:'post',
		url : 'getMyPostByViews',
		data : formData,
		processData : false,
		contentType : false,
		
		success : function(responseData, statusText, xhr){
			
			modalOpen(11);
			var result = responseData;
			$('#listDiv').html(result);
			
		},error : function(request, status, error) {
			
			// 에러 로직, 에러 로그 확인
			
		}
	});
}

function showViews(id){
	var formData = new FormData();
	formData.append("id", id);
	$.ajax({
		type : 'post',
		url : 'getMyPostByViews',
		data : formData,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {

			modalOpen(11);
			var result = responseData;
			$('#listDiv').html(result);

		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인

		},
		complete : function() {

			// 이미지 감추기 처리
			// $(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

		}
	});
}

function showNews(id) {
	var formData = new FormData();
	formData.append("id", id);
	$.ajax({
		type : 'post',
		url : 'getMyPostByNews',
		data : formData,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {
			modalOpen(11);
			var result = responseData;
			$('#listDiv').html(result);
		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인

		},
		complete : function() {

			// 이미지 감추기 처리
			// $(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

		}
	});
}

function showReply(id) {
	var formData = new FormData();
	formData.append("id", id);
	$.ajax({
		type : 'post',
		url : 'getMyPostByComments',
		data : formData,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {
			modalOpen(11);
			var result = responseData;
			$('#listDiv').html(result);
		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인

		},
		complete : function() {

			// 이미지 감추기 처리
			// $(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

		}
	});
}

function showRcomm(id) {
	var formData = new FormData();
	formData.append("id", id);
	$.ajax({
		type : 'post',
		url : 'getMyPostByRecommand',
		data : formData,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {
			modalOpen(11);
			var result = responseData;
			$('#listDiv').html(result);
		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인

		},
		complete : function() {

			// 이미지 감추기 처리
			// $(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

		}
	});
}

function addKnowhow() {

	var formData = new FormData();

	formData.append("title", $("#addtitle").val());

	// 폼 데이터 받기 or Append or 인자로 form id)
	$.ajax({
		type : 'POST',
		url : 'addPost',
		// async : false,
		data : formData,
		processData : false,
		contentType : false,

		success : function(responseData, statusText, xhr) {

			$("#startPosting").modal('hide');
			modalOpen(9);
			var result = responseData;
			$('#addDialog').html(result);

			// 성공처리(v는 서버로 받은 메시지, value)

		},
		beforeSend : function() {

			// 전송 전
			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(request, status, error) {

			// 에러 로직, 에러 로그 확인
			// alert("code:" + request.status + "\n\n" + "message:"
			// + request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
			// $(location).attr('href', "이동할 페이지");
			$('.wrap-loading').addClass('display-none');

		}
	});
}

// startPosting -> 임시 포스트 불러오기
function modifyTempPost(pNo) {
	
	$("#startPosting").modal('hide');
	
	modifyPostStart(pNo);
	
}

function delTempPost(me, pNo) {

	$.ajaxSettings.traditional = true;
	var formData = new FormData();
	formData.append("pno", pNo);

	$.ajax({
		type : 'POST',
		url : 'delPost',
		data : formData,
		processData : false,
		contentType : false,
		success : function(responseData, statusText, xhr) {

			var result = responseData;

			alert("Delete! Temp Post.");
			$(me).parent('div').parent('div').next().remove();
			$(me).parent('div').parent('div').remove();

		},
		beforeSend : function() {

			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(request, status, error) {

			// alert("code:" + request.status + "\n\n" + "message:"
			// + request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
			$('.wrap-loading').addClass('display-none');

		}
	});
}

function delPost(me, pNo) {

	$.ajaxSettings.traditional = true;
	var formData = new FormData();
	formData.append("pno", pNo);

	$.ajax({
		type : 'POST',
		url : 'delPost',
		data : formData,
		processData : false,
		contentType : false,
		success : function(responseData, statusText, xhr) {

			var result = responseData;

			alert("Delete! Post.");
			// $(me).parent('div').parent('div').next().remove();
			// $(me).parent('div').parent('div').remove();
			$(me).parent('div').parent('div').remove();

		},
		beforeSend : function() {

			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(request, status, error) {

			// alert("code:" + request.status + "\n\n" + "message:"
			// + request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
			$('.wrap-loading').addClass('display-none');

		}
	});
}

function modifyPostStart(pNo) {

	$.ajaxSettings.traditional = true;
	var formData = new FormData();
	formData.append("pno", pNo);

	$.ajax({
		type : 'POST',
		url : 'startModify',
		data : formData,
		processData : false,
		contentType : false,
		success : function(responseData, statusText, xhr) {

			var result = responseData;

			$("#startModify").modal();
			$("#startModifyDialog").html(result);

		},
		beforeSend : function() {

			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(request, status, error) {

			// alert("code:" + request.status + "\n\n" + "message:"
			// + request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
			$('.wrap-loading').addClass('display-none');

		}
	});
}

function loginOpen() {
	$("#lg_findId").hide();
	$("#lg_findPass").hide();

	if ($("#lg_content").css("display") == "none") {
		$("#lg_content").show();
	}

	$("#loginPage").modal()
}

function returnLoginForm(num) {

	if (num == "1") {
		$("#lg_findId").slideUp(500);
		$("#lg_content").delay(1000).slideDown(1000);

	} else if (num == "2") {
		$("#lg_findPass").slideUp(500);
		$("#lg_content").delay(1000).slideDown(1000);

	}
}

function findChecker(i) {
	$("#lg_content").slideUp(500);
	if (i == "1") {
		$("#lg_findId").delay(1000).slideDown(1000);
	} else if (i == "2") {
		$("#lg_findPass").delay(1000).slideDown(1000);

	}
}

function morePostView() {

	for (var i = 0; i < 5; i++) {
		getPostView();
		postCount++;
	}

}

function moreSearchPostView() {

	for (var i = 0; i < 5; i++) {
		getSearchPostView();
		searchCount++;
	}

}

function modalOpen(selModal) {

	var modal = "";

	if (selModal == "1") {

		modal = "memJoinPage";
		$("#mj_id, #mj_nickname, #mj_pass1, #mj_pass2").val("");
		$("#mj_id").show();
		$("#mj_btn_submit").hide();

	} else if (selModal == "5") {

		modal = "startPosting";

	} else if (selModal == "6") {

		modal = "startModify";

	} else if (selModal == "7") {

		modal = "addTag";

	} else if (selModal == "8") {

		modal = "knowhowDetail";

	} else if (selModal == "3") {

		modal = "memModifyPage";

	} else if (selModal == "4") {

		modal = "profileModifyPage";

	} else if (selModal == "9") {

		modal = "addKnowhow";

	} else if (selModal == "10") {

		modal = "modifyKnowhow";

	} else if (selModal == "11") {

		modal = "myPostList";

	}

	$("#" + modal).modal('show');

}
