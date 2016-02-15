<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
				<a id="brand" class="navbar-brand" href="index">Knowhow</a>
			</div>

			<div class="collapse navbar-collapse">

				<!--  검색 폼 -->

				<form class="navbar-form navbar-left" role="search" onsubmit="return false;">
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
							onclick="loginOpen()">Login</div></li>
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
		<div id="navLine" class="col-md-12"></div>
		<div id="navtag">
			<div id="navtag_lb">
				<div class="col-sm-1 navTagTitle">Tag</div>
				<div class="col-sm-9 navTags">
				<c:set var="isDoing" value="true"/>
					<c:forEach varStatus="status" var="tag" items="${tList }">
						<c:if test="${isDoing}">
							<a href="#" class="recommenTag">#${tag.tag }</a>
						<c:if test="${status.index eq 19}">
							<c:set var="isDoing" value="false"/></c:if>
						</c:if>						
					</c:forEach>
					<div class="col-sm-2"></div>
				</div>
			</div>
		</div>
	</nav>

	<!--  마이페이지 -->
	<div class="col-md-12 main-padding-mypage" id="myPageWrap">
		<div class="col-md-7"></div>
		<div class="col-md-5 main-padding-mypage">
			<div id="menu">
				<div id="profile_line" class="col-sm-12 col-xs-12 col-md-12">
					
					<div id="profile_nametag" class="col-sm-12 col-xs-12">
					
						<table id="mypageTable" class="table table-bordered radius-table">
							<tr>
								<th rowspan="3" class="main-padding-mypage mypage-td">
										<c:if test="${member.image eq null }">
										<img id="myProfileImage" src="resources/images/noImg.png" style="width:110px; height:110px;">
										</c:if>
										<c:if test="${member.image ne null }">
										<img id="myProfileImage" src="resources/images/${member.image }" style="width:110px; height:110px;">
									</c:if>
								</th>
								<td class="active">${member.nickName }</td>
							</tr>
							<tr>
								<td id="myProfileComment">${member.pComment }</td>
							</tr>
							<tr>
								<td>마지막 접속시간 : ${member.lDate }</td>
							</tr>
						</table>
					</div>
				</div>

				<!-- 마이페이지 버튼 -->
				<div id="nv1"
					class="col-sm-12 col-xs-12 btn-group btn-group-xs btn-group-sm btn-group-lg"
					role="group">
					<button id="edit_Profile" class="btn col-sm-3 col-xs-3 btn-choose-height"
						onclick="modalOpen('4')">Profile Edit</button>
					<button id="edit_MemModify"
						class="btn col-sm-3 col-xs-3" onclick="modalOpen('3')">Member
						Edit</button>
					<button class="btn col-sm-3 col-xs-3 btn-choose-height"
						onclick="startPosting()">Writing Post</button>
					<button class="btn col-sm-3 col-xs-3 btn-choose-height" onclick="modalOpen('11')">MyPost</button>
				</div>

				<!-- 마이페이지 - 최근 본 knowhow -->
				<div class="col-sm-12 col-xs-12">
					<div>
						<div id="recentlyTitle">Recently Viewed Knowhow list</div>
					</div>
					<div class="myPageBlankLine">&nbsp;</div>
					<div id="c1" class="content col-xs-12 col-sm-12">
						<c:if test="${ empty lately }">
							Recently viewed Post does not exist
						</c:if>
						<c:if test="${ not empty lately }">
							<c:forEach items="${ lately }" var="l">
							
								<div class="recentlyViewedWrap">
									<div class="recentlyListTitle">
										<a href="#" class="recentlyListDetailTitle">${ l.title }</a>
					
										<div class="recentlyClose" onclick="">
											<img style="width: 15px;" src="resources/images/close.png" />
										</div>
										
									</div>
									<div class="recentlyDate">CreateDate : ${ l.wDate }</div>
									
									<div class="recentlyNum">
										<div class="recentlyGood">Good : ${ l.good }</div>
										<div class="recentlyCount">ViewCount : ${ l.count }</div>
									</div>
								</div>
								<div class="recentlyLine"></div>
								
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="myPageBlankLine">&nbsp;</div>
				<div class="myPageBlankLine">&nbsp;</div>
				<!-- 마이페이지 -  자주 본 knowhow -->
				<div class="col-xs-12 col-sm-12">
					<div>
						<div id="mostTitle">Most Viewed Knowhow list</div>
					</div>
					<div class="myPageBlankLine">&nbsp;</div>
					<div id="c2" class="content col-xs-12 col-sm-12">
							<c:if test="${ empty most }">
								Recently viewed Post does not exist
							</c:if>
							<c:if test="${ not empty most }">
								<c:forEach items="${ most }" var="m">
									
									<div class="mostViewedWrap">
										<div class="mostListTitle">
											<a href="#" class="mostListDetailTitle">${ m.title }</a>
						
											<div class="mostClose" onclick="">
												<img style="width: 15px;" src="resources/images/close.png" />
											</div>
											
										</div>
										<div class="mostDate">CreateDate : ${ m.wDate }</div>
										
										<div class="mostNum">
											<div class="mostGood">Good : ${ m.good }</div>
											<div class="mostCount">ViewCount : ${ m.count }</div>
										</div>
									</div>
								<div class="mostLine"></div>
									
							</c:forEach>
						</c:if>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- loading 이미지 -->
	
	<div class="wrap-loading">
		<div><img src="resources/images/294.gif"/></div>
	</div>

		
	<!-- modal -->

	<div class="modal fade" id="loginPage">
		<jsp:include page="../login/login.jsp"></jsp:include>
	</div>
	
	<div class="modal fade" id="findPass">
		<jsp:include page="../member/findPass.jsp"></jsp:include>
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

	<div class="modal fade" id="myPostList">
		<jsp:include page="../knowhow/myKnowhow.jsp"></jsp:include>
	</div>
	
	<!-- 서버단 작업끝나면 modal fade 지울 페이지  , openModal() 추가해야함 -->
	
	<div class="modal fade" id="startPosting">
		<jsp:include page="../knowhow/startPosting.jsp"></jsp:include>
	</div>
	
	<div class="modal fade" id="addKnowhow" data-backdrop="static">
		<jsp:include page="../knowhow/addKnowhow.jsp"></jsp:include>
	</div>
	
	<div class="modal fade" id="startModify">
		<jsp:include page="../knowhow/startModify.jsp"></jsp:include>
	</div>

	<div class="modal fade" id="modifyKnowhow" data-backdrop="static">
		<jsp:include page="../knowhow/modifyKnowhow.jsp"></jsp:include>
	</div>
	
	<div class="modal fade" id="addTag" data-backdrop="static">
		<jsp:include page="../knowhow/addTag.jsp"></jsp:include>
	</div>
	
	<div class="modal fade" id="knowhowDetail" data-backdrop="static">
		<jsp:include page="../knowhow/knowhowDetail.jsp"></jsp:include>
	</div>
	