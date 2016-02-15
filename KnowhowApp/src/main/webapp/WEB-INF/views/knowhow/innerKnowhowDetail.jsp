<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
	<script>
		var detailPagingCount = 1;
		var detailPrePagingCount = 0;
		var detailMaxPage = 0;
		var recoNum = 0;
		var detailPno = "";
	
		$(document).ready(function(){
			
			$('#header_main').css('width', $(window).width());
			
			detailMaxPage = parseInt("${post.mPage}");
			detailPno = "${post.pNo}";
			recoNum = parseInt("${postRecommendationCount}");
			
			$("#recommenNum").text(recoNum);
			
			getCommentList();
			
			$("#addbtn").hide();
			$("#deletebtn").hide();
			$(".p2").hide();
			$(".p3").hide();
			$(".p4").hide();
			$(".p5").hide();
			$(".p6").hide();
			$(".p7").hide();
			$(".p8").hide();
			$(".p9").hide();
			$(".p10").hide();

			$(".p"+detailPagingCount).css("width","65");
			
			<c:forEach items="${pConList}" var="pCon" varStatus="status">
				
				var media = "${pCon.media}";
				
				if(media == "none") {
					
					$('#mediaiframe'+'${status.count}').attr("src" , "resources/images/nomedia.png");
					
				} else if(media.indexOf("https:") > -1) {
					
					$('#mediaiframe' + "${status.count}").attr("src", "${pCon.media}");
					$("#mediaiframe"+ "${status.count}").css("z-index", "4");
					
				} else {
					
					$("#mediaImg" + "${status.count}").attr("src", "${pCon.media}");
					$('#m'+"${status.count}").css("background-image","none");
				
				}
				
// 				var content = replaceAll("${pCon.content}", '<br>', '\n');
				var content = "${pCon.content}";
				$("#content_Text" + "${status.count}").html(content);
				
				$(".p" + "${status.count}").show();
				
			</c:forEach>
			
			$("#detailModal").modal();
			$("#modifyDelete").hide();
			$("#commentContent").hide();
			$("#detailDialog").css("width", "760px");
			
			$(".pageNumber").mouseover(function(){
				
				$(this).css("width" , "65");
			
			});
			
			$(".pageNumber").mouseout(function(){
				
				if($(this).is(".p"+detailPagingCount) === true){
					
					$(this).css("width" , "65");
				
				}else{
					
					$(this).css("width" , "50");
				}
			
			});
			
			$("#detailModalInfoImg").mouseover(function(){
				
				$("#detailInfoModal").modal();
				
			});
			
			$("#detailInfoViewImg").mouseout(function(){
				
				$("#detailInfoModal").modal('hide');
				
				if (addImgArr[detailPagingCount - 1]) {
					
				}else{
					$('#m' + detailPagingCount).css("background-image","none");
				}
			});
			
			$("#replycontent").click(function(e){
				
				e.preventDefault();
				e.stopPropagation();
				
				if($("#commentContent").css("display") == "none"){
					
					$("#commentContent").slideDown(400);
					$("#detailDialog").css("width", "1130px");
					
				}else{
					
					$("#commentContent").slideUp("400", function(){
						
						$("#detailDialog").css("width", "760px");
					});
						
				}
				
			});
			
			$(".p1").click(function(){
				$("#detailCarousel").carousel(0);
				detailPrePagingCount = detailPagingCount;
				detailPagingCount = 1;
				getCommentList();
				$(".p"+detailPagingCount).css("width","65");
				$(".p"+detailPrePagingCount).css("width","50");
			});
			
			$(".p2").click(function(){
				$("#detailCarousel").carousel(1);
				detailPrePagingCount = detailPagingCount;
				detailPagingCount = 2;
				getCommentList();
				$(".p"+detailPagingCount).css("width","65");
				$(".p"+detailPrePagingCount).css("width","50");
			});
			
			$(".p3").click(function(){
				$("#detailCarousel").carousel(2);
				detailPrePagingCount = detailPagingCount;
				detailPagingCount = 3;
				getCommentList();
				$(".p"+detailPagingCount).css("width","65");
				$(".p"+detailPrePagingCount).css("width","50");
			});
			
			$(".p4").click(function(){
				$("#detailCarousel").carousel(3);
				detailPrePagingCount = detailPagingCount;
				detailPagingCount = 4;
				getCommentList();
				$(".p"+detailPagingCount).css("width","65");
				$(".p"+detailPrePagingCount).css("width","50");
			});
			
			$(".p5").click(function(){
				$("#detailCarousel").carousel(4);
				detailPrePagingCount = detailPagingCount;
				detailPagingCount = 5;
				getCommentList();
				$(".p"+detailPagingCount).css("width","65");
				$(".p"+detailPrePagingCount).css("width","50");
			});
			
			$(".p6").click(function(){
				$("#detailCarousel").carousel(5);
				detailPrePagingCount = detailPagingCount;
				detailPagingCount = 6;
				getCommentList();
				$(".p"+detailPagingCount).css("width","65");
				$(".p"+detailPrePagingCount).css("width","50");
			});
			
			$(".p7").click(function(){
				$("#detailCarousel").carousel(6);
				detailPrePagingCount = detailPagingCount;
				detailPagingCount = 7;
				getCommentList();
				$(".p"+detailPagingCount).css("width","65");
				$(".p"+detailPrePagingCount).css("width","50");
			});
			
			$(".p8").click(function(){
				$("#detailCarousel").carousel(7);
				detailPrePagingCount = detailPagingCount;
				detailPagingCount = 8;
				getCommentList();
				$(".p"+detailPagingCount).css("width","65");
				$(".p"+detailPrePagingCount).css("width","50");
			});
			
			$(".p9").click(function(){
				$("#detailCarousel").carousel(8);
				detailPrePagingCount = detailPagingCount;
				detailPagingCount = 9;
				getCommentList();
				$(".p"+detailPagingCount).css("width","65");
				$(".p"+detailPrePagingCount).css("width","50");
			});
			
			$(".p10").click(function(){
				$("#detailCarousel").carousel(9);
				detailPrePagingCount = detailPagingCount;
				detailPagingCount = 10;
				getCommentList();
				$(".p"+detailPagingCount).css("width","65");
				$(".p"+detailPrePagingCount).css("width","50");
			});
			
			$("#inputCom").on("keypress", function(key){
				
				if(key.keyCode == 13) {
					
					addComment();
					
				}
				
			});
			
		});
		
		function replaceAll(str, target, replacement) {
			
   			return str.split(target).join(replacement);
   			
		};
		
		// 댓글 가져오기
		function getCommentList() {
			
		    // 폼 데이터 받기 or Append or 인자로 form id)
			var formData = new FormData();
			
			formData.append("pno", detailPno);
			formData.append("page", detailPagingCount - 1);

			$.ajax({
				type : 'POST',
				url : 'getCommentList',
				data : formData,
				processData : false,
				contentType : false,

				success : function(responseData, statusText, xhr) {
					
					var result = responseData;
					$('#replyDiv').empty();
					$('#replyDiv').html(result);
					// 성공처리(v는 서버로 받은 메시지, value)
					
				},
				beforeSend : function() {

					// 전송 전
					// 이미지 보여주기
					$('.wrap-loading').removeClass('display-none');
					
				},
				error : function(request, status, error) {

					// 에러 로직, 에러 로그 확인
// 					alert("code:" + request.status + "\n\n" + "message:"
// 							+ request.responseText + "\n\n" + "error:" + error);

				},
				complete : function() {

					// 이미지 감추기 처리
//					$(location).attr('href', "이동할 페이지");
					$('.wrap-loading').addClass('display-none');
					$("#tagModal").modal("hide");

				}				
			});						
		}
		
		function setRecommendation() {
			
			$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
			 // 폼 데이터 받기 or Append or 인자로 form id)
			var formData = new FormData();
			formData.append("pno", detailPno);

			$.ajax({
				type : 'POST',
				url : 'recommendPost',
				data : formData,
				processData : false,
				contentType : false,

				success : function(v) {
					
					// 성공처리(v는 서버로 받은 메시지, value)
					if(v == 'true') {
						recoNum = recoNum + 1;
					} else {
						recoNum = recoNum - 1;
					}
											
					$("#recommenNum").text(recoNum);
					
				},
				beforeSend : function() {

					// 전송 전
					// 이미지 보여주기
					$('.wrap-loading').removeClass('display-none');
					
				},
				error : function(request, status, error) {

					// 에러 로직, 에러 로그 확인
// 					alert("code:" + request.status + "\n\n" + "message:"
// 							+ request.responseText + "\n\n" + "error:" + error);

				},
				complete : function() {

					// 이미지 감추기 처리
					$('.wrap-loading').addClass('display-none');
// 					$("#addModal").modal("hide");

				}
			});
		}
		
		function addComment() {
			
			if($("#inputCom").val() == "") {
				
				alert("내용이 비었습니다.");
				
			} else {
				
				$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
				 // 폼 데이터 받기 or Append or 인자로 form id)
				var formData = new FormData();
				formData.append("pno", detailPno);
				formData.append("content", $("#inputCom").val());
				formData.append("page", detailPagingCount - 1);
	
				$.ajax({
					type : 'POST',
					url : 'addPostComment',
					data : formData,
					processData : false,
					contentType : false,
	
					success : function(v) {
						
						// 성공처리(v는 서버로 받은 메시지, value)
						getCommentList();
						$("#inputCom").val("");
						
					},
					beforeSend : function() {
	
						// 전송 전
						// 이미지 보여주기
						$('.wrap-loading').removeClass('display-none');
						
					},
					error : function(request, status, error) {
	
						// 에러 로직, 에러 로그 확인
// 						alert("code:" + request.status + "\n\n" + "message:"
// 								+ request.responseText + "\n\n" + "error:" + error);
	
					},
					complete : function() {
	
						// 이미지 감추기 처리
						$('.wrap-loading').addClass('display-none');
// 						$("#addModal").modal("hide");
	
					}
				});
			}
		}
		
		function delComment(cNo) {
			
			$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
			 // 폼 데이터 받기 or Append or 인자로 form id)
			var formData = new FormData();
			formData.append("cno", cNo);

			$.ajax({
				type : 'POST',
				url : 'delPostComment',
				data : formData,
				processData : false,
				contentType : false,

				success : function(v) {
					
					// 성공처리(v는 서버로 받은 메시지, value)
					getCommentList();
					
				},
				beforeSend : function() {

					// 전송 전
					// 이미지 보여주기
					$('.wrap-loading').removeClass('display-none');
					
				},
				error : function(request, status, error) {

					// 에러 로직, 에러 로그 확인
// 					alert("code:" + request.status + "\n\n" + "message:"
// 							+ request.responseText + "\n\n" + "error:" + error);

				},
				complete : function() {

					// 이미지 감추기 처리
					$('.wrap-loading').addClass('display-none');
// 					$("#addModal").modal("hide");

				}
			});
		}
		
		function modifyComment(me, cNo) {
			
			if($("#modifyInput").val() == undefined) {

			var target = $(me).parent().next(".replycontents");
			var oldContent = target.text();
			
			target.empty();
			target.append("<input id='modifyInput' style='width:300px;' type='text' />");
			$("#modifyInput").val(oldContent.trim());
			$("#modifyInput").focus();
			
			$("#modifyInput").keypress (function (key) {
				
				if(key.keyCode == 13) {
					
					var content = $("#modifyInput").val();
					
					if(content == "") {
						
						alert("내용이 비었습니다.");
						
					} else {
						
						$.ajaxSettings.traditional = true; // 배열형식으로 넘기기
						 // 폼 데이터 받기 or Append or 인자로 form id)
						var formData = new FormData();
						formData.append("cno", cNo);
						formData.append("content", content);

						$.ajax({
							type : 'POST',
							url : 'modifyPostComment',
							data : formData,
							processData : false,
							contentType : false,

							success : function(v) {
								
								// 성공처리(v는 서버로 받은 메시지, value)
								getCommentList();
								
							},
							beforeSend : function() {

								// 전송 전
								// 이미지 보여주기
								$('.wrap-loading').removeClass('display-none');
								
							},
							error : function(request, status, error) {

								// 에러 로직, 에러 로그 확인
// 								alert("code:" + request.status + "\n\n" + "message:"
// 										+ request.responseText + "\n\n" + "error:" + error);

							},
							complete : function() {

								// 이미지 감추기 처리
								$('.wrap-loading').addClass('display-none');
// 								$("#addModal").modal("hide");

							}
						});						
					}					
				}
				
			});			
		} else {
			alert("다른 댓글이 수정 중입니다.");
		}
	}
		
	</script>
 	<div id="detailModalInfo">
 		<div id="detailModalBlankLine">&nbsp;</div>
 		<div id="detailModalInfoImg">
 			<img style="width:55px;" src="resources/images/Info.png"/>
 		</div>
 	</div>
    <div class="modal-content" id="detailContent">
					<div id="detailWrap">
					<div class="modal-header" id="header">
						<div id="closeimg"><a href="javascript:$('#knowhowDetail').modal('hide');"><img style="width:20px;" src="resources/images/close.png"/></a></div>
						<div id="detailTitle">${post.title }</div>
						<div id="createDate"><img style="width:30px;" src="resources/images/wDate.png">&nbsp;${post.wDate }</div>
						<div id="writer"><img src="resources/images/writer.png">&nbsp;<a href="#">${post.nickName }</a></div>
						<div id="modifyDelete"><a href="#"><img style="width:30px;" src="resources/images/modify.png"/></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img style="width:30px;" src="resources/images/delete.png"/></a></div>
						<div id="viewNum"><img src="resources/images/viewnumber.png"/>&nbsp;${post.count }</div>
					</div>

					<!-- Modal 상단-->
						<div id="detailCarousel" class="carousel slide" data-ride="carousel" data-interval="false">	
  							 <div class="carousel-inner" role="listbox">
  							 	<div class="item active">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m1" class="mdetail"></div>
												<iframe id="mediaiframe1" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaDetailImg" id="mediaImg1"/>
											</div>
											<div id="content_Text1" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media"class="mbackground">
												<div id="m2" class="mdetail" ></div>
												<iframe id="mediaiframe2" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaDetailImg" id="mediaImg2"/>
											</div>
											<div id="content_Text2" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m3" class="mdetail"  ></div>
												<iframe id="mediaiframe3" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaDetailImg" id="mediaImg3"/>
											</div>
											<div id="content_Text3" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m4" class="mdetail" ></div>
												<iframe id="mediaiframe4" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaDetailImg" id="mediaImg4"/>
											</div>
											<div id="content_Text4" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m5" class="mdetail"  ></div>
												<iframe id="mediaiframe5" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaDetailImg" id="mediaImg5"/>
											</div>
											<div id="content_Text5" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m6" class="mdetail"  ></div>
												<iframe id="mediaiframe6" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaDetailImg" id="mediaImg6"/>
											</div>
											<div id="content_Text6" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m7" class="mdetail"  ></div>
												<iframe id="mediaiframe7" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaDetailImg" id="mediaImg7"/>
											</div>
											<div id="content_Text7" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m8" class="mdetail"  ></div>
												<iframe id="mediaiframe8" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaDetailImg" id="mediaImg8"/>
											</div>
											<div id="content_Text8" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m9" class="mdetail"  ></div>
												<iframe id="mediaiframe9" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaDetailImg" id="mediaImg9"/>
											</div>
											<div id="content_Text9" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 	<div class="item">
										<div id="content">
											<div id="Media" class="mbackground">
												<div id="m10" class="mdetail"  ></div>
												<iframe id="mediaiframe10" class="mediaiframe" width="517" height="300" frameborder="0" allowfullscreen></iframe>
												<img class="mediaDetailImg" id="mediaImg10"/>
											</div>
											<div id="content_Text10" class="content_Text" style="overflow: auto; overflow-x:hidden;">
											</div>
										</div>
  							 	</div>
  							 </div>
						</div>
						<div id="tagline"></div>
						<div id="detailTag">
							<c:set var="isDoing" value="true"/> 					
							<c:forEach var="tags" items="${pTagList }" varStatus="status">
								<c:if test="${isDoing}">
									<span class="detailTags">#${tags.tag }</span>
									<c:if test="${status.index eq 19}"><c:set var="isDoing" value="false"/></c:if>
								</c:if>
							</c:forEach>							
						</div>
							<div id="footerContent">
								<div id="reply">
									<div id="replyNum">
									</div>
									<div id="replyImg">
										<a id="replycontent" href="#"><img	style="width:50px;" src="resources/images/comment.png"/></a>
									</div>
								</div>	
								<div id="recommen">
									<div id="recommenNum">
										${post.good }
									</div>
									<div id="recommenImg">
										<img style="width:50px; cursor: pointer;" onclick="setRecommendation()" src="resources/images/recomment.png"/>
									</div>
								</div>
							</div>
					</div>
				</div>
				<div id="pageMove">
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
				</div>
				<div id="commentContent" class="modal-content">
					<div id="replyDiv" style="overflow: auto; overflow-x:hidden;">
						
					</div>
					<form name="replyForm" action="" method="post" onsubmit="return false;">
						<div id="replyContent">

							<input type="text" class="form-control replybox" id="inputCom" name="reply">

							<div id="replybtndiv">
								<input type="button" id="replybtn"class="btn btn-success" onclick="addComment()" value="Comment Posting!"/>
							</div>
						</div>
					</form>	
				</div>