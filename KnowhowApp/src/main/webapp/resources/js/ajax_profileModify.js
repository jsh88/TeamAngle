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
				var fileName = result.substring(0, result.indexOf(",,"));
				alert(fileName);
				var comment = result.substring(result.indexOf(",,") + 2);
				alert(comment);
				
				$("#profile_Img").attr("src", "resources/images/" + fileName);
				$("#myProfileImage").attr("src", "resources/images/" + fileName);
				$("#profile_pcom").val(comment);
				$("#myProfileComment").text(comment);
				
				alert("success");
				
			},
			error : function(xhr, statusText, responseData) {
				alert("error memModify : " + statusText + "." + xhr.status
						+ " - " + xhr.responseText);
			}
		});
	});
});