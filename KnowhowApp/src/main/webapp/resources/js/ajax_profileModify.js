$(function() {
	$('#profileModify').click(function() {

		$.ajaxSettings.traditional = true;
		var formData = new FormData();
		formData.append("image", setImage);
		formData.append("pcomment", $("#profile_pcom").val());
		$.ajax({
			url : "profileModify.ajax",
			type : "POST",
			data : formData,
			processData : false,
			contentType : false,
			success : function(responseData, statusText, xhr) {
				var result = responseData;
				if (result == 1) {
					alert('프로필 수정 완료');
				} else if (result == 0) {
					alert('프로필 수정 실패');
				}
			},
			error : function(xhr, statusText, responseData) {
				alert("error : " + statusText + "." + xhr.status
						+ " - " + xhr.responseText);
			}
		});
	});
});