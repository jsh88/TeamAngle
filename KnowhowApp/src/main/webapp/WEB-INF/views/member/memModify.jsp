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
#content {
	height: 300px;
	border-radius: 6px;
	border: 10px solid #376cbf;
}

.btn {
	margin-top: 10px;
}
</style>

<script>
	$(document).ready(function() {
		$('#show1').hide();
		$('#show2').hide();

		$('#lq1').hide();
		$('#lq2').hide();
		$('#lq3').hide();
		$('#lq4').hide();
		$('.s1').hide();
		$('.s2').hide();
		
		$('#btnpw').click(function() {
			$('#show').show();
			$('#show1').hide();
			$('#show2').hide();
			$('#lq1').hide();
			$('#lq2').hide();
			$('#lq3').hide();
			$('#lq4').hide();
			$('.s1').hide();
			$('.s2').hide();
		});

		$('#p1').click(function() {
			$('#show1').show('slow');
			$('#lq1').hide();
			$('#lq2').hide();
			$('#lq3').hide();
			$('#lq4').hide();
			$('.s1').hide();
			$('.s2').hide();
		});

		$('#l1').click(function() {
			$('#show').hide('slow');
			$('#show2').first().show('slow', function lq1() {
				$('#lq1').show('slow');
				$('#lq2').hide(1000);
				$('#lq3').hide(1000);
				$('#lq4').hide(1000);
			});
		});
		$('#l2').click(function() {
			$('#show').hide('slow');
			$('#show2').first().show('slow', function lq1() {
				$('#lq2').show('slow');
				$('#lq1').hide(1000);
				$('#lq3').hide(1000);
				$('#lq4').hide(1000);
			});
		});
		$('#l3').click(function() {
			$('#show').hide('slow');
			$('#show2').first().show('slow', function lq1() {
				$('#lq3').show('slow');
				$('.s1').show('slow');
				$('.s2').show('slow');

				$('#lq1').hide(1000);
				$('#lq2').hide(1000);
				$('#lq4').hide(1000);
			});
		});
		$('#l4').click(function() {
			$('#show').hide('slow');
			$('#show2').first().show('slow', function lq1() {
				$('#lq4').show('slow');
				$('#lq1').hide(1000);
				$('#lq2').hide(1000);
				$('#lq3').hide(1000);
			});
		});

	});
</script>



</head>
<body>
	<button id="btnpw" class="btn btn-warning btn-lg" data-toggle="modal"
		data-target="#pwibox">PassWordInput</button>

	<div class="modal fade slide" id="pwibox" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div id="show" class="modal-dialog"> 
			<div class="modal-content"  style="height: 150px;">
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

					<div id="lq1" style="height: 100px;">
						<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. Email..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="email" id="id" name="id" class="form-control">
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" class="btn btn-success col-sm-12" value="수정">
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
							<input type="submit" class="btn btn-success col-sm-12" value="수정">
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
							<img src="http://placehold.it/30x30">
						</div>
						<div class="col-sm-offset-1 col-sm-10 s2">
							<span>Please.. again ..</span>
						</div>

						<div class="col-sm-offset-1 col-sm-10">

							<input type="password" id="pass2" name="pass2"
								class="form-control">
						</div>
						<div class="col-sm-1">
							<img src="http://placehold.it/30x30">
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" class="btn btn-success col-sm-12" value="수정">
						</div>
					</div>

					<div id="lq4" style="height: 60px;">
						<div class="col-sm-offset-1 col-sm-11">
							<span>Please.. delete..</span>
						</div>
						<div class="col-sm-offset-1 col-sm-10">
							<input type="submit" class="btn btn-success col-sm-12" value="수정">
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
</body>
</html>