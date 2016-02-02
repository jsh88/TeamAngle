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
		.imgurl{
			position: absolute;
			width:20px;
			height: 200px;
			z-index:1;
			opacity:0;
			border:0px;
		}
		
		#Clear{
			float:right;
			margin-top: -15px;
			margin-right: 20px;
			opacity:0.9;
		}
	</style>
	<script>
		$(document).ready(function(){
			
			var i = 1;
			var m = "";
			
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
		
		function openModal(){
			
			$("#inputModal").modal();
			
		}
		
		function closeModal(){
			
			m = $("#inputurl").val();
			
			if(m == ""){
				$("#inputModal").hide();
			
			}else{
				
				$("#inputModal").hide();
				/* $("#Media").css("background-image","none"); */
				$("#url").val(m);
				$("#mediaiframe").css("z-index", "5");
				$("#mediaiframe").attr("src", m+"?autoplay=1&autohide=1");
				
				$("#inputurl").val("");
			}
		}
		
		function clearPage(){
				
			
			
		}
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
						<div id="Closeimg"><a href="#"><img style="width:20px;" src="resources/images/close.png"/></a></div>
						<div id="Title">${post.title }</div>
						<div id="CreateDate">${post.wDate }</div>
						<div id="Clear" onclick=""><a href="#"><img style="width:20px;" src="resources/images/clear.png"/></a></div>
					</div>
					<!-- Modal 상단-->
						<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
							
  							 <div class="carousel-inner" role="listbox">
  							 	<div class="item active">
  							 		<form name="addKnowhowForm" action="test.jsp" method="post">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m" onclick="openModal()"></div>
												<iframe id="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url" name="videourl"/><input type="file" class="imgurl" name="media"/><img id="mediaImg"/>
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow1" name="knowhow" rows="10" cols=""></textarea>
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
											<div id="Media"class="mbackground">
												<div id="m" onclick="openModal()"></div>
												<iframe id="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" name="videourl"/><input type="file" class="imgurl" name="media"/><img id="mediaImg"/>
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow2" name="knowhow" rows="10" cols=""></textarea>
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
											<div id="Media" class="mbackground">
												<div id="m" onclick="openModal()"></div>
												<iframe id="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" name="videourl"/><input type="file" class="imgurl" name="media"/><img id="mediaImg"/>
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow3"  name="knowhow" rows="10" cols=""></textarea>
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
											<div id="Media" class="mbackground">
												<div id="m" onclick="openModal()"></div>
												<iframe id="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" name="videourl"/><input type="file" class="imgurl" name="media"/><img id="mediaImg"/>
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow4" name="knowhow" rows="10" cols=""></textarea>
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
											<div id="Media" class="mbackground">
												<div id="m" onclick="openModal()"></div>
												<iframe id="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" name="videourl"/><input type="file"  class="imgurl" name="media"/><img id="mediaImg"/>
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow5" name="knowhow" rows="10" cols=""></textarea>
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
											<div id="Media" class="mbackground">
												<div id="m" onclick="openModal()"></div>
												<iframe id="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" name="videourl"/><input type="file"  class="imgurl" name="media"/><img id="mediaImg"/>
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow6" name="knowhow" rows="10" cols=""></textarea>
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
											<div id="Media" class="mbackground">
												<div id="m" onclick="openModal()"></div>
												<iframe id="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" name="videourl"/><input type="file" class="imgurl" name="media"/><img id="mediaImg"/>
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow7" name="knowhow" rows="10" cols=""></textarea>
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
											<div id="Media" class="mbackground">
												<div id="m" onclick="openModal()"></div>
												<iframe id="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" name="videourl"/><input type="file"  class="imgurl" name="media"/><img id="mediaImg"/>
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow8" name="knowhow" rows="10" cols=""></textarea>
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
											<div id="Media" class="mbackground">
												<div id="m" onclick="openModal()"></div>
												<iframe id="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" name="videourl"/><input type="file" class="imgurl" name="media"/><img id="mediaImg"/>
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow9" name="knowhow" rows="10" cols=""></textarea>
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
											<div id="Media" class="mbackground">
												<div id="m" onclick="openModal()"></div>
												<iframe id="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" name="videourl"/><input type="file" class="imgurl" name="media"/><img id="mediaImg"/>
											</div>
											<div id="content_Text">
												<textarea class="form-control knowhow10" name="knowhow" rows="10" cols=""></textarea>
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
			<div class="modal fade" id="inputModal">
		<div class="modal-dialog" id="inputDialog">
			<div class="modal-content" id="inputContent">
				<div id="inputWrap">
				<div id="Closeimg2"><a href=""><img style="width:20px;" src="resources/images/close.png"/></a></div>	
					<div id="inputTitle">
						<div class="form-group">
							<label for="addtitle" class="col-sm-12 control-label" id="titlelabel">Please enter a Video url</label>
							<div class="col-sm-12">
							<input type="text" class="form-control" id="inputurl" name="url" maxlength="80"/> 
							</div>
						</div>
						<div id="buttonGroup">
								<button type="button" class="btn btn-success addbtn"onclick="closeModal()"><b>Enter</b></button>
							</div>	
					</div>
			</div>
		</div>
		</div>
	</div>
	</div>
</body>
</html>