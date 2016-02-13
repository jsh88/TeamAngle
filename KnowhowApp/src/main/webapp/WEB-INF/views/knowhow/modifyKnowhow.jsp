<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	
	var modifyImgArr = [10];
	var modifyUrlArr = [10];
	var modifyConArr = [10];
	var modifyPagingCount = 1;
	var modifyMaxPage = 1;
	var modifyUrl = "";
	
		$(document).ready(function(){		
			
			modifyMaxPage = parseInt("${post.mPage}");
			
			alert(modifyMaxPage);
			
			$("#modifyAddBtn").hide();
			$("#modifyDeleteBtn").hide();
			$(".p2").hide();
			$(".p3").hide();
			$(".p4").hide();
			$(".p5").hide();
			$(".p6").hide();
			$(".p7").hide();
			$(".p8").hide();
			$(".p9").hide();
			$(".p10").hide();

			<c:forEach items="${pConList}" var="pCon" varStatus="status">
			
				var media = "${pCon.media}";
				
				if(media == "none") {
					
					modifyImgArr["${status.index}"] = null;
					modifyUrlArr["${status.index}"] = undefined;
					
				} else if(media.indexOf("https:") > -1) {
					
					modifyImgArr["${status.index}"] = null;
					modifyUrlArr["${status.index}"] = "${pCon.media}";
					$('#modifyMediaIframe' + "${status.count}").attr("src", "${pCon.media}");
					$("#modifyMediaIframe"+ "${status.count}").css("z-index", "4");
					
				} else {
					
					modifyImgArr["${status.index}"] = "${pCon.media}";
					modifyUrlArr["${status.index}"] = undefined;
					$("#modifyMediaImg" + "${status.count}").attr("src", "${pCon.media}");
					$('#modifyMedia'+"${status.count}").css("background-image","none");
				
				}
				
				var content = modifyReplaceAll("${pCon.content}", '<br>', '\r\n');
				$("#mta" + "${status.count}").val(content);
				modifyConArr.push(content);
				
				$(".p" + "${status.count}").show();
				
			</c:forEach>
			
			 /*추가 버튼*/
			 $("#modifyAddBtn").click(function(){
				
				 var n = $(".knowhow" + modifyMaxPage).val();
				 
				 if(n == null || n == ""){
				 
					 alert('내용이 비어있습니다.');
					 
				 }else{	 
					 
					 $("#modifyCarousel").carousel(modifyPagingCount);
					 modifyModifyCon();
					 modifyMaxPage +=1;
					 modifyPagingCount += 1;
					 
					 if(modifyMaxPage==10) {
						 $("#modifyAddBtn").hide();
					 }
					 
					 $(".p"+ modifyMaxPage).show();
					 
				 }
				 
				 alert(modifyMaxPage);
			});
			 
			 /*삭제 버튼*/
			 $("#modifyDeleteBtn").click(function(){
				
				if(modifyMaxPage == 1){
					
					alert('삭제할 페이지가 없습니다.')
					
				}else{
					
					// clear 로직
					$('#modifyMediaIframe' + modifyMaxPage).attr('src', "");				// 미디어 src 비우기
					$('#modifyInputUrl').attr('value', "");									// 모달 위 모달 value 비우기
					$("#mta" + modifyPagingCount).val("");													// 컨텐트 비우기
					$("#modifyMediaIframe"+ modifyMaxPage).css("z-index", "2");	// 미디어 층 내리기
					$("#modifyMediaImg" + modifyPagingCount).attr("src", "");							// 이미지 비우기
					modifyImgArr[modifyPagingCount - 1] = null;													// 파일 비우기
					modifyUrlArr[modifyPagingCount - 1] = undefined;											// url 비우기
					modifyConArr[modifyPagingCount - 1] = null;													// content 비우기
					modifyUrl = "";																	// url 운반 변수 비우기
					
					$(".p"+modifyPagingCount).hide(); 
					modifyMaxPage -=1;
					modifyPagingCount -= 1;
					$("#modifyCarousel").carousel(modifyMaxPage - 1);
					
					if(modifyMaxPage==9) {
						$("#modifyAddBtn").show();
					}
				}
			 });
			 
			
			 /*div 간 이동*/
			$(".p1").click(function(){
				$("#modifyCarousel").carousel(0);
				modifyModifyCon();
				modifyPagingCount = 1;				
				checkModifyMaxPage();
			});
			
			$(".p2").click(function(){
				$("#modifyCarousel").carousel(1);
				modifyModifyCon();
				modifyPagingCount = 2;				
				checkModifyMaxPage();
			});
			
			$(".p3").click(function(){
				$("#modifyCarousel").carousel(2);
				modifyModifyCon();
				modifyPagingCount = 3;
				checkModifyMaxPage();
			});
			
			$(".p4").click(function(){
				$("#modifyCarousel").carousel(3);
				modifyModifyCon();
				modifyPagingCount = 4;
				checkModifyMaxPage();
			});
			
			$(".p5").click(function(){
				$("#modifyCarousel").carousel(4);
				modifyModifyCon();
				modifyPagingCount = 5;
				checkModifyMaxPage();
			});
			
			$(".p6").click(function(){
				$("#modifyCarousel").carousel(5);
				modifyModifyCon();
				modifyPagingCount = 6;
				checkModifyMaxPage();
			});
			
			$(".p7").click(function(){
				$("#modifyCarousel").carousel(6);
				modifyModifyCon();
				modifyPagingCount = 7;
				checkModifyMaxPage();
			});
			
			$(".p8").click(function(){
				$("#modifyCarousel").carousel(7);
				modifyModifyCon();
				modifyPagingCount = 8;
				checkModifyMaxPage();
			});
			
			$(".p9").click(function(){
				$("#modifyCarousel").carousel(8);
				modifyModifyCon();
				modifyPagingCount = 9;
				checkModifyMaxPage();
			});
			
			$(".p10").click(function(){
				$("#modifyCarousel").carousel(9);
				$("#modifyAddBtn").hide();
				modifyModifyCon();
				modifyPagingCount = 10;
				checkModifyMaxPage();
			});
			
			/* 이미지 드래그 앤 드롭 */
			$('.modifyMedia').on('drop', function(e) {	
				
				e.preventDefault();
				e.stopPropagation();

				var reader = new FileReader();

				reader.onload = function(ev) {

					$('#modifyMediaImg' + modifyPagingCount).attr('src', ev.target.result);
					$('#modifyMedia'+modifyPagingCount).css("background-image","none");

				}

				modifyImgArr[modifyPagingCount - 1] = e.originalEvent.dataTransfer.files[0];
				modifyUrlArr[modifyPagingCount - 1] = undefined;

				reader.readAsDataURL(modifyImgArr[modifyPagingCount - 1]);

			});		
			
			$("#modifyInputBtn").click(function(){
				
				modifyCloseModal();
				
			});
			
		});
		//		
		
		function modifyReplaceAll(str, target, replacement) {
			
   			return str.split(target).join(replacement);
   			
		};
		
		function modifyOpenModal(){
				
				if(modifyImgArr[modifyPagingCount - 1]) {
					
					alert("이미지가 들어있습니다. Clear 해주세요.");
					
				} else {
					
					$("#modifyInputModal").modal();
					
				}		
			}

		function modifyCloseModal(){
			
			modifyUrl = $("#modifyInputUrl").val();
			
			if(modifyUrl == ""){
				
				alert("URL이 입력되지 않았습니다.");
				$("#modifyInputModal").modal('hide');
			
			}else{
				
				$("#modifyInputModal").modal('hide');
				modifyUrlArr[modifyPagingCount - 1] = modifyUrl;
				modifyImgArr[modifyPagingCount - 1] = null;
				$("#modifyMediaIframe"+modifyPagingCount).css("z-index", "4");
				$("#modifyMediaIframe"+modifyPagingCount).attr("src", modifyUrl+"?autoplay=0&autohide=1");
				
				$("#modifyInputUrl").val("");
			}
		}
		
		function checkModifyMaxPage() {
			if(modifyMaxPage==modifyPagingCount) {
				if(modifyPagingCount==10) {
					$("#modifyAddBtn").hide();
					$("#modifyDeleteBtn").show();
				} else {
					$("#modifyAddBtn").show();
					$("#modifyDeleteBtn").show();
				}						
			} else {
				$("#modifyAddBtn").hide();
				$("#modifyDeleteBtn").hide();
			}
		}
		
		function modifyModifyCon() {
			
			modifyConArr[modifyPagingCount - 1] = $("#mta" + modifyPagingCount).val();
			
		}
		
		function modifyClearPage(){
				
			alert("모든 요소를 비웁니다.");
			
			// clear 로직
			$('#modifyMediaIframe' + modifyMaxPage).attr('src', "");				// 미디어 src 비우기
			$('#modifyInputUrl').attr('value', "");									// 모달 위 모달 value 비우기
			$("#mta" + modifyPagingCount).val("");													// 컨텐트 비우기
			$("#modifyMediaIframe"+ modifyMaxPage).css("z-index", "2");	// 미디어 층 내리기
			$("#modifyMediaImg" + modifyPagingCount).attr("src", "");							// 이미지 비우기
			$('#modifyMedia'+modifyPagingCount).css("background-image"," url('/KnowhowApp/resources/images/insertImage.png')");//원래 이미지로 
			modifyImgArr[modifyPagingCount - 1] = null;													// 파일 비우기
			modifyUrlArr[modifyPagingCount - 1] = undefined;											// url 비우기
			modifyConArr[modifyPagingCount - 1] = null;													// content 비우기
			modifyUrl = "";																	// url 운반 변수 비우기
			
		}
		
		function modifyModify() {
			
			for(var s = 0; s < modifyMaxPage ; s++) {
				
				alert(s + "페이지\n" + "이미지 : " + modifyImgArr[s] + "\nURL : " + modifyUrlArr[s] + "\n내용 : " + modifyConArr[s] + "\nmodifyMaxPage : " + modifyMaxPage);
				
				if($("#mta" + modifyPagingCount).val() == "") {
					alert("내용이 없는 페이지가 있습니다.");
					return;
				}
			}
		
		modifyConArr[modifyPagingCount - 1] = $("#mta" + modifyPagingCount).val();
		 

		$.ajaxSettings.traditional = true;
		var formData = new FormData();
		formData.append("mpage", modifyMaxPage);
		
		for(var k = 0; k < modifyMaxPage; k++) {
			formData.append("imgArr" + k, modifyImgArr[k]);
				modifyConArr[k] = modifyConArr[k] + "q1z";
				modifyUrlArr[k] = modifyUrlArr[k] + "q1z";
		}

		formData.append("urlArr", modifyUrlArr);
		formData.append("conArr", modifyConArr);
		
			$.ajax({
				type : 'POST',
				url		: 'completeModify',
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
// 			    	$(location).attr('href',"addTagPage");
					$('.wrap-loading').addClass('display-none');
// 			    	$("#addModal").modal("hide");
			    	
			    }
			}); 
		}
	</script>
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
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="modify()" value="Modify!">
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
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="modify()" value="Modify!">
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
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="modify()" value="Modify!">
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
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="modify()" value="Modify!">
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
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="modify()" value="Modify!">
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
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="modify()" value="Modify!">
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
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="modify()" value="Modify!">
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
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="modify()" value="Modify!">
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
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="modify()" value="Modify!">
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
													<input class="btn btn-success .btn-lg btnSubmit" type="button" onclick="modify()" value="Modify!">
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