<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="resources/css/addKnowhow.css">
	<style>
	</style>
	<script>
		$(document).ready(function(){
			
			var i = 1;
			
			$("#addModal").modal();
			
			$(".p2").hide();
			$(".p3").hide();
			$(".p4").hide();
			$(".p5").hide();
			$(".p6").hide();
			$(".p7").hide();
			$(".p8").hide();
			$(".p9").hide();
			$(".p10").hide();
			
			
			 /*추가 버튼*/
			 $("#addbtn").click(function(){
				
				 var n = $(".knowhow"+i).val();
				 
				 if(n == null || n == ""){
				 
					 alert('페이지가 비어있습니다.');
					 
				 }else{	 
					 
					 $("#myCarousel").carousel(i);
					 i +=1;
					 $(".p"+i).show();
				 
				 }
			}); 
			 
			 /*삭제 버튼*/
			 $("#deletebtn").click(function(){
				
				if(i == 1){
					
					alert('삭제할 페이지가 없습니다.')
					
				}else{
					
					$(".p"+i).hide(); 
					i -=1;
					$("#myCarousel").carousel(i-1);
					
				}
			 });
			 
			
			 /*div 간 이동*/
			$(".p1").click(function(){
				$("#myCarousel").carousel(0);
			});
			
			$(".p2").click(function(){
				$("#myCarousel").carousel(1);
			});
			
			$(".p3").click(function(){
				$("#myCarousel").carousel(2);
			});
			
			$(".p4").click(function(){
				$("#myCarousel").carousel(3);
			});
			
			$(".p5").click(function(){
				$("#myCarousel").carousel(4);
			});
			
			$(".p6").click(function(){
				$("#myCarousel").carousel(5);
			});
			
			$(".p7").click(function(){
				$("#myCarousel").carousel(6);
			});
			
			$(".p8").click(function(){
				$("#myCarousel").carousel(7);
			});
			
			$(".p9").click(function(){
				$("#myCarousel").carousel(8);
			});
			
			$(".p10").click(function(){
				$("#myCarousel").carousel(9);
			});
			
		});
	</script>
	<style>
	</style>
</head>
<body>
 	<div class="modal fade" id="addModal" data-backdrop="static">
		<div class="modal-dialog" id="addDialog">
				<div class="modal-content" id="addContent">
				<div id="addWrap">
					<div class="modal-header" id="header">
						<div id="Closeimg"><a href=""><img style="width:20px;" src="resources/images/close.png"/></a></div>
						<div id="Title">Title</div>
						<div id="CreateDate">2016.01.28 11:11:11</div>
					</div>
					<!-- Modal 상단-->
						<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
							
  							 <div class="carousel-inner" role="listbox">
  							 	<div class="item active">
  							 		<form name="addKnowhowForm" action="test.jsp" method="post">
										<div id="content">
											<div id="Media">
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow1" name="knowhow" rows="13" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="submit" value="Completed">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item">
  							 		<form name="addKnowhowForm" name="knowhow" action="test.jsp" method="post">
										<div id="content">
											<div id="Media">
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow2" name="knowhow" rows="13" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="submit" value="Completed">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item">
  							 		<form name="addKnowhowForm" name="knowhow" action="test.jsp" method="post">
										<div id="content">
											<div id="Media">
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow3"  name="knowhow" rows="13" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="submit" value="Completed">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item">
  							 		<form name="addKnowhowForm" name="knowhow" action="test.jsp" method="post">
										<div id="content">
											<div id="Media">
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow4" name="knowhow" rows="13" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="submit" value="Completed">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item">
  							 		<form name="addKnowhowForm" name="knowhow" action="test.jsp" method="post">
										<div id="content">
											<div id="Media">
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow5" name="knowhow" rows="13" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="submit" value="Completed">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item">
  							 		<form name="addKnowhowForm" name="knowhow" action="test.jsp" method="post">
										<div id="content">
											<div id="Media">
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow6" name="knowhow" rows="13" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="submit" value="Completed">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item">
  							 		<form name="addKnowhowForm" name="knowhow" action="test.jsp" method="post">
										<div id="content">
											<div id="Media">
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow7" name="knowhow" rows="13" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="submit" value="Completed">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item">
  							 		<form name="addKnowhowForm" name="knowhow" action="test.jsp" method="post">
										<div id="content">
											<div id="Media">
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow8" name="knowhow" rows="13" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="submit" value="Completed">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item">
  							 		<form name="addKnowhowForm" name="knowhow" action="test.jsp" method="post">
										<div id="content">
											<div id="Media">
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow9" name="knowhow" rows="13" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="submit" value="Completed">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item">
  							 		<form name="addKnowhowForm" name="knowhow" action="test.jsp" method="post">
										<div id="content">
											<div id="Media">
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow10" name="knowhow" rows="13" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="submit" value="Completed">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 </div>
						</div>
					
					
					</div>
				</div>
				<div id="addDelete">
					<div id="lineback"></div>
					<div id="postit">
						<div class="pageNumber p1">
							1
						</div>
						<div class="pageNumber p2">
							2
						</div>
						<div class="pageNumber p3">
							3
						</div>
						<div class="pageNumber p4">
							4
						</div>
						<div class="pageNumber p5">
							5
						</div>
						<div class="pageNumber p6">
							6
						</div>
						<div class="pageNumber p7">
							7
						</div>
						<div class="pageNumber p8">
							8
						</div>
						<div class="pageNumber p9">
							9
						</div>
						<div class="pageNumber p10">
							10
						</div>
					</div>
					<div id="addbtn">
						<img style="width:45px; margin-left: 6px; margin-top: 5px;" src="resources/images/add.png"/>
					</div>
					<div id="deletebtn">
						<img style="width:45px; margin-left: 6px; margin-top: 5px;"src="resources/images/delete.png"/>
					</div>
				</div>
			</div>
	</div>
</body>
</html>