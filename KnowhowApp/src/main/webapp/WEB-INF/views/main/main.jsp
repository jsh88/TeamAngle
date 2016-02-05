<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<script>
$(document).ready(function(){
	
	
});
	function joinModal(){
		
		$("#lgbox").modal('hide');
		$('#dialog1').modal('hide');
		$("#lightbox").modal();
		
	}
	
	function loginModal(){
		
		$("#lightbox").modal('hide');
		$('#dialog2').modal('hide');
		$("#lgbox").modal();
	}
	
	 $(document).ready(function(){
		$('#menu').hide();
		$('#menu').css('height', $(window).height() - 80 );

		$(window).resize(function() {
	   		  $('#menu').css('height', $(window).height() - 80 );
		});
		
		$('#navbtn').click(function () {
			if($('#menu').css('display') == 'none') {
				$('#menu').slideDown(1000);
			} else {
				$('#menu').slideUp(500);
			}
		}); 
		
	});
</script>
<style>

</style>
</head>
<body>

		<!-- 검색바 -->
		<nav class="navbar navbar-default" id="header_main">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a id="brand" class="navbar-brand" href="#">KnowHow</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">

					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" id="search_btn" class="btn btn-default">Submit</button>
					</form>
					
					
					<!-- 로그인 / 로그아웃 상태창 -->
					<ul class="nav navbar-nav navbar-right">
					<% if(session.getAttribute("member") == null){ %>
						<li><div id="joinbtn" class="btn btn-lg" onclick="joinModal()">Join</div></li>
						<li><div id="loginbtn" class="btn btn-lg" onclick="loginModal()">Login</div></li>
						<li><div id="navbtn" class="btn btn-lg" onclick="navModal()">myPage</div></li>
					<% }else{ %>
						<li><div id="navbtn" class="btn btn-lg" onclick="navModal()">myPage</div></li>
						<li><div id="navbtn" class="btn btn-lg" onclick="navModal()">myPage</div></li>
					<%} %>
					</ul>
					
				</div>
				<!-- /.navbar-collapse -->
			</div>
			
			
			
			<!-- /.container-fluid -->
		</nav>
		<div class="col-lg-12">
		<!-- nav -->
		<div class="col-md-9"></div>
		<div class="col-md-3">
			<jsp:include page="../member/myPage.jsp"></jsp:include>
		</div>
		
		</div>
	
		<!-- 전체화면 -->


	<!-- nav -->
	
	

		
	<div class="modal" id="lgbox" tabindex="-1" role="dialog"
		aria-labelledby="loginModal" aria-hidden="true">
		<div id="dialog1" class="modal-dialog" >
			<jsp:include page="../login/login.jsp"></jsp:include>
		</div>
	</div>
	
	<div class="modal" id="lightbox" tabindex="-1" role="dialog"
		aria-labelledby="joinModal" aria-hidden="true">
		<div id="dialog2" class="modal-dialog" >
			<jsp:include page="../member/memJoin.jsp"></jsp:include>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/ajax_main.js"></script>
</body>
</html>