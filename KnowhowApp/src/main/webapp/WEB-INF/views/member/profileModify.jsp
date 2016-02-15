<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<script>
var setImage = null;
var comm = null;
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
// 				alert(fileName);
				var comment = result.substring(result.indexOf(",,") + 2);
// 				alert(comment);
				
				$("#profile_Img").attr("src", "resources/images/" + fileName);
				$("#myProfileImage").attr("src", "resources/images/" + fileName);
				$("#profile_pcom").val(comment);
				$("#myProfileComment").text(comment);
				
// 				alert("success");
				
			},
			error : function(xhr, statusText, responseData) {
				alert("error : " + statusText + "." + xhr.status
						+ " - " + xhr.responseText);
			}
		});
	});
	
	$('#dropbox').on('drop', function(e) {

		e.preventDefault();
		e.stopPropagation();

		var reader = new FileReader();

		reader.onload = function(ev) {
			
// 			alert("이미지님 들어가신다");
			
			$('#profile_Img').attr('src', ev.target.result);
			
		}
		
		$('#profile_Img').attr('src', "");
		
		setImage = e.originalEvent.dataTransfer.files[0];

		reader.readAsDataURL(setImage);
		
	});
	
});
</script>

</head>
<body>
	<div class="modal-dialog">
		<form name="profile_form" action="memModify" method="post"
			enctype="multipart/form-data">

			<div id="profile_form" class="modal-content col-sm-push-1 col-sm-10">

				<div id="profileCloseImg" onclick="">
					<img style="width: 20px;" src="resources/images/close.png" />
				</div>

				<div class="col-sm-12" id="profileDropWrap">
					<div class="col-sm-12">
						<div id="dropbox" class="col-sm-push-1 col-sm-10"
							contenteditable="true">
						<c:if test="${ member.image ne null }">
							<img id="profile_Img" src="resources/images/${member.image }" class="img-responsive" />	
						</c:if>
						<c:if test="${ member.image eq null }">
							<img id="profile_Img" src="resources/images/noImg.png" class="img-responsive" />	
						</c:if>
						</div>
					</div>
					<div class="col-sm-12" id="profileBlankLine"></div>
					<!-- 인삿말 등  -->
					<div class="col-sm-12">
						<div id="profile_pcomm" class="col-sm-12">
							<label for="profile_pcom" id="profileLabel">Please, your
								comment</label> 
								<c:if test="${ member.pComment eq null }">
								<input id="profile_pcom" type="text" name="pcomment" class="form-control col-sm-12">
							</c:if>
							<c:if test="${ member.pComment ne null }">
								<input id="profile_pcom" type="text" name="pcomment" class="form-control col-sm-12" value="${member.pComment }">
							</c:if>	
							<input type="submit"
								value="Profile Edit" class="btn btn-success col-sm-12"
								id="profileModify">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>