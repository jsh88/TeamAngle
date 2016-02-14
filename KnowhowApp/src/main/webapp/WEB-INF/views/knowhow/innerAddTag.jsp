<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
	var otherTags = [];
	var addTags = [];

	$(document).ready(
			function() {

				$("#tagModal").modal();
				$("#s").hide();
				$("#k").hide();

				$(".tags")
						.click(
								function() {

									if ($('.t').length == 20) {

										alert('태그는 20개까지만 추가 가능합니다.');
										$("#tagtext").val("");

									} else {

										var t = $(this).text();
										var hidden = $("#hiddentext").val();
										var subt = t.substring(1);

										addTags.push(subt);

										$("#Tagbox").append(
												"<a class='t'  href='#'>" + t
														+ "</a>");
										$("#hiddentext").val(
												hidden + " " + subt);

										$(this).hide();

										$('.t').click(
												function() {

													$(this).remove();
													removeTag(($(this).text())
															.substr(1));

												});

									}
								});

				// 추가된 태그 클릭시 태그 삭제

				$("#tagtext").keypress(
						function(key) {

							var re = /[~!@\#$%<>^&*\()\-=+_\']/;

							if (re) {
								$("#tagtext")
										.css("border", "3px solid #FF2727")
										.css("border-radius", "6px");
								$("#s").show();
								$("#k").hide();
							}

							if (key.keyCode == 13) {

								if ($(".t").length == 20) {

									alert('태그는 20개까지만 추가 가능합니다');
									$("#tagtext").val("");

								} else {

									var n = $("#tagtext").val();
									var h = $("#hiddentext").val();
									var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;

									if (n == "") {

										$("#tagtext").css("border",
												"3px solid #FF2727").css(
												"border-radius", "6px");
										$("#k").show();
										$("#s").hide();

									} else if (n.match(re)) {

										alert('등록할수 없는 태그입니다.');

									} else if (!kor_check.test(n)) {

										$("#Tagbox").append(
												"<a class='t' href='#'>#" + n
														+ "</a>");

										otherTags.push(n);
										addTags.push(n);

										$("#hiddentext").val(h + " " + n);
										$("#tagtext").val("");
										$("#tagtext").css("border", "none")
												.css("border-radius", "0px");
										$("#k").hide();
										$("#s").hide();

										$('.t').click(
												function() {

													$(this).remove();
													removeTag(($(this).text())
															.substr(1));

												});

									}
								}
							}
						});

				$("#tagtext").keydown(
						function(key) {

							if (key.keyCode == 8) {

								$("#tagtext").css("border", "none").css(
										"border-radius", "0px");
								$("#k").hide();
								$("#s").hide();
							}
						});

			});

	function removeTag(tag) {

		for (var i = 0; i < otherTags.length; i++) {

			if (otherTags[i] == tag) {

				otherTags.splice(otherTags[i], 1);

			}

		}

		for (var i = 0; i < addTags.length; i++) {

			if (addTags[i] == tag) {

				addTags.splice(addTags[i], 1);

			}

		}

	}

	function posting() {

		var value = 0;

		$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
		// 폼 데이터 받기 or Append or 인자로 form id)
		var formData = new FormData();
		formData.append("tags", addTags);
		formData.append("oTags", otherTags);

		$.ajax({
			type : 'POST',
			url : 'completePosting',
			data : formData,
			processData : false,
			contentType : false,

			success : function(v) {

				// 성공처리(v는 서버로 받은 메시지, value)
				alert("포스트 작성 완료");
				location.reload();
				
			},
			beforeSend : function() {

				// 전송 전
				// 이미지 보여주기
				$('.wrap-loading').removeClass('display-none');

			},
			error : function(request, status, error) {

				// 에러 로직, 에러 로그 확인
				alert("code:" + request.status + "\n\n" + "message:"
						+ request.responseText + "\n\n" + "error:" + error);

			},
			complete : function() {

				// 이미지 감추기 처리
				// 					$(location).attr('href', "이동할 페이지");
				$('.wrap-loading').addClass('display-none');
				// 					$("#tagModal").modal("hide");

			}
		});
	}
</script>
<div class="modal-content" id="tagContent">
	<div id="TagWrap">
		<div id="Tagimage">
			<a href=""><img style="width: 20px;"
				src="resources/images/close.png" /></a>
		</div>
		<div id="TagContent">
			<div id="contentTitle">Recommendation Tag</div>
			<div id="inputTag">
				<input type="text" name="tag" id="tagtext" size="57" />
			</div>
			<div id="w">
				<span id="s">&nbsp; - 특수문자나 영어는 사용할 수 없습니다.</span> <span id="k">&nbsp;
					- 태그를 입력해 주세요.</span>
			</div>
			<div id="ReTag">
				<c:set var="isDoing" value="true" />
				<c:forEach var="tags" items="${pTagList }" varStatus="status">
					<c:if test="${isDoing}">
						<a class="tags" href="#">#${tags.tag }</a>
						<c:if test="${status.index eq 19}">
							<c:set var="isDoing" value="false" />
						</c:if>
					</c:if>
				</c:forEach>
			</div>
			<div id="userTag">
				<div id="userTitle">#Tags</div>
				<div id="Line"></div>
				<form name="tag" action="completePosting" method="post" onsubmit="return false;">
					<div id="Tagbox">
						<input type="hidden" id="hiddentext" name="tags" />
					</div>
					<div id="Tagbtn">
						<input type="button" id="tagsubmit" onclick="posting()"
							class="btn btn-success addbtn" value="Posting!" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>