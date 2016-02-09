<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function indexResize(ifname){
		
		ifname.setExpression('height' , indexIf.document.body.scrollHeight);
		ifname.setExpression('width' , indexIf.document.body.scrollWidth);
		
	}
</script>
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<iframe  id="indexIf" width="100%" height="100%" frameborder="no" scrolling="no" src="main" marginwidth="0" marginheight="0" onload="indexResize(this)">
	</iframe>
</body>
</html>