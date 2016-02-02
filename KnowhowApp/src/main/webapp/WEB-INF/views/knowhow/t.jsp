<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>	
<style>
.uploader {
    position:relative; 
    overflow:hidden; 
    width:300px; 
    height:350px;
    background:#f3f3f3; 
    border:2px dashed #e8e8e8;
}

#filePhoto{
    position:absolute;
    width:300px;
    height:400px;
    top:-50px;
    left:0;
    z-index:2;
    opacity:0;
    cursor:pointer;
}

.uploader img{
    position:absolute;
    width:302px;
    height:352px;
    top:-1px;
    left:-1px;
    z-index:1;
    border:none;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
var imageLoader = document.getElementById('filePhoto');
if(imageLoader) {
	imageLoader.addEventListener('change', handleImage, false);
}

function handleImage(e) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $('#blah').attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
}
</script>
</head>
<body>

	<div class="uploader" onclick="$('#filePhoto').click()">
    click here or drag here your images for preview and set userprofile_picture data
    <img id="blah" src=""/>
    <input type="file" name="userprofile_picture"  id="filePhoto" />
</div>

</body>
</html>