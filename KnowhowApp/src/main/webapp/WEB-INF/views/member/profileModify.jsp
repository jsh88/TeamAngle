<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<script>

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
				alert("error : " + statusText + "." + xhr.status
						+ " - " + xhr.responseText);
			}
		});
	});
});

</script>
<script>

	var setImage = null;
	var comm = null;
	$(document).ready(function() {
		
// 		$(function() {
//             $("#imgurl").on('change', function(){
//                 readURL(this);
//             });

 		$("#imgurl").on('change', function(){
                readURL(this);
 		});

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#profile_Img').attr('src', e.target.result);
                }
              reader.readAsDataURL(input.files[0]);
            }
        }
		
		$('#dropbox').on('drop', function(e) {

			e.preventDefault();
			e.stopPropagation();

			var reader = new FileReader();

			reader.onload = function(ev) {
				alert("이미지님 들어가신다");
				$('#profile_Img').attr('src', ev.target.result);
				
			}
			
			setImage = e.originalEvent.dataTransfer.files[0];

			reader.readAsDataURL(setImage);
			
		});

	});
</script>
<style>
#profile_form {
	height: 500px;
}

#dropbox {
	border: 5px dashed #bfbcbc;
	border-radius: 20px;
	height: 300px;
	margin: 0 auto;
}

#closeBar {
	height: 40px;
}
</style>

</head>
<body>
	<div class="modal-dialog">
		<form name="profile_form" action="memModify" method="post" enctype="multipart/form-data">

			<div id="profile_form" class="modal-content col-sm-push-1 col-sm-10">

				<div id="closeBar" class="col-sm-12">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
				</div>

				<div class="col-sm-12">
					<div class="col-sm-12">
					Drag &Drop
						<div id="dropbox" class="col-sm-push-1 col-sm-10" contenteditable="true">
						<img id="profile_Img" style="max-width: 100%; height: auto;" />	
						</div>
					</div>
					<div class="col-sm-12">
					</div>
					<!-- 인삿말 등  -->
					<div class="col-sm-12">
						<div id="profile_pcomm" class="col-sm-12">
							<label for="profile_pcom">Please you're comment</label> 
							<input id="profile_pcom" type="text" name="pcomment" class="form-control col-sm-12"> <input type="button"
								value="Profile Edit" class="btn btn-default col-sm-12" id="profileModify" >
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>