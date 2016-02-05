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
<script>
$(document).ready(function(){
	
	$("#show").modal();
	
});
</script>
<style>
#content {
	height: 300px;
	border-radius: 6px;
	border: 10px solid #376cbf;
}

.btn {
	margin-top: 10px;
}
</style>

</head>
<body>
<<<<<<< HEAD
 <input type="hidden" name="id" value="${member}"/> 
	<button id="btnpw" class="btn btn-warning btn-lg" data-toggle="modal"
		data-target="#pwibox">PassWordInput</button>

	<div class="modal fade slide" id="pwibox" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
=======
<input type="hidden" name="id" value=""/>
>>>>>>> refs/heads/wooking

		<div id="show" class="modal-dialog">
			<div class="modal-content" style="height: 150px;">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>


						<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. password..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="password" id="passCheck" name="passCheck" class="form-control">
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<button id="p1" class="btn btn-warning col-sm-12">go to</button>
						</div>
					</div>
			</div>
		</div>



		<div id="show1" class="modal-dialog">
			<div class="modal-content" id="content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<div class="col-sm-10">
						<h3>Member Modify</h3>
					</div>

					<div class="list-group col-sm-offset-3 col-sm-6">
						<button id="l1" class="btn btn-warning col-sm-12">email</button>
						<button id="l2" class="btn btn-warning col-sm-12">nick</button>
						<button id="l3" class="btn btn-warning col-sm-12">pass</button>
						<button id="l4" class="btn btn-warning col-sm-12">delete</button>
					</div>
				</div>
			</div>
		</div>

		<div id="show2" class="modal-dialog">

			<div class="modal-content">
				<div class="modal-body">
				
				<form name="emailEdit" action="" method="post">
					<div id="lq1" style="height: 100px;">
						<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. Email..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="email" id="edit_id" name="id" class="form-control">
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" class="btn btn-success col-sm-12" value="Changing Email">
						</div>
					</div>
				</form>
				
				<form name="nickEdit" action="" method="post">
					<div id="lq2" style="height: 100px;">
						<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. Nickname..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="text" id="edit_nick" name="nickname" class="form-control">
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" class="btn btn-success col-sm-12" value="Changing Nickname">
						</div>
					</div>
				</form>
				
				<form name="passEdit" action="" method="post">
					<div id="lq3" style="height: 170px;">
						<div class="col-sm-offset-1 col-sm-10">
							<span>Please.. changing password ..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="password" id="edit_pass1"  class="form-control">
						</div>
						<div class="col-sm-1">
							<img src="http://placehold.it/30x30">
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<span>Please.. again ..</span>
						</div>

						<div class="col-sm-offset-1 col-sm-10">

							<input type="password" id="edit_pass2" name="pw" class="form-control">
						</div>
						<div class="col-sm-1">
							<img src="http://placehold.it/30x30">
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" class="btn btn-success col-sm-12" value="Changing Password">
						</div>
					</div>
				</form>


				<form name="deleteMem" action="" method="post">
					<div id="lq4" style="height: 60px;">
						<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. delete..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" class="btn btn-success col-sm-12" value="Member leave..">
						</div>
					</div>
				</form>
				
				</div>
			</div>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/ajax_myModfy.js"></script>
</body>
</html>