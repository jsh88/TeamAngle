<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script>
	var addImgArr = [ 10 ];
	var addUrlArr = [ 10 ];
	var addConArr = [ 10 ];
	var addPagingCount = 1;
	var addPrePagingCount = 0;
	var addMaxPage = 1;
	var addUrl = "";

	$(document)
			.ready(
					function() {

						addImgArr[0] = null;
						addConArr[0] = null;
						addUrlArr[0] = undefined;

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
						$("#deletebtn")
								.click(
										function() {

											if (addMaxPage == 1) {

												alert('삭제할 페이지가 없습니다.')

											} else {

												// clear 로직
												$('#mediaiframe' + addMaxPage)
														.attr('src', ""); // 미디어 src 비우기
												$('#inputurl')
														.attr('value', ""); // 모달 위 모달 value 비우기
												$("#ta" + addPagingCount).val(
														""); // 컨텐트 비우기
												$("#mediaiframe" + addMaxPage)
														.css("z-index", "2"); // 미디어 층 내리기
												$("#mediaImg" + addPagingCount)
														.attr("src", ""); // 이미지 비우기
												addImgArr[addPagingCount - 1] = null; // 파일 비우기
												addUrlArr[addPagingCount - 1] = undefined; // url 비우기
												addConArr[addPagingCount - 1] = null; // content 비우기
												addUrl = ""; // url 운반 변수 비우기

												$(".p" + addPagingCount).hide();
												addMaxPage -= 1;
												addPagingCount -= 1;
												$(".p" + addPagingCount).css(
														"width", "65");
												$("#myCarousel").carousel(
														addMaxPage - 1);

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
						$('.m')
								.on(
										'drop',
										function(e) {

											e.preventDefault();
											e.stopPropagation();

											var reader = new FileReader();

											reader.onload = function(ev) {

												$('#mediaImg' + addPagingCount)
														.attr(
																'src',
																ev.target.result);
												$('#m' + addPagingCount).css(
														"background-image",
														"none");

											}

											addImgArr[addPagingCount - 1] = e.originalEvent.dataTransfer.files[0];
											addUrlArr[addPagingCount - 1] = undefined;

											reader
													.readAsDataURL(addImgArr[addPagingCount - 1]);

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

	function completeWrite() {

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
			url : 'completeWrite',
			data : formData,
			processData : false,
			contentType : false,
			success : function(responseData, statusText, xhr) {
				
				var result = responseData;
				
				$("#addKnowhow").modal('hide');
				$("#addTag").modal();
				$("#tagDialog").html(result);

			},
			beforeSend : function() {

				// 이미지 보여주기
				$('.wrap-loading').removeClass('display-none');

			},
			error : function(request, status, error) {

// 				alert("code:" + request.status + "\n\n" + "message:"
// 						+ request.responseText + "\n\n" + "error:" + error);

			},
			complete : function() {

				// 이미지 감추기 처리
				$('.wrap-loading').addClass('display-none');

			}
		});
	}

	function savePosting(pNo) {
		
		for (var s = 0; s < addMaxPage; s++) {
			if ($("#ta" + addPagingCount).val() == "") {
				alert("내용이 없는 페이지가 있습니다. 임시 저장을 위해 내용을 입력해주세요.");
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
			url : 'completeWrite',
			data : formData,
			processData : false,
			contentType : false,
			success : function(responseData, statusText, xhr) {
				
				var result = responseData;
				
				alert("임시 저장 되었습니다.");

			},
			beforeSend : function() {

				// 이미지 보여주기
				$('.wrap-loading').removeClass('display-none');

			},
			error : function(request, status, error) {

// 				alert("code:" + request.status + "\n\n" + "message:"
// 						+ request.responseText + "\n\n" + "error:" + error);

			},
			complete : function() {

				// 이미지 감추기 처리
				$('.wrap-loading').addClass('display-none');

			}
		});
		
	}

	// addknowhow -> x 버튼 누르면 임시 저장후 모달 끄기
	function saveAndCanclePosting(pNo) {
		
		for (var s = 0; s < addMaxPage; s++) {
			if ($("#ta" + addPagingCount).val() == "") {
				alert("내용이 없는 페이지가 있습니다. 임시 저장을 위해 내용을 입력해주세요.");
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
			url : 'completeWrite',
			data : formData,
			processData : false,
			contentType : false,
			success : function(responseData, statusText, xhr) {
				
				var result = responseData;
				
				alert("임시 저장 되었습니다.");
				$("#addKnowhow").modal('hide');

			},
			beforeSend : function() {

				// 이미지 보여주기
				$('.wrap-loading').removeClass('display-none');

			},
			error : function(request, status, error) {

// 				alert("code:" + request.status + "\n\n" + "message:"
// 						+ request.responseText + "\n\n" + "error:" + error);

			},
			complete : function() {

				// 이미지 감추기 처리
				$('.wrap-loading').addClass('display-none');

			}
		});
	}
</script>
<div class="modal-content" id="addContent">
				<div id="addWrap">
					<div class="modal-header" id="header">
						<div id="Closeimg" onclick="saveAndCanclePosting('${post.pNo}')"><img style="width:20px;" src="resources/images/close.png"/></div>
						<div id="addTitle">${post.title }</div>
						<div id="addCreateDate">${post.wDate }</div>
						<div id="Clear" onclick="clearPage()"><img style="width:20px;" src="resources/images/clear.png"/></div>
						<div id="tSave" onclick="savePosting('${post.pNo}')"><img style="width:25px;" src="resources/images/tsave.png"/></div>
					</div>
					<!-- Modal 상단-->
						<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">				
							
  							 <div class="carousel-inner" role="listbox">
  							 
  							 	<div class="item active additem">
  							 		<form name="addKnowhowForm1" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m1" class="m" onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe1" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscree></iframe>
												<input type="hidden" id="url1" name="videourl"/><input type="file" class="imgurl" id="imgurl1" name="media"/><img class="mediaImg" id="mediaImg1"/>
											</div>
											<div id="content_Text">
												<textarea id="ta1" class="form-control knowhow1" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="completeWrite()" value="Complete">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm2" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media"class="mbackground">
												<div id="m2" class="m" onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe2" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden"id="url2" name="videourl"/><input type="file" class="imgurl" id="imgurl2" name="media"/><img class="mediaImg" id="mediaImg2"/>
											</div>
											<div id="content_Text">
												<textarea id="ta2" class="form-control knowhow2" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="completeWrite()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm3" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m3" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe3" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url3" name="videourl"/><input type="file" class="imgurl" id="imgurl3" name="media"/><img class="mediaImg" id="mediaImg3"/>
											</div>
											<div id="content_Text">
												<textarea id="ta3" class="form-control knowhow3"  name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="completeWrite()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm4" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m4" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe4" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url4"  name="videourl"/><input type="file" class="imgurl" id="imgurl4" name="media"/><img class="mediaImg" id="mediaImg4"/>
											</div>
											<div id="content_Text">
												<textarea id="ta4" class="form-control knowhow4" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="completeWrite()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm5" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m5" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe5" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden"  id="url5" name="videourl"/><input type="file"  class="imgurl" id="imgurl5" name="media"/><img class="mediaImg" id="mediaImg5"/>
											</div>
											<div id="content_Text">
												<textarea id="ta5" class="form-control knowhow5" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="completeWrite()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm6" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m6" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe6" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url6" name="videourl"/><input type="file"  class="imgurl" id="imgurl6" name="media"/><img class="mediaImg" id="mediaImg6"/>
											</div>
											<div id="content_Text">
												<textarea id="ta6" class="form-control knowhow6" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="completeWrite()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm7" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m7" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe7" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url7" name="videourl"/><input type="file" class="imgurl" id="imgurl7" name="media"/><img class="mediaImg" id="mediaImg7"/>
											</div>
											<div id="content_Text">
												<textarea id="ta7" class="form-control knowhow7" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="completeWrite()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm8" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m8" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe8" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url8" name="videourl"/><input type="file"  class="imgurl" id="imgurl8" name="media"/><img class="mediaImg" id="mediaImg8"/>
											</div>
											<div id="content_Text">
												<textarea id="ta8" class="form-control knowhow8" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="completeWrite()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm9" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m9" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe9" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url9" name="videourl"/><input type="file" class="imgurl" id="imgurl9" name="media"/><img class="mediaImg" id="mediaImg9"/>
											</div>
											<div id="content_Text">
												<textarea id="ta9" class="form-control knowhow9" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="completeWrite()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm10" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m10" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe10" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url10" name="videourl"/><input type="file" class="imgurl" id="imgurl10" name="media"/><img class="mediaImg" id="mediaImg10"/>
											</div>
											<div id="content_Text">
												<textarea id="ta10" class="form-control knowhow10" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="completeWrite()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 </div>
						</div>
					
					
					</div>
				</div>
				<div id="addDelete">
					<div id="lineback"></div>
					<div id="postit">
						<div class="pageNumber p1">
							1
						</div>
						<div class="pageNumber p2">
							2
						</div>
						<div class="pageNumber p3">
							3
						</div>
						<div class="pageNumber p4">
							4
						</div>
						<div class="pageNumber p5">
							5
						</div>
						<div class="pageNumber p6">
							6
						</div>
						<div class="pageNumber p7">
							7
						</div>
						<div class="pageNumber p8">
							8
						</div>
						<div class="pageNumber p9">
							9
						</div>
						<div class="pageNumber p10">
							10
						</div>
					</div>
					<div id="addbtn">
						<img style="width:45px; margin-left: 6px; margin-top: 5px;" src="resources/images/add.png"/>
					</div>
					<div id="deletebtn">
						<img style="width:45px; margin-left: 6px; margin-top: 5px;"src="resources/images/subtract.png"/>
					</div>
				</div>