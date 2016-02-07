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

<style>
#md_content {
	height: 260px;
	border-radius: 6px;

}
.btn_choice {
	margin-top: 10px;
}
</style>




</head>
<body>
		<div id="show" class="modal-dialog"> 
			<div class="modal-content"  style="height: 170px;">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. Nickname..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="text" id="nick" name="nick" class="form-control">
					</div>
					<div class="col-sm-offset-1 col-sm-10">
							<button id="p1" class="btn btn-warning col-sm-12  btn_choice">go to</button>
					</div>
				</div>

			</div>
		</div>

		<div id="show1" class="modal-dialog">
			<div class="modal-content" id="md_content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<div class="col-sm-10">
						<h3>Member Modify</h3>
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
			<div class="modal-content">
				<div class="modal-body">

					<div id="lq1" style="height: 100px;">
						<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. Email..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="email" id="id" name="id" class="form-control">
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" class="btn btn-success col-sm-12  btn_choice" value="수정">
						</div>
					</div>

					<div id="lq2" style="height: 100px;">
						<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. Nickname..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="text" id="nick" name="nick" class="form-control">
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" class="btn btn-success col-sm-12 btn_choice" value="수정">
						</div>
					</div>

					<div id="lq3" style="height: 170px;">
						<div class="col-sm-offset-1 col-sm-10 s1">
							<span>Please.. changing password ..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="password" id="pass1" name="pass1"
								class="form-control">
						</div>
						<div class="col-sm-1">
							
						</div>
						<div class="col-sm-offset-1 col-sm-10 s2">
							<span>Please.. again ..</span>
						</div>

						<div class="col-sm-offset-1 col-sm-10">

							<input type="password" id="pass2" name="pass2"
								class="form-control">
						</div>
						<div class="col-sm-1">
							
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" class="btn btn-success col-sm-12 btn_choice" value="수정">
						</div>
					</div>

					<div id="lq4" style="height: 60px;">
						<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. delete..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" class="btn btn-success col-sm-12 " value="수정">
						</div>
					</div>

				</div>
			</div>
		</div>

</body>
</html>