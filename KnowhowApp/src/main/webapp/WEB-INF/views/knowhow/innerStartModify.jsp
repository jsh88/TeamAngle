<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var modifyTitle;

	$(document).ready(function() {

		$("#Continuebtn").hide();
		$("#Priorbtn").hide();

	});

	function modifyTitle() {

		modifyTitle = $("#modifyTitle").val();

		$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
		// 폼 데이터 받기 or Append or 인자로 form id)
		var formData = new FormData();
		formData.append("title", modifyTitle);

		$.ajax({
			type : 'POST',
			url : 'modifyTitle',
			data : formData,
			processData : false,
			contentType : false,

			success : function(responseData, statusText, xhr) {

				var result = responseData;

				$("#startModify").modal('hide');
				$("#modifyKnowhow").modal();
				$("#startModalDialog").html(result);

			},
			beforeSend : function() {

				// 전송 전
				// 이미지 보여주기
				$('.wrap-loading').removeClass('display-none');

			},
			error : function(request, status, error) {

				// 에러 로직, 에러 로그 확인
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
<div class="modal-content" id="startModalContent">
	<div id="addCheckWrap">

		<div id="addForm">
			<form name="modifyTitleForm" action="" method="post" onsubmit="return false;">
				<div id="startTitle">
					<div class="form-group">
						<label for="modifyTitle" class="col-sm-12 control-label"
							id="titlelabel">Please enter a post title!</label>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="modifyTitle"
								name="title" value="${post.title }" maxlength="40" />
						</div>
					</div>
					<div id="startbuttonGroup">
						<button type="button" class="btn btn-success addbtn"
							id="startModifyBtn" onclick="modifyTitle()">
							<b>Modify Post</b>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>