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
	
	.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2);
    }
    
     .wrap-loading div{ /*로딩 이미지*/
         width:1000;  /*div의 전체 가로픽셀*/
		 position:absolute;   /*테이블의 영향을받지않는 div*/
		 left:50%;   /*div 왼쪽 top 부분이 가로 전체의 중간으로 위치하게됨*/
		 margin-left:-500px;  /* 왼쪽 top부분이 가운데로왔으니 좌측에서 전체가로픽셀의 반을 마이너스하여 좌측으로 옮겨줌 */
    }
    
    .display-none{ /*감추기*/
        display:none;
    }
	
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
			cursor: pointer;
		}
	</style>
	<script>
	
	var imgArr = [10];
	var urlArr = [10];
	var conArr = [10];
	var i = 1;
	var maxPage = 1;
	var url = "";
	
		$(document).ready(function(){			
			
			imgArr[0] = null;
			conArr[0] = null;
			urlArr[0] = undefined;
			
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
				
				 var n = $(".knowhow" + maxPage).val();
				 
				 if(n == null || n == ""){
				 
					 alert('내용이 비어있습니다.');
					 
				 }else{	 
					 
					 $("#myCarousel").carousel(i);
					 modifyCon();
					 maxPage +=1;
					 i += 1;
					 
					 if(maxPage==10) {
						 $("#addbtn").hide();
					 }
					 
					 $(".p"+ maxPage).show();
					 
				 }
			}); 			 
			 
			 /*삭제 버튼*/
			 $("#deletebtn").click(function(){
				
				if(maxPage == 1){
					
					alert('삭제할 페이지가 없습니다.')
					
				}else{
					
					// clear 로직
					$('#mediaiframe' + maxPage).attr('src', "");				// 미디어 src 비우기
					$('#inputurl').attr('value', "");									// 모달 위 모달 value 비우기
					$("#ta" + i).val("");													// 컨텐트 비우기
					$("#mediaiframe"+ maxPage).css("z-index", "2");	// 미디어 층 내리기
					$("#mediaImg" + i).attr("src", "");							// 이미지 비우기
					imgArr[i - 1] = null;													// 파일 비우기
					urlArr[i - 1] = undefined;											// url 비우기
					conArr[i - 1] = null;													// content 비우기
					url = "";																	// url 운반 변수 비우기
					
					$(".p"+i).hide(); 
					maxPage -=1;
					i -= 1;
					$("#myCarousel").carousel(maxPage - 1);
					
					if(maxPage==9) {
						$("#addbtn").show();
					}
				}
			 });
			 
			
			 /*div 간 이동*/
			$(".p1").click(function(){
				$("#myCarousel").carousel(0);
				checkVideo();
				modifyCon();
				i = 1;				
				checkMaxPage();
			});
			
			$(".p2").click(function(){
				$("#myCarousel").carousel(1);
				checkVideo();
				modifyCon();
				i = 2;				
				checkMaxPage();
			});
			
			$(".p3").click(function(){
				$("#myCarousel").carousel(2);
				checkVideo();
				modifyCon();
				i = 3;
				checkMaxPage();
			});
			
			$(".p4").click(function(){
				$("#myCarousel").carousel(3);
				checkVideo();
				modifyCon();
				i = 4;
				checkMaxPage();
			});
			
			$(".p5").click(function(){
				$("#myCarousel").carousel(4);
				checkVideo();
				modifyCon();
				i = 5;
				checkMaxPage();
			});
			
			$(".p6").click(function(){
				$("#myCarousel").carousel(5);
				checkVideo();
				modifyCon();
				i = 6;
				checkMaxPage();
			});
			
			$(".p7").click(function(){
				$("#myCarousel").carousel(6);
				checkVideo();
				modifyCon();
				i = 7;
				checkMaxPage();
			});
			
			$(".p8").click(function(){
				$("#myCarousel").carousel(7);
				checkVideo();
				modifyCon();
				i = 8;
				checkMaxPage();
			});
			
			$(".p9").click(function(){
				$("#myCarousel").carousel(8);
				checkVideo();
				modifyCon();
				i = 9;
				checkMaxPage();
			});
			
			$(".p10").click(function(){
				$("#myCarousel").carousel(9);
				$("#addbtn").hide();
				checkVideo();
				modifyCon();
				i = 10;
				checkMaxPage();
			});
			
			/* 이미지 드래그 앤 드롭 */
			$('.m').on('drop', function(e) {	
				
				e.preventDefault();
				e.stopPropagation();

				var reader = new FileReader();

				reader.onload = function(ev) {

					$('#mediaImg' + i).attr('src', ev.target.result);

				}

				imgArr[i - 1] = e.originalEvent.dataTransfer.files[0];
				urlArr[i - 1] = undefined;

				reader.readAsDataURL(imgArr[i - 1]);

			});		
			
			$("#inpuBtn").click(function(){
				
				closeModal();
				
			});
			
		});
		//		
		
		function openModal(){
				
				if(imgArr[i - 1]) {
					
					alert("이미지가 들어있습니다. Clear 해주세요.");
					
				} else {
					
					$("#inputModal").modal();
					
				}		
			}

		function closeModal(){
			
			url = $("#inputurl").val();
			
			if(url == ""){
				
				alert("URL이 입력되지 않았습니다.");
				$("#inputModal").modal('hide');
			
			}else{
				
				$("#inputModal").modal('hide');
				urlArr[i - 1] = url;
				imgArr[i - 1] = null;
				$("#mediaiframe"+i).css("z-index", "4");
				$("#mediaiframe"+i).attr("src", url+"?autoplay=0&autohide=1");
				
				$("#inputurl").val("");
			}
		}
		
		function checkVideo() {
			if(urlArr[i - 1]) { // 보류
// 				$("mediaiframe" + i)[0].contentWindow.postMessage('{"event":"command", "func":"pauseVideo","args":""}','*');
			}
		}
		
		function checkMaxPage() {
			if(maxPage==i) {
				if(i==10) {
					$("#addbtn").hide();
					$("#deletebtn").show();
				} else {
					$("#addbtn").show();
					$("#deletebtn").show();
				}						
			} else {
				$("#addbtn").hide();
				$("#deletebtn").hide();
			}
		}
		
		function modifyCon() {
			
			conArr[i - 1] = $("#ta" + i).val();
			
		}
		
		function clearPage(){
				
			alert("모든 요소를 비웁니다.");
			
			// clear 로직
			$('#mediaiframe' + i).attr('src', "");							// 미디어 src 비우기
			$('#inputurl').attr('value', "");									// 모달 위 모달 value 비우기
			$("#ta" + i).val("");													// 컨텐트 비우기
			$("#mediaiframe"+ i).css("z-index", "2");					// 미디어 층 내리기
			$("#mediaImg" + i).attr("src", "");							// 이미지 비우기
			imgArr[i - 1] = null;													// 파일 비우기
			urlArr[i - 1] = undefined;											// url 비우기
			conArr[i - 1] = null;													// content 비우기
			url = "";																	// url 운반 변수 비우기
			
		}		

// 			alert($("#imgurl1").val());
// 			conArr[i - 1] = $("#ta" + i).val();
// 			if(!imgArr[i - 1]) { imgArr[i - 1] = null }
// 			if(!urlArr[i - 1]) { urlArr[i - 1] = null }			
// 			for(var j = 0; j < 10; j++) {				
// 				if(conArr[j]) {					
// 					alert(j + "페이지\n" + "이미지 : " + imgArr[j] + "\nURL : " + urlArr[j] + "\n내용 : " + conArr[j] + "\nmaxPage : " + maxPage);					
// 				}
// 			}

		function complete() {
			
			for(var s = 0; s < maxPage ; s++) {
				if($("#ta" + i).val() == "") {
					alert("내용이 없는 페이지가 있습니다.");
					return;
				}
			}
		
		conArr[i - 1] = $("#ta" + i).val();
		 

		$.ajaxSettings.traditional = true;
		var formData = new FormData();
		formData.append("mpage", maxPage);
		
		for(var k = 0; k < maxPage; k++) {
			formData.append("imgArr" + k, imgArr[k]);
				conArr[k] = conArr[k] + "q1z";
				urlArr[k] = urlArr[k] + "q1z";
		}

		formData.append("urlArr", urlArr);
		formData.append("conArr", conArr);
		
			$.ajax({
				type : 'POST',
				url		: 'completeWrite',
				data	: formData, 
				processData : false,
				contentType : false,
				success : function(v) {
					
					alert("성공이다해!")
					
				}, beforeSend : function() {
					
			    	// 이미지 보여주기
					$('.wrap-loading').removeClass('display-none');
					
				},
				error : function(request, status, error){
					
					alert("code:"+request.status+"\n\n"+"message:"+request.responseText+"\n\n"+"error:"+error);
					
			    },
			    complete : function(){			    				
			    	
			    	// 이미지 감추기 처리
			    	$(location).attr('href',"addTagPage");
					$('.wrap-loading').addClass('display-none');
			    	$("#addModal").modal("hide");			    	
			    	
			    }
			}); 
		}
	</script>
	<style>
	</style>
</head>
<body> 	
		<div class="modal fade" id="addModal">
		<div class="modal-dialog" id="addDialog">
				<div class="modal-content" id="addContent">
				<div id="addWrap">
					<div class="modal-header" id="header">
						<div id="Closeimg"><a href="#"><img style="width:20px;" src="resources/images/close.png"/></a></div>
						<div id="Title">${post.title }</div>
						<div id="CreateDate">${post.wDate }</div>
						<div id="Clear" onclick="clearPage()"><img style="width:20px;" src="resources/images/clear.png"/></div>
					</div>
					<!-- Modal 상단-->
						<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">				
							
  							 <div class="carousel-inner" role="listbox">
  							 
  							  	<div class="wrap-loading display-none">
						    		<div><img src="resources/images/loading2.gif" /></div>
								</div>
  							 					
  							 	<div class="item active additem">
  							 		<form name="addKnowhowForm1" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m1" class="m" onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe1" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscree></iframe>
												<input type="hidden" id="url1" name="videourl"/><input type="file" class="imgurl" id="imgurl1" name="media"/><img class="mediaImg" id="mediaImg1"/>
											</div>
											<div id="content_Text">
												<textarea id="ta1" class="form-control knowhow1" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="complete()" value="Complete">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm2" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media"class="mbackground">
												<div id="m2" class="m" onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe2" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden"id="url2" name="videourl"/><input type="file" class="imgurl" id="imgurl2" name="media"/><img class="mediaImg" id="mediaImg2"/>
											</div>
											<div id="content_Text">
												<textarea id="ta2" class="form-control knowhow2" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="complete()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm3" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m3" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe3" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url3" name="videourl"/><input type="file" class="imgurl" id="imgurl3" name="media"/><img class="mediaImg" id="mediaImg3"/>
											</div>
											<div id="content_Text">
												<textarea id="ta3" class="form-control knowhow3"  name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="complete()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm4" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m4" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe4" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url4"  name="videourl"/><input type="file" class="imgurl" id="imgurl4" name="media"/><img class="mediaImg" id="mediaImg4"/>
											</div>
											<div id="content_Text">
												<textarea id="ta4" class="form-control knowhow4" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="complete()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm5" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m5" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe5" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden"  id="url5" name="videourl"/><input type="file"  class="imgurl" id="imgurl5" name="media"/><img class="mediaImg" id="mediaImg5"/>
											</div>
											<div id="content_Text">
												<textarea id="ta5" class="form-control knowhow5" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="complete()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm6" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m6" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe6" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url6" name="videourl"/><input type="file"  class="imgurl" id="imgurl6" name="media"/><img class="mediaImg" id="mediaImg6"/>
											</div>
											<div id="content_Text">
												<textarea id="ta6" class="form-control knowhow6" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="complete()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm7" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m7" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe7" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url7" name="videourl"/><input type="file" class="imgurl" id="imgurl7" name="media"/><img class="mediaImg" id="mediaImg7"/>
											</div>
											<div id="content_Text">
												<textarea id="ta7" class="form-control knowhow7" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="complete()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm8" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m8" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe8" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url8" name="videourl"/><input type="file"  class="imgurl" id="imgurl8" name="media"/><img class="mediaImg" id="mediaImg8"/>
											</div>
											<div id="content_Text">
												<textarea id="ta8" class="form-control knowhow8" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="complete()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm9" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m9" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe9" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url9" name="videourl"/><input type="file" class="imgurl" id="imgurl9" name="media"/><img class="mediaImg" id="mediaImg9"/>
											</div>
											<div id="content_Text">
												<textarea id="ta9" class="form-control knowhow9" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="complete()" value="complete!">
												</div>
											</div>
										</div>
									</form>
  							 	</div>
  							 	<div class="item additem">
  							 		<form name="addKnowhowForm10" name="knowhow" action="test.jsp" method="post">
										<div id="addKnowhowcontent">
											<div id="Media" class="mbackground">
												<div id="m10" class="m"  onclick="openModal()" contenteditable="true"></div>
												<iframe id="mediaiframe10" class="mediaiframe" width="567" height="300" frameborder="0" allowfullscreen></iframe>
												<input type="hidden" id="url10" name="videourl"/><input type="file" class="imgurl" id="imgurl10" name="media"/><img class="mediaImg" id="mediaImg10"/>
											</div>
											<div id="content_Text">
												<textarea id="ta10" class="form-control knowhow10" name="knowhow" rows="10" cols=""></textarea>
											</div>
											<div class="btnDialog">
												<div class="btn_Group">
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="complete()" value="complete!">
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
						<img style="width:45px; margin-left: 6px; margin-top: 5px;"src="resources/images/subtract.png"/>
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
								<button type="button" class="btn btn-success addbtn" id="inpuBtn"><b>Enter</b></button>
							</div>	
					</div>
			</div>
		</div>
		</div>
	</div>
	</div>
</body>
</html>