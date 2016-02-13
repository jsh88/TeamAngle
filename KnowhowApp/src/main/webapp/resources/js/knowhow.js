var addImgArr = [ 10 ];
var addUrlArr = [ 10 ];
var addConArr = [ 10 ];
var addPagingCount = 1;
var addPrePagingCount = 0;
var addMaxPage = 1;
var addUrl = "";

$(document).ready(function() {

	addImgArr[0] = null;
	addConArr[0] = null;
	addUrlArr[0] = undefined;

	$("#addModal").modal();

	$(".p2").hide();
	$(".p3").hide();
	$(".p4").hide();
	$(".p5").hide();
	$(".p6").hide();
	$(".p7").hide();
	$(".p8").hide();
	$(".p9").hide();
	$(".p10").hide();

	$(".p" + addPagingCount).css("width", "65");

	/* mouseOver 처리 */

	$(".pageNumber").mouseover(function() {

		$(this).css("width", "65");

	});

	$(".pageNumber").mouseout(function() {

		if ($(this).is(".p" + addPagingCount) === true) {

			$(this).css("width", "65");

		} else {

			$(this).css("width", "50");
		}
	});

	/* 추가 버튼 */
	$("#addbtn").click(function() {

		var n = $(".knowhow" + addMaxPage).val();

		if (n == null || n == "") {

			alert('내용이 비어있습니다.');

		} else {

			$("#myCarousel").carousel(addPagingCount);
			modifyCon();
			addMaxPage += 1;
			addPagingCount += 1;

			if (addMaxPage == 10) {
				$("#addbtn").hide();
			}

			$(".p" + addMaxPage).show();

		}

		$(".p" + (addPagingCount - 1)).css("width", "50");
		$(".p" + addPagingCount).css("width", "65");
	});

	/* 삭제 버튼 */
	$("#deletebtn").click(function() {

		if (addMaxPage == 1) {

			alert('삭제할 페이지가 없습니다.')

		} else {

			// clear 로직
			$('#mediaiframe' + addMaxPage).attr('src', ""); // 미디어 src 비우기
			$('#inputurl').attr('value', ""); // 모달 위 모달 value 비우기
			$("#ta" + addPagingCount).val(""); // 컨텐트 비우기
			$("#mediaiframe" + addMaxPage).css("z-index", "2"); // 미디어 층 내리기
			$("#mediaImg" + addPagingCount).attr("src", ""); // 이미지 비우기
			addImgArr[addPagingCount - 1] = null; // 파일 비우기
			addUrlArr[addPagingCount - 1] = undefined; // url 비우기
			addConArr[addPagingCount - 1] = null; // content 비우기
			addUrl = ""; // url 운반 변수 비우기

			$(".p" + addPagingCount).hide();
			addMaxPage -= 1;
			addPagingCount -= 1;
			$(".p" + addPagingCount).css("width", "65");
			$("#myCarousel").carousel(addMaxPage - 1);

			if (addMaxPage == 9) {
				$("#addbtn").show();
			}
		}
	});

	/* div 간 이동 */
	$(".p1").click(function() {
		$("#myCarousel").carousel(0);
		modifyCon();
		addPrePagingCount = addPagingCount;
		addPagingCount = 1;
		checkMaxPage();
		$(".p" + addPagingCount).css("width", "65");
		$(".p" + addPrePagingCount).css("width", "50");
	});

	$(".p2").click(function() {
		$("#myCarousel").carousel(1);
		modifyCon();
		addPrePagingCount = addPagingCount;
		addPagingCount = 2;
		checkMaxPage();
		$(".p" + addPagingCount).css("width", "65");
		$(".p" + addPrePagingCount).css("width", "50");
	});

	$(".p3").click(function() {
		$("#myCarousel").carousel(2);
		modifyCon();
		addPrePagingCount = addPagingCount;
		addPagingCount = 3;
		checkMaxPage();
		$(".p" + addPagingCount).css("width", "65");
		$(".p" + addPrePagingCount).css("width", "50");
	});

	$(".p4").click(function() {
		$("#myCarousel").carousel(3);
		modifyCon();
		addPrePagingCount = addPagingCount;
		addPagingCount = 4;
		checkMaxPage();
		$(".p" + addPagingCount).css("width", "65");
		$(".p" + addPrePagingCount).css("width", "50");
	});

	$(".p5").click(function() {
		$("#myCarousel").carousel(4);
		modifyCon();
		addPrePagingCount = addPagingCount;
		addPagingCount = 5;
		checkMaxPage();
		$(".p" + addPagingCount).css("width", "65");
		$(".p" + addPrePagingCount).css("width", "50");
	});

	$(".p6").click(function() {
		$("#myCarousel").carousel(5);
		modifyCon();
		addPrePagingCount = addPagingCount;
		addPagingCount = 6;
		checkMaxPage();
		$(".p" + addPagingCount).css("width", "65");
		$(".p" + addPrePagingCount).css("width", "50");
	});

	$(".p7").click(function() {
		$("#myCarousel").carousel(6);
		modifyCon();
		addPrePagingCount = addPagingCount;
		addPagingCount = 7;
		checkMaxPage();
		$(".p" + addPagingCount).css("width", "65");
		$(".p" + addPrePagingCount).css("width", "50");
	});

	$(".p8").click(function() {
		$("#myCarousel").carousel(7);
		modifyCon();
		addPrePagingCount = addPagingCount;
		addPagingCount = 8;
		checkMaxPage();
		$(".p" + addPagingCount).css("width", "65");
		$(".p" + addPrePagingCount).css("width", "50");
	});

	$(".p9").click(function() {
		$("#myCarousel").carousel(8);
		modifyCon();
		addPrePagingCount = addPagingCount;
		addPagingCount = 9;
		checkMaxPage();
		$(".p" + addPagingCount).css("width", "65");
		$(".p" + addPrePagingCount).css("width", "50");
	});

	$(".p10").click(function() {
		$("#myCarousel").carousel(9);
		$("#addbtn").hide();
		modifyCon();
		addPrePagingCount = addPagingCount;
		addPagingCount = 10;
		checkMaxPage();
		$(".p" + addPagingCount).css("width", "65");
		$(".p" + addPrePagingCount).css("width", "50");
	});

	/* 이미지 드래그 앤 드롭 */
	$('.m').on('drop', function(e) {

		e.preventDefault();
		e.stopPropagation();

		var reader = new FileReader();

		reader.onload = function(ev) {

			$('#mediaImg' + addPagingCount).attr('src', ev.target.result);
			$('#m' + addPagingCount).css("background-image", "none");

		}

		addImgArr[addPagingCount - 1] = e.originalEvent.dataTransfer.files[0];
		addUrlArr[addPagingCount - 1] = undefined;

		reader.readAsDataURL(addImgArr[addPagingCount - 1]);

	});

	$("#inputBtn").click(function() {

		closeModal();

	});

});
//		

function openModal() {

	if (addImgArr[addPagingCount - 1]) {

		alert("이미지가 들어있습니다. Clear 해주세요.");

	} else {

		$("#addInputModal").modal();

	}
}

function closeModal() {

	addUrl = $("#inputurl").val();

	if (addUrl == "") {

		alert("URL이 입력되지 않았습니다.");
		$("#addInputModal").modal('hide');

	} else {

		$("#addInputModal").modal('hide');
		addUrlArr[addPagingCount - 1] = addUrl;
		addImgArr[addPagingCount - 1] = null;
		$("#mediaiframe" + addPagingCount).css("z-index", "4");
		$("#mediaiframe" + addPagingCount).attr("src",
				addUrl + "?autoplay=0&autohide=1");

		$("#inputurl").val("");
	}
}

function checkMaxPage() {
	if (addMaxPage == addPagingCount) {
		if (addPagingCount == 10) {
			$("#addbtn").hide();
			$("#deletebtn").show();
		} else {
			$("#addbtn").show();
			$("#deletebtn").show();
		}
	} else {
		$("#addbtn").hide();
		$("#deletebtn").hide();
	}
}

function modifyCon() {

	addConArr[addPagingCount - 1] = $("#ta" + addPagingCount).val();

}

function clearPage() {

	alert("모든 요소를 비웁니다.");

	// clear 로직
	$('#mediaiframe' + addPagingCount).attr('src', ""); // 미디어 src 비우기
	$('#inputurl').attr('value', ""); // 모달 위 모달 value 비우기
	$("#ta" + addPagingCount).val(""); // 컨텐트 비우기
	$("#mediaiframe" + addPagingCount).css("z-index", "2"); // 미디어 층 내리기
	$("#mediaImg" + addPagingCount).attr("src", ""); // 이미지 비우기
	$('#m' + addPagingCount).css("background-image",
			" url('/KnowhowApp/resources/images/insertImage.png')"); // 원래이미지로
	addImgArr[addPagingCount - 1] = null; // 파일 비우기
	addUrlArr[addPagingCountaddUrl1] = undefined; // url 비우기
	addConArr[addPagingCount - 1] = null; // content 비우기
	addUrl = ""; // url 운반 변수 비우기

}

function complete() {

	for (var s = 0; s < addMaxPage; s++) {
		if ($("#ta" + addPagingCount).val() == "") {
			alert("내용이 없는 페이지가 있습니다.");
			return;
		}
	}

	addConArr[addPagingCount - 1] = $("#ta" + addPagingCount).val();

	$.ajaxSettings.traditional = true;
	var formData = new FormData();
	formData.append("mpage", addMaxPage);

	for (var k = 0; k < addMaxPage; k++) {
		formData.append("addImgArr" + k, addImgArr[k]);
		addConArr[k] = addConArr[k] + "q1z";
		addUrlArr[k] = addUrlArr[k] + "q1z";
	}

	formData.append("urlArr", addUrlArr);
	formData.append("conArr", addConArr);

	$.ajax({
		type : 'POST',
		addUrl : 'completeWrite',
		data : formData,
		processData : false,
		contentType : false,
		success : function(v) {

			alert("성공이다해!")

		},
		beforeSend : function() {

			// 이미지 보여주기
			$('.wrap-loading').removeClass('display-none');

		},
		error : function(request, status, error) {

			alert("code:" + request.status + "\n\n" + "message:"
					+ request.responseText + "\n\n" + "error:" + error);

		},
		complete : function() {

			// 이미지 감추기 처리
			$(location).attr('href', "addTagPage");
			$('.wrap-loading').addClass('display-none');
			$("#addModal").modal("hide");

		}
	});
}

function modalClose(k) {

	if (k == "1") {
		if (confirm('포스트작성을 취소합니다.') == true) {
			$("#addModal").modal('hide');

		} else {

			return;
		}

	} else if (k == "2") {
		$("#addInputModal").modal('hide');
	}

}

$(document).ready(function() {

	// startPosting
	$("#Continuebtn").hide();
	$("#Priorbtn").hide();
	$("#hideList").hide();
	$("#middle").hide();

	$("#Recallingbtn").click(function() {
		/* $("#ModalDialog").css('margin-top','300px'); */
		$("#Createbtn").hide();
		$("#Continuebtn").show();
		$("#Recallingbtn").hide();
		$("#Priorbtn").show();
		$("#middle").slideToggle(400);
		$("#hideList").slideToggle(400);
		$("#middle").show();
		$("#hideList").show();

	});

	$("#Priorbtn").click(function() {
		/* $("#ModalDialog").css('margin-top','350px'); */
		$("#Createbtn").show();
		$("#Recallingbtn").show();
		$("#Priorbtn").hide();
		$("#Continuebtn").hide();
		$("#middle").slideToggle(400);
		$("#hideList").slideToggle(400);
		$("#addtitle").val("");

	});

	$(".atitle").click(function() {

		var t = $(this).text();

		$("#addtitle").val(t);
		preventDefault();
	});

});
// end ready
