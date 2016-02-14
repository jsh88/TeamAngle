<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/intro.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<link rel="stylesheet" href="resources/css/intro/intro.css">
<link rel="stylesheet" href="resources/css/intro/intro1_bubble.css">
<link rel="stylesheet" href="resources/css/intro/intro1_pilamant.css">
<link rel="stylesheet" href="resources/css/intro/intro1.css">
<link rel="stylesheet" href="resources/css/intro/intro2_ani.css">
<link rel="stylesheet" href="resources/css/intro/intro2_move.css">
<link rel="stylesheet" href="resources/css/intro/intro2.css">
<link rel="stylesheet" href="resources/css/intro/intro3_background.css">
<link rel="stylesheet" href="resources/css/intro/intro3.css">
<link rel="stylesheet" href="resources/css/intro/intro4_dama.css">
<link rel="stylesheet" href="resources/css/intro/intro4_nemo.css">
<link rel="stylesheet" href="resources/css/intro/intro4.css">

</head>
<body>
<div id="introMode" class="carousel slide" data-ride="carousel" data-interval="false">

<div id="clickBtn1" class="btn-circle-go list-top-margine1 t-styles">i</div>
<div id="clickBtn2" class="btn-circle-go list-top-margine2 t-styles">ii</div>
<div id="clickBtn3" class="btn-circle-go list-top-margine3 t-styles">iii</div>
<div id="clickBtn4" class="btn-circle-go list-top-margine4 t-styles">iv</div>

<div class="carousel-inner" role="listbox">
    <div class="item active">
      <jsp:include page="intro/intro1.jsp"></jsp:include>
    </div>

    <div class="item">
      <jsp:include page="intro/intro2.jsp"></jsp:include>
    </div>

    <div class="item">
      <jsp:include page="intro/intro3.jsp"></jsp:include>
    </div>

    <div class="item">
      <jsp:include page="intro/intro4.jsp"></jsp:include>
    </div>
  </div>

</div>
</body>
</html>