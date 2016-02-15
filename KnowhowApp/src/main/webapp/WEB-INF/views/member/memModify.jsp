<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div id="show" class="modal-dialog"> 
			<div class="modal-content memModify-bd-css"  style="height: 170px;">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. You're Password..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="password" id="passCheck" name="pass" class="form-control">
					</div>
					<div class="col-sm-offset-1 col-sm-10">
							<button id="p1" class="btn btn-warning col-sm-12  btn_choice">go to Modify</button>
					</div>
				</div>

			</div>
		</div>

		<div id="show1" class="modal-dialog">
			<div class="modal-content memModify-bd-css" id="md_content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<div class="col-sm-12">
						<h3 class="memModify-padding-zero">Member Modify</h3>
						<p class="memModify-padding-zero">It is where you modify your information. Choose the information you want to change</p>
					</div>

					<div class="list-group col-sm-offset-3 col-sm-6">
						<button id="l1" class="btn btn-warning col-sm-12">email</button>
						<button id="l2" class="btn btn-warning col-sm-12 btn_choice">nick</button>
						<button id="l3" class="btn btn-warning col-sm-12 btn_choice">pass</button>
						<button id="l4" class="btn btn-warning col-sm-12 btn_choice">delete</button>
					</div>
				</div>
			</div>
		</div>

		<div id="show2" class="modal-dialog">
			<div class="modal-content memModify-bd-css">
				<div class="modal-body">
				<form name="emailEdit" action="updateMemberIdModify">
					<div id="lq1" style="height: 100px;">
						<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. Email..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="hidden" id="h_id" name="h_id" value="${ member.id }" />
							<input type="email" id="edit_id" name="id" class="form-control">
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" id="emailSubmit" class="btn btn-success col-sm-12  btn_choice" value="Changing Email ID">
						</div>
					</div>
					</form>
					
					<form name="nickEdit" action="updateMemberNickNameModify">
					<div id="lq2" style="height: 100px;">
						<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. Nickname..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="hidden" id="h_nickname" name="h_nickname" value="${ member.nickName }" />
							<input type="text" id="nick" name="nick" class="form-control">
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" id="nickNameSubmit" class="btn btn-success col-sm-12 btn_choice" value="Changing Nickname">
						</div>
					</div>
					</form>
					
					<form action="updateMemberInfoPw">
					<div id="lq3" style="height: 170px;">
						<div class="col-sm-offset-1 col-sm-10 s1">
							<span>Please.. changing password ..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="password" id="edit_pass1" name="pass1"
								class="form-control">
						</div>
						<div class="col-sm-1">
							
						</div>
						<div class="col-sm-offset-1 col-sm-10 s2">
							<span>Please.. again ..</span>
						</div>

						<div class="col-sm-offset-1 col-sm-10">

							<input type="password" id="edit_pass2" name="pass2"
								class="form-control">
						</div>
						<div class="col-sm-1">
							
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" id="passSubmit" class="btn btn-success col-sm-12 btn_choice" value="Changing Password">
						</div>
					</div>
					</form>
					
					<form name="deleteMem" action="sendMemberDelete.do" method="post" >
						<div id="lq4" style="height: 60px;">
							<div class="col-sm-offset-1 col-sm-11">
								<span>Please.. delete..</span>
							</div>
							<div class="col-sm-offset-1 col-sm-10">
								<input type="submit" id="deleteMember" class="btn btn-success col-sm-12 " value="Leave Membership" />
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	<c:if test="${ param.check == true }">
		<script>
		//$('#show').show();
		window.onload = function() {
	
			$("#findPass").modal();
	//		$('#l3').trigger("click");	
			
		}			
		</script>
	</c:if>
	
	<c:if test="${ param.deletecheck == true }">
		<script>
		//$('#show').show();
		window.onload = function() {
			
			alert("회원탈퇴처리 되었습니다.");
//			window.location.href="deleteMemberSession.do";
			/* self.opener = self;
			window.close(); */
			window.location.href="./";
		}			
		</script>
	</c:if>
</body>
</html>