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
<link type="text/css" href="resources/css/header.css" rel="stylesheet">
<script src="resources/js/header.js"></script>
<script>
	function modalOpen(i) {

		var modal = "";

		if (i == "1") {
			modal = "memJoinPage";
			$("#mj_id, #mj_nickname, #mj_pass1, #mj_pass2").val("");
			$("#mj_id").show();
			$("#mj_btn_submit").hide();
			
		} else if (i == "2") {
			modal = "loginPage";
			
		} else if (i == "3") {
			modal = "memModifyPage";
		} else if (i == "4") {
			modal = "profileModifyPage";
		} else if (i == "5") {
			modal = "startPostingPage";
		}

		$("#" + modal).modal();
		
	}
</script>
<style>
</style>
</head>
<body>

	<!-- header -->
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

			<div class="collapse navbar-collapse">

				<!--  검색 폼 -->

				<form class="navbar-form navbar-left" role="search">
					<div id="search_form" class="input-group input-group-sm">
					<span class="input-group-btn">
							
							<button class="btn btn-default" type="button" id="search_btn">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
						</span>
						<input type="text" class="form-control" id="search_txt"
							placeholder="Search for..." style="width: 380px;"> 
					</div>
				</form>


				<!-- 로그인 / 로그아웃 상태창 -->
				<ul class="nav navbar-nav navbar-right">
					<%
						if (session.getAttribute("member") == null) {
					%>
					<li><div id="joinbtn" class="btn btn-lg"
							onclick="modalOpen('1')">Join</div></li>
					<li><div id="loginbtn" class="btn btn-lg"
							onclick="modalOpen('2')">Login</div></li>
					<%
						} else {
					%>
					<li><div id="logout" class="btn btn-lg"
							onclick="location.href='logoutMember'">Logout</div></li>
					<li><div id="navbtn" class="btn btn-lg">myPage</div></li>
					<%
						}
					%>
				</ul>

			</div>
		</div>
		<div id="navtag">
			<div id="navtag_lb">
				<div class="col-sm-1 navTagTitle">Tag</div>
				<div class="col-sm-11">
					<a href="#" class="recommenTag">#피자</a>
					<a href="#" class="recommenTag">#시카고</a>
					<a href="#" class="recommenTag">#갈릭소스</a>
				</div>
			</div>
		</div>
	</nav>

	<!--  마이페이지 -->
	<div class="col-lg-12" id="myPageWrap">
		<div class="col-md-9"></div>
		<div class="col-md-3">
			<div id="menu">
				<div id="profile_line" class="col-sm-12 col-xs-12 col-md-12">
					<div id="profile_img" class="col-sm-5 col-xs-12">

						<img src="http://placehold.it/110x110" width="110px;" height="110px;">

					</div>
					<div id="profile_nametag" class="col-sm-7 col-xs-12">
						<div class="col-sm-12 col-xs-12">김용유</div>
						<div class="col-sm-12 col-xs-12">식용유같은느끼함</div>
						<div class="col-sm-12 col-xs-12">식용유같은느끼함</div>
					</div>
				</div>

				<!-- 마이페이지 버튼 -->
				<div id="nv1"
					class="col-sm-12 col-xs-12 btn-group btn-group-xs btn-group-sm btn-group-lg"
					role="group">
					<button id="edit_Profile" class="btn btn-default col-sm-3 col-xs-3"
						onclick="modalOpen('4')">Profile Edit</button>
					<button id="edit_MemModify"
						class="btn btn-default col-sm-3 col-xs-3" onclick="modalOpen('3')">Member
						Edit</button>
					<button class="btn btn-default col-sm-3 col-xs-3"
						onclick="modalOpen('5')">Writing Post</button>
					<button class="btn btn-default col-sm-3 col-xs-3">MyPost</button>
				</div>

				<!-- 마이페이지 - 최근 본 knowhow -->
				<div class="col-sm-12 col-xs-12">
					<div>
						<h3>I see you</h3>
					</div>
					<div id="c1" class="content col-xs-12 col-sm-12">
						<img src="http://placehold.it/300x270">
					</div>
				</div>

				<!-- 마이페이지 -  자주 본 knowhow -->
				<div class="col-xs-12 col-sm-12">
					<div>
						<h3>Very I see you</h3>
					</div>
					<div id="c2" class="content col-xs-12 col-sm-12">
						<img src="http://placehold.it/300x270">
					</div>
				</div>

			</div>
		</div>
	</div>


	<!-- modal -->

	<div class="modal fade" id="loginPage">
		<jsp:include page="../login/login.jsp"></jsp:include>
	</div>

	<div class="modal fade" id="memJoinPage">
		<jsp:include page="../member/memJoin.jsp"></jsp:include>
	</div>

	<div class="modal fade" id="memModifyPage">
		<jsp:include page="../member/memModify.jsp"></jsp:include>
	</div>

	<div class="modal fade" id="profileModifyPage">
		<jsp:include page="../member/profileModify.jsp"></jsp:include>
	</div>


	<!-- 서버단 작업끝나면 modal fade 지울 페이지  , openModal() 추가해야함 -->



	<div class="modal fade" id="startPostingPage">
		<jsp:include page="../knowhow/startPosting.jsp"></jsp:include>
	</div>

	<%-- 	
	
	<div class="modal fade" id="addKnowhowPage" data-backdrop="static">
		<jsp:include page="../knowhow/addKnowhow.jsp"></jsp:include>
	</div> 
	
	<div class="modal fade" id="addTagPage" data-backdrop="static" >
		<jsp:include page="../knowhow/addTag.jsp"></jsp:include>
	</div> 
	
	<div class="modal fade" id="knowhowDetailPage" data-backdrop="static">
		<jsp:include page="../knowhow/knowhowDetail.jsp"></jsp:include>
	</div> 
	
	<div class="modal fade" id="knowhowModifyPage" data-backdrop="static">
		<jsp:include page="../knowhow/knowhowModify.jsp"></jsp:include>
	</div> 
	
	<div class="modal fade" id="myKnowhowPage" data-backdrop="static">
		<jsp:include page="../knowhow/myKnowhow.jsp"></jsp:include>
	</div>
	
	--%>


</body>
</html>