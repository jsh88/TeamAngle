<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
<script type="text/javascript">
	alert("myPage");
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
=======

>>>>>>> refs/heads/master
<script>

</script>
</head>

<body>
	<%-- <c:if test="${ member.id eq null }">
		<c:redirect url="loginMemberForm"/>
>>>>>>> refs/heads/master
	</c:if>
	<c:forEach var="m" items="${ member ne null }">
		${ m.id }
	</c:forEach> --%>
	
	<div id="menu">
			<div id="profil_line" class="col-sm-12 col-xs-12 col-md-12">
				<div id="profil_img" class="col-sm-5 col-xs-12">
					<img src="http://placehold.it/110x110">
				</div >
				<div id="profil_nametag"class="col-sm-7 col-xs-12">
				<div class="col-sm-12 col-xs-12">김용유</div>
				<div class="col-sm-12 col-xs-12">식용유같은느끼함</div>
				<div class="col-sm-12 col-xs-12">식용유같은느끼함</div>
				</div>
			</div>
			
			<div class="col-sm-12 col-xs-12 line"></div>
			
			<div id="nv1" class="col-sm-12 col-xs-12 btn-group btn-group-xs btn-group-sm btn-group-lg" role="group">
				<button id="edit_Profile" class="btn btn-warning col-sm-3 col-xs-3" onclick="location.href='member/memModify'">Profile Edit</button>
				<button class="btn btn-warning col-sm-3 col-xs-3" >Member Edit</button>
				<button class="btn btn-warning col-sm-3 col-xs-3" >Writing Post</button>
				<button class="btn btn-warning col-sm-3 col-xs-3" >MyPost</button>
			</div>
			<div class="col-sm-12 col-xs-12 line"></div>
			<div class="col-sm-12 col-xs-12">
				<div>
					<h3>I see you</h3>
				</div>
				<div id="c1" class="content col-xs-12 col-sm-12">
					<img src="http://placehold.it/300x270">
				</div>
			</div>
		
			<div class="col-xs-12 col-sm-12">
				<div>
					<h3>Very I see you</h3>
				</div>
				<div id="c2" class="content col-xs-12 col-sm-12">
					<img src="http://placehold.it/300x270">
				</div>
			</div>

	</div>
</body>
</html>